require 'nokogiri'

module Jekyll
  module FootnotePopoversFilter
    MAX_POPOVER_TEXT = 280

    def add_footnote_popovers(html)
      doc = Nokogiri::HTML::DocumentFragment.parse(html)

      # ── Build map: "fn:1" => popover body HTML ────────────────────────
      footnote_content = {}
      doc.css('div.footnotes li').each do |li|
        id = li['id']
        next unless id

        p_node = li.at_css('p')
        next unless p_node

        content = p_node.clone
        content.css('a.reversefootnote').remove

        # Use full inner HTML when short; fall back to truncated plain text
        text = content.text.strip
        if text.length > MAX_POPOVER_TEXT
          cropped = text[0, MAX_POPOVER_TEXT].sub(/\s\S+\z/, '') + '…'
          body_html = cropped
        else
          body_html = content.inner_html.strip
        end

        body_html += %(<a href="##{id}" class="d-block small mt-1">Go to footnote ↓</a>)
        footnote_content[id] = body_html
      end

      # ── Replace each inline reference with a popover trigger ──────────
      doc.css('sup[id^="fnref:"] a.footnote').each do |a|
        fn_id = a['href']&.delete_prefix('#')
        next unless fn_id && footnote_content[fn_id]

        a.remove_attribute('class')
        a.remove_attribute('rel')
        a['class']          = 'badge badge-secondary footnote-popover'
        a['tabindex']       = '0'
        a['role']           = 'button'
        a['data-toggle']    = 'popover'
        a['data-trigger']   = 'click'
        a['data-placement'] = 'auto'
        a['data-html']      = 'true'
        a['data-container'] = 'body'
        a['data-content']   = footnote_content[fn_id]
      end

      doc.to_html
    end
  end
end

Liquid::Template.register_filter(Jekyll::FootnotePopoversFilter)
