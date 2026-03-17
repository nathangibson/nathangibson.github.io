# frozen_string_literal: true

# _plugins/image_credit.rb
#
# Liquid filters for looking up image credits from _data/image_credits.yaml.
#
# Filters:
#   image_credit_key  — "/img/bnf-ar-12-x1000.jpg" → "bnf-ar-12-x1000"
#   image_credit      — "/img/bnf-ar-12.jpg"        → { "credit" => "...", ... }

module Jekyll
  module ImageCreditFilter
    # Returns the lookup key for a given image URL: strips path and extension.
    def image_credit_key(url)
      File.basename(url.to_s, '.*')
    end

    # Returns the credit hash for a given image URL, or {} if not found.
    def image_credit(url)
      key = image_credit_key(url)
      site = @context.registers[:site]
      site.data.dig('image_credits', key) || {}
    end
  end
end

Liquid::Template.register_filter(Jekyll::ImageCreditFilter)
