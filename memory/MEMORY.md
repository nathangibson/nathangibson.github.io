# Site Memory

## Site overview
Jekyll personal/academic site (nathangibson.github.io). Beautiful Jekyll 6 + Bootstrap 4.5.3. Custom GitHub Actions build pipeline.

## Key systems
- **Publications** — Zotero API → `_data/publications.yaml` + `_data/citations.yaml`. See `memory/publications.md`
- **Image credits** — EXIF → `_data/image_credits.yaml`. See `memory/image-credits.md`

## Build pipeline (ci.yml)
1. Install exiftool
2. `ruby scripts/fetch_zotero_citations.rb` (Zotero → citations.yaml)
3. `ruby scripts/extract_image_credits.rb` (EXIF → image_credits.yaml)
4. `bundle exec appraisal jekyll build`

## Conventions
- Bootstrap utilities preferred over custom CSS
- Bracket notation for hyphenated YAML keys: `pub['citation-key']`
- `_data/*.yaml` are committed to git (offline-safe builds)
- `_plugins/` — custom Liquid filters go here
- `_includes/` — reusable partials; `page.html` supports `before-content`/`after-content` hooks
