#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'yaml'
require 'timeout'
require 'cgi'
require 'json'

class ZoteroCitationFetcher
  ZOTERO_GROUP = '1114225'
  BASE_URL = "https://api.zotero.org/groups/#{ZOTERO_GROUP}/items"
  STYLE = 'chicago-fullnote-bibliography'
  CACHE_FILE = '.zotero_citations_cache.yml'
  LOG_FILE = '.zotero_fetch_log.txt'
  TIMEOUT_SECONDS = 10
  PAGE_LIMIT = 100

  def initialize(test_mode: false, clear_cache: false)
    @test_mode = test_mode
    @clear_cache = clear_cache
    @fetched_count = 0
    @cached_count = 0
    @failed_count = 0
    @log = []
    @cache = load_cache

    if @clear_cache
      @cache = {}
      log_message("Cache cleared - will refetch all citations")
    end
  end

  def run
    publications = load_publications
    return if publications.nil? || publications['references'].nil?

    log_message("Starting Zotero citation fetch (#{@test_mode ? 'TEST MODE' : 'FULL RUN'})")
    log_message("Found #{publications['references'].size} publications to process")

    log_message("Fetching items with bibliography from Zotero API...")
    url_to_bib = fetch_url_bib_map

    if url_to_bib.nil?
      log_message("ERROR: Failed to fetch Zotero items. Aborting.")
      return
    end

    log_message("Built URL map with #{url_to_bib.size} entries")

    refs = @test_mode ? publications['references'].first(5) : publications['references']

    refs.each do |publication|
      match_citation(publication, url_to_bib)
    end

    save_publications(publications)
    save_cache
    write_log_file
    print_summary
  end

  private

  # Fetches all Zotero items (paginated) and returns a Hash of normalized URL => bib string.
  def fetch_url_bib_map
    url_to_bib = {}
    start = 0

    loop do
      uri = URI(BASE_URL)
      uri.query = URI.encode_www_form(
        format: 'json',
        include: 'bib,data',
        style: STYLE,
        limit: PAGE_LIMIT,
        start: start
      )

      response = make_request(uri)
      return nil if response.nil?

      items = JSON.parse(response.body)
      break if items.empty?

      items.each do |item|
        url = item.dig('data', 'url').to_s.strip
        bib = item.dig('bib')

        next if url.empty? || bib.nil?

        bib_text = extract_bib_text(bib)
        url_to_bib[normalize_url(url)] = bib_text if bib_text
      end

      total = response['Total-Results'].to_i
      start += items.size
      break if start >= total
    end

    url_to_bib
  end

  def match_citation(publication, url_to_bib)
    citation_key = publication['citation-key']
    return if citation_key.nil? || citation_key.empty?

    if @cache[citation_key]
      publication['chicago-bibliography'] = @cache[citation_key]
      @cached_count += 1
      log_message("  [CACHE] #{citation_key}")
      return
    end

    url = publication['URL'].to_s.strip
    if url.empty?
      @failed_count += 1
      log_message("  [NO URL] #{citation_key} - skipping, no URL field")
      return
    end

    bib = url_to_bib[normalize_url(url)]

    if bib
      publication['chicago-bibliography'] = bib
      @cache[citation_key] = bib
      @fetched_count += 1
      log_message("  [FETCHED] #{citation_key}")
    else
      @failed_count += 1
      log_message("  [NOT FOUND] #{citation_key} - no Zotero item matched URL: #{url}")
    end
  end

  # Strip trailing slashes and downcase for reliable comparison.
  def normalize_url(url)
    url.downcase.sub(%r{/+\z}, '')
  end

  # Extract plain text from the HTML <div class="csl-entry"> Zotero returns.
  def extract_bib_text(html)
    match = html.match(/<div class="csl-entry"[^>]*>(.*?)<\/div>/m)
    return nil unless match

    text = CGI.unescapeHTML(match[1])
    text = text.gsub(/<[^>]*>/, '')
    text = text.gsub(/\s+/, ' ').strip
    text.empty? ? nil : text
  end

  def make_request(uri)
    request = Net::HTTP::Get.new(uri)
    request['User-Agent'] = 'Jekyll-Zotero-Fetcher'
    request['Zotero-API-Version'] = '3'

    Timeout.timeout(TIMEOUT_SECONDS) do
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        response = http.request(request)
        unless response.is_a?(Net::HTTPSuccess)
          log_message("ERROR: API returned status #{response.code} for #{uri}")
          return nil
        end
        return response
      end
    end
  rescue Timeout::Error
    log_message("ERROR: Request timed out for #{uri}")
    nil
  rescue StandardError => e
    log_message("ERROR: Network error - #{e.message}")
    nil
  end

  def load_publications
    pub_file = '_data/publications.yaml'
    return nil unless File.exist?(pub_file)

    YAML.load_file(pub_file)
  rescue StandardError => e
    log_message("ERROR: Failed to load publications - #{e.message}")
    nil
  end

  def save_publications(publications)
    pub_file = '_data/publications.yaml'
    File.write(pub_file, publications.to_yaml)
    log_message("Saved updated publications to #{pub_file}")
  rescue StandardError => e
    log_message("ERROR: Failed to save publications - #{e.message}")
  end

  def load_cache
    return {} unless File.exist?(CACHE_FILE)

    YAML.load_file(CACHE_FILE) || {}
  rescue StandardError => e
    log_message("WARNING: Failed to load cache - #{e.message}")
    {}
  end

  def save_cache
    File.write(CACHE_FILE, @cache.to_yaml)
  rescue StandardError => e
    log_message("ERROR: Failed to save cache - #{e.message}")
  end

  def write_log_file
    File.write(LOG_FILE, @log.join("\n"))
  rescue StandardError => e
    warn "ERROR: Failed to write log file - #{e.message}"
  end

  def log_message(message)
    @log << message
    puts message
  end

  def print_summary
    puts "\n" + "=" * 60
    puts "ZOTERO CITATION FETCH SUMMARY"
    puts "=" * 60
    puts "Mode:    #{@test_mode ? 'TEST (5 items)' : 'FULL RUN'}"
    puts "Cache:   #{@clear_cache ? 'CLEARED (full refresh)' : 'ENABLED'}"
    puts "Fetched: #{@fetched_count} from API"
    puts "Cached:  #{@cached_count} from cache"
    puts "Failed:  #{@failed_count}"
    puts "Total:   #{@fetched_count + @cached_count}"
    puts "=" * 60
    puts "Log written to:   #{LOG_FILE}"
    puts "Cache written to: #{CACHE_FILE}"
  end
end

# Main execution
if __FILE__ == $PROGRAM_NAME
  test_mode   = ARGV.include?('--test')
  clear_cache = ARGV.include?('--clear-cache')
  fetcher = ZoteroCitationFetcher.new(test_mode: test_mode, clear_cache: clear_cache)
  fetcher.run
end