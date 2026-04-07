module Jekyll
  module NoteFieldsFilter
    # Parses structured key-value pairs from a publication's `note` field (Zotero Extra).
    #
    # Only lines where the key is all-lowercase are extracted, which avoids collisions
    # with Zotero-generated content like "Presenters: _:n137". Lines that don't match
    # the pattern are silently ignored.
    #
    # Example Extra field:
    #   thumbnail: astrolabe.jpg
    #   pdf: gibsonKnowledgeCollaborationJews2022.pdf
    #
    # Returns: {"thumbnail" => "astrolabe.jpg", "pdf" => "gibsonKnowledge...pdf"}
    #
    # Usage in Liquid:
    #   {% assign note = pub | note_fields %}
    #   {{ note["thumbnail"] }}
    def note_fields(pub)
      note = pub.is_a?(Hash) ? pub['note'] : nil
      return {} unless note.is_a?(String)

      result = {}
      note.each_line do |line|
        if (m = line.chomp.match(/\A([a-z][a-z0-9_-]*)\s*:\s*(.+)\z/))
          result[m[1]] = m[2].strip
        end
      end
      result
    end
  end
end

Liquid::Template.register_filter(Jekyll::NoteFieldsFilter)
