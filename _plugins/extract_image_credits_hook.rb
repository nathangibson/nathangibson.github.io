Jekyll::Hooks.register :site, :post_read do |site|
  script_path = File.join(site.source, 'scripts', 'extract_image_credits.rb')
  yaml_path = File.join(site.source, '_data', 'image_credits.yaml')

  # Only run extraction if:
  # 1. YAML file doesn't exist (first run), OR
  # 2. Any .xmp file is newer than the YAML (metadata was edited)

  should_extract = false

  unless File.exist?(yaml_path)
    should_extract = true
  else
    yaml_mtime = File.mtime(yaml_path)
    # Check all .xmp files for newer mtime
    Dir.glob(File.join(site.source, '**', '*.xmp')).each do |xmp_file|
      if File.mtime(xmp_file) > yaml_mtime
        should_extract = true
        break
      end
    end
  end

  system("ruby #{script_path}") if should_extract
end
