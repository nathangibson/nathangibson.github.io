# frozen_string_literal: true

# _plugins/extract_image_urls_filter.rb
#
# Liquid filter: extract_image_urls(html) → Array of unique image URL strings
#
# Scans rendered HTML for:
#   - <img src="URL">
#   - Inline CSS url(URL) where URL has an image file extension
#   - data-image-credit-src="URL"  (emitted by image-caption.html caption_only buttons)
#
# Used by page.html to auto-build the image list for image-credits-list.html.

module Jekyll
  module ExtractImageUrlsFilter
    IMG_EXT = /\.(?:jpg|jpeg|png|gif|webp|svg|avif)/i.freeze

    def extract_image_urls(html)
      return [] if html.nil? || html.empty?

      urls = []

      # <img src="..."> / <img src='...'>
      html.scan(/<img\b[^>]*\bsrc=["']([^"']+)["']/) do |m|
        urls << m[0] unless m[0].start_with?("data:")
      end

      # background-image: url('...') etc. – image extensions only (skips gradients, fonts)
      html.scan(/url\(["']?([^"')\s]+#{IMG_EXT.source})["']?\)/i) do |m|
        urls << m[0]
      end

      # data-image-credit-src="..." on caption_only popover buttons
      html.scan(/\bdata-image-credit-src=["']([^"']+)["']/) do |m|
        urls << m[0]
      end

      urls.uniq
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExtractImageUrlsFilter)
