Jekyll::Hooks.register :site, :post_read do |site|
  script_path = File.join(site.source, 'scripts', 'extract_image_credits.rb')
  system("ruby #{script_path}")
end
