require 'nokogiri'

module Jekyll
  module ParagraphNumbersFilter
    def add_paragraph_numbers(html)
      doc = Nokogiri::HTML::DocumentFragment.parse(html)
      counter = 0

      # Only direct <p> children — skips blockquote, li, footnote div, etc.
      doc.children.each do |node|
        next unless node.name == 'p'

        # Skip paragraphs whose only content is badge spans (e.g. page markers)
        stripped = node.clone
        stripped.css('span.badge').remove
        next if stripped.text.strip.empty?

        counter += 1
        id = "p-#{counter}"

        wrapper = Nokogiri::XML::Node.new('div', doc)
        wrapper['class'] = 'd-flex align-items-baseline mb-3'
        wrapper['id'] = id

        num_span = Nokogiri::XML::Node.new('span', doc)
        num_span['class'] = 'flex-shrink-0 text-right text-muted small mr-3'

        num_link = Nokogiri::XML::Node.new('a', doc)
        num_link['href'] = "##{id}"
        num_link['class'] = 'text-muted'
        num_link['aria-label'] = "Paragraph #{counter}"
        num_link.content = counter.to_s

        existing = node['class'].to_s.split
        node['class'] = (existing + ['mb-0', 'flex-grow-1']).uniq.join(' ')

        num_span.add_child(num_link)
        node.replace(wrapper)
        wrapper.add_child(num_span)
        wrapper.add_child(node)
      end

      doc.to_html
    end
  end
end

Liquid::Template.register_filter(Jekyll::ParagraphNumbersFilter)
