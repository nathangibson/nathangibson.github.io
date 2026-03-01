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

  def initialize(test_mode: false)
    @test_mode = test_mode
    @fetched_count = 0
    @cached_count = 0
    @failed_count = 0
    @log = []
    @cache = load_cache
    @all_bibliographies = nil
  end

  def run
    publications = load_publications
    return if publications.nil? || publications['references'].nil?

    log_message("Starting Zotero citation fetch (#{@test_mode ? 'TEST MODE' : 'FULL RUN'})")
    log_message("Found #{publications['references'].size} publications to process")

    # Fetch all bibliographies once
    log_message("Fetching bibliographies from Zotero API...")
    fetch_all_bibliographies

    refs = @test_mode ? publications['references'].first(5) : publications['references']

    refs.each do |publication|
      fetch_citation_for(publication)
    end

    # Save updated publications
    save_publications(publications)

    # Save cache
    save_cache

    # Write log
    write_log_file

    print_summary
  end

  private

  def fetch_all_bibliographies
    uri = URI(BASE_URL)
    uri.query = URI.encode_www_form({
      format: 'bib',
      style: STYLE
    })

    request = Net::HTTP::Get.new(uri)
    request['User-Agent'] = 'Jekyll-Zotero-Fetcher'

    response = nil
    begin
      Timeout.timeout(TIMEOUT_SECONDS) do
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          response = http.request(request)
        end
      end
    rescue Timeout::Error
      log_message("ERROR: Request timeout fetching bibliographies")
      @all_bibliographies = nil
      return
    rescue StandardError => e
      log_message("ERROR: Network error fetching bibliographies - #{e.message}")
      @all_bibliographies = nil
      return
    end

    if response.is_a?(Net::HTTPSuccess)
      @all_bibliographies = response.body
      log_message("Successfully fetched #{count_bibliography_entries(@all_bibliographies)} bibliography entries")
    else
      log_message("ERROR: API returned status #{response.code}")
      @all_bibliographies = nil
    end
  end

  def count_bibliography_entries(html)
    html.scan(/<div class="csl-entry"/).count
  end

  def fetch_citation_for(publication)
    title = publication['title']
    authors = publication['author']
    issued = publication['issued']
    citation_key = publication['citation-key']

    return if citation_key.nil? || citation_key.empty?

    # Check cache first
    if @cache[citation_key]
      publication['chicago-bibliography'] = @cache[citation_key]
      @cached_count += 1
      log_message("  [CACHE] #{citation_key}")
      return
    end

    return unless @all_bibliographies

    # Try to match in bibliographies
    citation = find_matching_citation(title, authors, issued)

    if citation
      publication['chicago-bibliography'] = citation
      @cache[citation_key] = citation
      @fetched_count += 1
      log_message("  [FETCHED] #{citation_key}")
    else
      @failed_count += 1
      log_message("  [NOT FOUND] #{citation_key} - could not match to bibliography")
    end
  end

  def find_matching_citation(title, authors, issued)
    return nil unless @all_bibliographies

    # Extract all <div class="csl-entry"> sections
    entries = @all_bibliographies.scan(/<div class="csl-entry"[^>]*>(.*?)<\/div>/m)

    # Clean up and normalize title for comparison
    normalized_title = normalize_for_matching(title) if title

    entries.each do |match|
      citation_text = match[0]
      # Decode HTML entities
      citation_text = CGI.unescapeHTML(citation_text)
      # Remove HTML tags
      citation_text = citation_text.gsub(/<[^>]*>/, '')
      # Clean up whitespace
      citation_text = clean_citation_text(citation_text)

      # Strategy 1: Match by author + year (most reliable)
      if authors && issued && author_year_match?(authors, issued, citation_text)
        return citation_text
      end

      # Strategy 2: Match by significant title portion
      if normalized_title && title_match?(normalized_title, citation_text)
        return citation_text
      end

      # Strategy 3: Match by author alone (for items without  year)
      if authors && !issued && author_match?(authors, citation_text)
        # Make sure year doesn't mismatch if it exists
        return citation_text
      end
    end

    nil
  end

  def normalize_for_matching(title)
    # Remove special characters, normalize spaces
    title.downcase
      .gsub(/[^\w\s]/, '')
      .gsub(/\s+/, ' ')
      .strip
  end

  def author_year_match?(authors, issued, citation_text)
    return false unless authors.is_a?(Array) && authors.size > 0

    # Get first author's family name
    first_author = authors[0]
    return false unless first_author.is_a?(Hash)

    author_name = first_author['family']
    return false unless author_name && citation_text.include?(author_name)

    # Get year
    year = nil
    if issued.is_a?(Array) && issued[0]
      year = issued[0]['year']&.to_s || issued[0]['literal']&.to_s
    end

    # Both author and year should match
    return false if year.nil?
    return citation_text.include?(year)
  end

  def author_match?(authors, citation_text)
    return false unless authors.is_a?(Array) && authors.size > 0

    first_author = authors[0]
    return false unless first_author.is_a?(Hash)

    author_name = first_author['family']
    return false unless author_name

    citation_text.include?(author_name)
  end

  def title_match?(normalized_title, citation_text)
    return false unless normalized_title && !normalized_title.empty?

    normalized_citation = normalize_for_matching(citation_text)

    # Check if significant portion of title is in citation
    # Split title into words and check if most are present
    title_words = normalized_title.split
    return false if title_words.empty?

    # Require at least 70% of significant words to match
    significant_words = title_words.select { |w| w.length > 3 }
    return false if significant_words.empty?

    matches = significant_words.count { |w| normalized_citation.include?(w) }
    matches >= (significant_words.length * 0.7).ceil
  end

  def extract_citation_from_html(html, citation_key)
    # Zotero API returns HTML like:
    # <div class="csl-entry" id="item-key">Author Name, "Title," Journal...</div>
    # We need to extract the text content and clean it

    begin
      # Find the csl-entry div and extract text
      # Pattern: <div class="csl-entry"...>TEXT</div>
      match = html.match(/<div class="csl-entry"[^>]*>(.*?)<\/div>/m)
      return nil unless match

      citation_text = match[1]
      # Decode HTML entities
      citation_text = CGI.unescapeHTML(citation_text)
      # Remove HTML tags
      citation_text = citation_text.gsub(/<[^>]*>/, '')
      # Clean up whitespace
      citation_text = clean_citation_text(citation_text)

      citation_text.empty? ? nil : citation_text
    rescue StandardError => e
      log_message("    ERROR: Failed to parse HTML - #{e.message}")
      nil
    end
  end

  def clean_citation_text(text)
    # Remove extra whitespace and normalize
    text.gsub(/\s+/, ' ').strip
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

    begin
      YAML.load_file(CACHE_FILE) || {}
    rescue StandardError => e
      log_message("WARNING: Failed to load cache - #{e.message}")
      {}
    end
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
    puts "Mode: #{@test_mode ? 'TEST (5 items)' : 'FULL RUN'}"
    puts "Fetched: #{@fetched_count} from API"
    puts "Cached:  #{@cached_count} from cache"
    puts "Failed:  #{@failed_count}"
    puts "Total:   #{@fetched_count + @cached_count}"
    puts "=" * 60
    puts "Log written to: #{LOG_FILE}"
    puts "Cache written to: #{CACHE_FILE}"
  end
end

# Main execution
if __FILE__ == $PROGRAM_NAME
  test_mode = ARGV.include?('--test')
  fetcher = ZoteroCitationFetcher.new(test_mode: test_mode)
  fetcher.run
end
