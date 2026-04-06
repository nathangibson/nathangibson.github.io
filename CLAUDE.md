# CLAUDE.md

Personal/academic site for Nathan Gibson. Built on Beautiful Jekyll 6 + Bootstrap 4.5.3, deployed via GitHub Actions.

For system details (publications, image credits, build pipeline), see `memory/MEMORY.md`.

## Rules

### Never modify or overwrite
- `_data/publications.yaml` — read-only Zotero export; never edited by scripts or manually
- `_publications/*.md` stubs — idempotent generation; once created, never overwritten

### CSS and styling
- Bootstrap utilities first (`gap-2`, `fw-bold`, `me-2`, etc.); custom SCSS only when Bootstrap can't do it
- Custom styles go in `css/` as `.scss` files

### Liquid / YAML
- Use bracket notation for hyphenated keys: `pub['citation-key']`, not `pub.citation-key`
- `_data/*.yaml` files are committed to git (build must work offline, no runtime API calls)

### Jekyll structure
- Custom Liquid filters → `_plugins/`
- Reusable partials → `_includes/`; layouts support `before-content` and `after-content` front matter hooks

### Data workflows
- After re-exporting from Zotero: run `./scripts/update_publications.sh`, then commit `_data/citations.yaml` and any new stubs
- After updating image EXIF/XMP: run `ruby scripts/extract_image_credits.rb`, then commit `_data/image_credits.yaml`
- XMP sidecar files (`.xmp`) are committed alongside images but excluded from `_site/`
