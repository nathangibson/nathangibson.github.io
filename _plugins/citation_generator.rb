require 'citeproc'
require 'csl/styles'

module Jekyll
  class CitationGenerator < Generator
    priority :low

    def generate(site)
      # Only process if publications data exists
      return unless site.data.key?('publications')

      publications = site.data['publications']
      return unless publications.is_a?(Hash) && publications.key?('references')

      # Initialize CiteProc processor with Chicago style
      processor = CiteProc::Processor.new(
        style: 'chicago-fullnote-bibliography',
        format: 'text'
      )

      # Process each publication entry
      publications['references'].each do |entry|
        next unless entry.is_a?(Hash)

        # Generate Chicago citations if not already present
        if !entry['chicago-bibliography'].nil? && !entry['chicago-note-full'].nil?
          # Citations already present from postscript, skip
          next
        end

        # Skip entries without required citation data
        next unless entry['id'] && (entry['author'] || entry['editor'])

        begin
          # Generate citations in different formats
          entry['chicago-bibliography'] = generate_chicago_bibliography(processor, entry)
          entry['chicago-note-full'] = generate_chicago_note_full(processor, entry)
          entry['chicago-note-short'] = generate_chicago_note_short(entry)
        rescue => e
          Jekyll.logger.warn("Citation generation error for entry #{entry['id']}: #{e.message}")
        end
      end

      site.data['publications'] = publications
    end

    private

    # Generate full Chicago bibliography entry
    def generate_chicago_bibliography(processor, entry)
      begin
        citation = processor.bibliography(entry)
        citation.to_s.strip if citation
      rescue => e
        Jekyll.logger.debug("Could not generate bibliography for #{entry['id']}: #{e.message}")
        nil
      end
    end

    # Generate full Chicago note (footnote) format
    def generate_chicago_note_full(processor, entry)
      begin
        # Chicago note style
        citation_data = entry.dup
        citation = processor.cite(entry['id'] || entry.first.to_s, citation_data)
        citation.to_s.strip if citation
      rescue => e
        Jekyll.logger.debug("Could not generate note for #{entry['id']}: #{e.message}")
        nil
      end
    end

    # Generate short Chicago note format (simplified, since citeproc may not have this directly)
    def generate_chicago_note_short(entry)
      # Create a short citation: Last name(s), Shortened Title, (Year)
      authors = format_authors_short(entry['author'] || entry['editor'])
      title = entry['title']
      year = extract_year(entry)

      if authors && title && year
        title_short = shorten_title(title)
        "#{authors}, \"#{title_short},\" (#{year})."
      elsif authors && year
        "#{authors} (#{year})."
      else
        nil
      end
    end

    # Format authors in short form (Last name(s) only)
    def format_authors_short(creators)
      return nil unless creators && creators.is_a?(Array) && !creators.empty?

      first_author = creators.first
      if first_author.is_a?(Hash)
        if first_author['family']
          return first_author['family']
        elsif first_author['literal']
          return first_author['literal']
        end
      end

      nil
    end

    # Shorten a title to first 5 words
    def shorten_title(title)
      words = title.split
      if words.length > 5
        words.first(5).join(' ') + '...'
      else
        title
      end
    end

    # Extract publication year from various CSL date formats
    def extract_year(entry)
      # Try issued date
      if entry['issued'] && entry['issued'].is_a?(Hash)
        if entry['issued']['date-parts'] && entry['issued']['date-parts'].is_a?(Array)
          year = entry['issued']['date-parts'].first&.first
          return year.to_s if year
        end
        # Try literal date
        if entry['issued']['literal']
          literal = entry['issued']['literal']
          # Extract year from literal like "[forthcoming 2027]" or "2022"
          match = literal.match(/(\d{4})/)
          return match[1] if match
        end
      end

      nil
    end
  end
end
