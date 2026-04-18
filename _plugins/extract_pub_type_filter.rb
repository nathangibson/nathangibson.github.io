module Jekyll
  module ExtractPubTypeFilter
    def extract_pub_type(pub)
      return nil unless pub.is_a?(Hash) && pub['tags']

      pub['tags'].each do |tag|
        if tag.is_a?(String) && tag.include?('type: ')
          return tag.sub('type: ', '')
        end
      end

      nil
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExtractPubTypeFilter)
