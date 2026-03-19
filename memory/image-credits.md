# Image Credits System

## Overview
**XMP-only** EXIF-based image credit system. Source of truth: Darktable-generated `.xmp` sidecars → `_data/image_credits.yaml` → Jekyll Liquid filters → includes.

## Why XMP-only
- Metadata lives in `.xmp` sidecars (not embedded in images)
- Darktable's native format
- Dublin Core fields provide richer semantics
- XMP sidecars excluded from `_site/` (added to `_config.yml` exclude list)
- Both image file and sidecar committed to git together (no separation risk for git workflows)

## Pipeline
1. Darktable edits `dc:*` fields in `.xmp` sidecar files
2. **Smart automatic extraction via Jekyll hook** (`_plugins/extract_image_credits_hook.rb`):
   - Runs on every `jekyll build` / `jekyll serve`
   - **Only extracts if** `.xmp` files are newer than `_data/image_credits.yaml` (or YAML doesn't exist)
   - Skips extraction when editing markdown/HTML (no metadata changes)
   - Build time: ~0.9s for normal edits, ~3.8s when metadata changed
   - CI also runs extraction independently (redundancy)
3. Jekyll reads YAML at build time via `image_credit` Liquid filter
4. Includes render formatted captions (inline or page-level list)

## EXIF field mapping
| XMP DC Field | YAML Key | Notes |
|---|---|---|
| `dc:description` | `description` | What the image shows (narrative) |
| `dc:creator` | `creator` | Photographer/artist (array, joined with `;`) |
| `dc:identifier` | `identifier` | Structured ID (e.g., MS call number) |
| `dc:publisher` | `publisher` | Institution/source (array, joined with `;`) |
| `dc:source` | `source_url` | URL to original/source |
| `dc:rights` | `rights` | License/rights statement |

## Caption format (conditional rendering)
```
Image: [description]. By [creator]. [identifier]. Source: [publisher], [source_url]. [rights].
```

Rendering logic:
- "Image:" always shown if description exists (otherwise skipped entirely)
- "By [creator]." shown if creator exists
- "[identifier]." shown if identifier exists
- "Source: [publisher], [URL]." shown if publisher or source_url exist (comma between them if both)
- "[rights]." shown if rights exists
- URLs abbreviated to domain and rendered as clickable links

No doubled punctuation: each prefix/field only appears if that field exists.

## Key files
- `_plugins/extract_image_credits_hook.rb` — Jekyll hook that auto-runs extraction on every build
- `scripts/extract_image_credits.rb` — Parses XMP DC fields, joins arrays, maps to YAML
- `_plugins/image_credit.rb` — Liquid filters: `image_credit_key` (URL→key) and `image_credit` (URL→credit hash)
- `_includes/image-caption.html` — Inline figure/figcaption for single image
- `_includes/image-credits-list.html` — `<details>` collapsible list for page-level credits
- `_data/image_credits.yaml` — Generated from XMP (committed to git for offline builds)
- `_config.yml` — Added `'**/*.xmp'` to exclude list

## Usage

### Automatic extraction (recommended)
When you run `jekyll build` or `jekyll server`, the hook automatically:
1. Checks if any `.xmp` files are newer than `_data/image_credits.yaml`
2. If yes → extracts metadata and regenerates YAML
3. If no → skips extraction (fast rebuild)

**Workflow in Darktable**:
1. Edit metadata for an image in Darktable (dc:description, dc:creator, etc.)
2. Darktable saves changes to `.xmp` sidecar (mtime updated)
3. Run `jekyll server` (or next rebuild)
4. Hook detects `.xmp` mtime > YAML mtime, extracts fresh metadata
5. Pages rebuild with updated captions

**Performance**: Editing markdown/HTML files triggers 0.9s rebuild (no extraction). Editing image metadata triggers 3.8s rebuild (extraction + render).

### Manual extraction
If desired, run the script directly:
```bash
ruby scripts/extract_image_credits.rb
```
This is what the Jekyll hook calls behind the scenes.

### Inline caption
```liquid
{% include image-caption.html url="/img/bnf-ar-12.jpg" alt="Manuscript folio" %}
```
Renders `<figure>/<figcaption>` if any credit field exists; plain `<img>` if not.

#### Caption only (no image element)
```liquid
{% include image-caption.html url="/img/bnf-ar-12.jpg" caption_only=true %}
```
Renders only the `<figcaption>` text without `<img>`. Useful when the image is a CSS background image or styled separately. If no metadata exists, renders nothing.

### Page credits list (after-content hook)
```yaml
after-content: image-credits-list.html
images:
  - /img/bnf-ar-12.jpg
  - /img/portrait-goethe.jpg
```

### Page credits list (inline)
```liquid
{% assign imgs = "/img/a.jpg,/img/b.jpg" | split: "," %}
{% include image-credits-list.html images=imgs %}
```

## Architecture notes
- XMP sidecars are NOT served to web (excluded from _site/)
- Each size variant needs its own `.xmp` sidecar (e.g., `bnf-ar-12.jpg.xmp`, `bnf-ar-12-x1000.jpg.xmp`)
- Extraction only processes images with an `.xmp` sidecar present
- Arrays (creator, publisher) joined with `; ` in output
- URLs use abbreviated (domain-only) link text

## Troubleshooting
- **Double period**: If EXIF field value ends with punctuation (e.g., "C.E."), you'll see ".." in output. Remove trailing punctuation from EXIF values.
- **Image shows plain img**: Likely missing `.xmp` sidecar or sidecar has no DC fields set
- **XMP .xmp files appearing in _site/**: Check `_config.yml` exclude list includes `'**/*.xmp'`

