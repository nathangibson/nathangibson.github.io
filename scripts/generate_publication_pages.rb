#!/usr/bin/env ruby
# frozen_string_literal: true

# generate_publication_pages.rb
#
# Creates _publications/{slug}.md stub files for each entry in _data/publications.yaml.
# Files are created only if they do not already exist — never overwritten.
# Run from the repo root.

require 'yaml'
require 'fileutils'

PUBLICATIONS_FILE = '_data/publications.yaml'
OUTPUT_DIR        = '_publications'

def slugify(citation_key)
  citation_key
    .gsub(/[^a-zA-Z0-9\-]/, '-')
    .gsub(/-{2,}/, '-')
    .gsub(/\A-+|-+\z/, '')
end

def yaml_str(value)
  # Double-quote the value and escape internal backslashes and double-quotes.
  # This handles colons, Unicode, apostrophes, and leading " characters in titles.
  escaped = value.to_s.gsub('\\', '\\\\').gsub('"', '\\"')
  "\"#{escaped}\""
end

data = YAML.load_file(PUBLICATIONS_FILE)
refs = data['references'] || []

FileUtils.mkdir_p(OUTPUT_DIR)

created = 0
skipped = 0
errors  = 0

refs.each do |pub|
  citation_key = pub['citation-key']

  if citation_key.nil? || citation_key.strip.empty?
    warn "  [WARN] Entry missing citation-key, skipping: #{pub['id']}"
    errors += 1
    next
  end

  slug     = slugify(citation_key)
  out_path = File.join(OUTPUT_DIR, "#{slug}.md")

  if File.exist?(out_path)
    puts "  [SKIP] #{out_path}"
    skipped += 1
    next
  end

  title = pub['title'] || citation_key

  content = [
    '---',
    'layout: publication',
    "citation-key: #{yaml_str(citation_key)}",
    "title: #{yaml_str(title)}",
    '---',
    ''
  ].join("\n")

  File.write(out_path, content)
  puts "  [CREATE] #{out_path}"
  created += 1
end

puts "\nDone. Created: #{created}, Skipped (already exist): #{skipped}" + \
     (errors > 0 ? ", Errors: #{errors}" : '')
