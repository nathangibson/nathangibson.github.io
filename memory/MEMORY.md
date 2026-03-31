# Site Memory

## Site overview
Jekyll personal/academic site (nathangibson.github.io). Beautiful Jekyll 6 + Bootstrap 4.5.3. Custom GitHub Actions build pipeline. See `CLAUDE.md` for project rules/conventions.

## Key systems
- **Publications** — Zotero API → `_data/publications.yaml` + `_data/citations.yaml`. See `memory/publications.md`
- **Image credits** — EXIF → `_data/image_credits.yaml`. See `memory/image-credits.md`
- **Article text features** — opt-in per stub via front matter; `nokogiri` gem required
  - `paragraph-numbers: true` → `add_paragraph_numbers` filter (`_plugins/paragraph_numbers_filter.rb`): wraps top-level `<p>` in Bootstrap flex divs with linked numbers; skips badge-only paragraphs
  - `footnote-popovers: true` (default via `_config.yml`) → `add_footnote_popovers` filter (`_plugins/footnote_popovers_filter.rb`): replaces inline footnote refs with Bootstrap popovers; footnote list at bottom unchanged; opt out with `footnote-popovers: false`
  - Both filters applied in `_layouts/publication.html` via chained `assign`; order: popovers first, then paragraph numbers

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
- `custom.css` loads LAST in `_layouts/base.html` (after `beautifuljekyll.css`) so it overrides by cascade — no `!important` needed
