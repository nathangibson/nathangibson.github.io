module Jekyll
  module ParagraphNumbersFilter
    # Block containers whose <p> children should NOT be numbered
    SKIP_TAGS = %w[blockquote div ol ul li].freeze

    def add_paragraph_numbers(html)
      result = []
      counter = 0
      depth = 0        # nesting depth inside skip containers
      para_buffer = nil  # non-nil when buffering a top-level <p>

      html.scan(/(<[^>]+>|[^<]+)/m) do |match|
        token = match[0]

        # ── inside a top-level paragraph: buffer until </p> ──────────────
        if para_buffer
          para_buffer << token
          next unless token.start_with?('</') &&
                      token.match(/<\/?(\w+)/i)&.[](1)&.downcase == 'p'

          # Reached </p>. Decide whether to number this paragraph.
          open_tag  = para_buffer.first
          close_tag = para_buffer.last
          inner     = para_buffer[1..-2].join

          if badge_only_content?(inner)
            result.concat(para_buffer)
          else
            counter += 1
            id = "p-#{counter}"
            result << %(<div class="d-flex align-items-baseline mb-3" id="#{id}">)
            result << %(<span class="flex-shrink-0 text-right text-muted small mr-3"><a href="##{id}" class="text-muted" aria-label="Paragraph #{counter}">#{counter}</a></span>)
            if open_tag.include?('class=')
              result << open_tag.sub(/class="([^"]*)"/, 'class="\1 mb-0 flex-grow-1"')
            else
              result << open_tag.sub(/<p\b/, '<p class="mb-0 flex-grow-1"')
            end
            result.concat(para_buffer[1..-2])
            result << close_tag
            result << '</div>'
          end
          para_buffer = nil
          next
        end

        # ── normal scanning ───────────────────────────────────────────────
        if token.start_with?('<')
          tag_name = token.match(/<\/?(\w+)/i)&.[](1)&.downcase

          if SKIP_TAGS.include?(tag_name)
            if token.start_with?('</')
              depth -= 1 if depth > 0
            elsif !token.end_with?('/>')
              depth += 1
            end
            result << token

          elsif tag_name == 'p' && !token.start_with?('</')
            if depth.zero?
              para_buffer = [token]  # start buffering; decision deferred to </p>
            else
              result << token
            end

          else
            result << token
          end
        else
          result << token
        end
      end

      result.join
    end

    private

    # Returns true if the paragraph's inner HTML contains nothing
    # but badge spans (and whitespace) — i.e., no prose content.
    def badge_only_content?(inner)
      inner.gsub(/<span[^>]*class="[^"]*\bbadge\b[^"]*"[^>]*>.*?<\/span>/m, '')
           .gsub(/<[^>]+>/, '')
           .strip
           .empty?
    end
  end
end

Liquid::Template.register_filter(Jekyll::ParagraphNumbersFilter)
