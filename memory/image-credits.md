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
- `_plugins/extract_image_urls_filter.rb` — Liquid filter `extract_image_urls`: scans rendered HTML for `<img src>`, CSS `url()`, and `data-image-credit-src` attrs; returns unique URL array
- `scripts/extract_image_credits.rb` — Parses XMP DC fields, joins arrays, maps to YAML
- `_plugins/image_credit.rb` — Liquid filters: `image_credit_key` (URL→key) and `image_credit` (URL→credit hash)
- `_includes/image-caption.html` — Renders image with interactive popover trigger button (or button only if caption_only=true). Emits `data-image-credit-src="{{ include.url }}"` on the button so auto-detection can find caption_only references.
- `_includes/image-credits-list.html` — `<details>` collapsible list for page-level credits
- `_includes/footer-scripts.html` — Bootstrap popover initialization script
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
Renders `<figure>` with image and interactive popover trigger button if any credit field exists; plain `<img>` if not.

**Popover behavior**:
- A minimalist image icon appears in the bottom-right corner of the image
- Icon is low-opacity (0.5) by default, increases to 1.0 on hover
- Click the icon to show caption as a Bootstrap popover below the image
- Popover contains formatted caption: "Image: [description]. By [creator]. [identifier]. Source: [publisher], [source_url]. [rights]."
- Click elsewhere or click again to close popover
- Icon uses Font Awesome "fa-regular fa-image" (1rem size)

#### Caption only (no image element)
```liquid
{% include image-caption.html url="/img/bnf-ar-12.jpg" caption_only=true %}
```
Renders only the popover trigger button without `<img>` or `<figure>`. Useful for CSS background images. If no metadata exists, renders nothing.

### Page credits list (automatic — preferred)
`page.html` (and layouts that extend it via `home.html`) automatically:
1. Scans `{{ content }}` for image URLs via `extract_image_urls` filter (`<img src>`, CSS `url()`, `data-image-credit-src`)
2. Prepends `page['cover-img']` if set (cover-img is rendered by `header.html`, not in `content`)
3. Calls `{% include image-credits-list.html images=_auto_imgs %}`

No front matter needed — just use `{% include image-caption.html %}` and CSS backgrounds normally.

### Page credits list (manual override, if needed)
If you need to specify an exact list (e.g., override auto-detection):
```liquid
{% assign imgs = "/img/a.jpg,/img/b.jpg" | split: "," %}
{% include image-credits-list.html images=imgs %}
```

> **Note**: `after-content: image-credits-list.html` with an `images:` front matter list is superseded by auto-detection. Don't use it on new pages.

## Architecture notes
- XMP sidecars are NOT served to web (excluded from _site/)
- Each size variant needs its own `.xmp` sidecar (e.g., `bnf-ar-12.jpg.xmp`, `bnf-ar-12-x1000.jpg.xmp`)
- Extraction only processes images with an `.xmp` sidecar present
- Arrays (creator, publisher) joined with `; ` in output
- URLs use abbreviated (domain-only) link text
- **Auto-detection in `page.html`**: `cover-img` is set as a CSS background via JS from `data-img-src-*` attrs in `header.html` — not an `<img>` tag and not in `content` — so it's handled explicitly via `page['cover-img']`. `caption_only=true` buttons emit `data-image-credit-src` so the filter can find them.
- CSS background crops (e.g., `bnf-ar-12-cr-x1000.jpg`) are auto-detected from inline styles; if they have an xmp sidecar they'll appear in the credits list; if not, silently skipped.

## Popover Styling & Interaction
Image captions are displayed as interactive Bootstrap popovers:
- **Icon placement**: Absolute overlay in bottom-right corner of figure element
- **Styling**: Uses only Bootstrap utility classes (`btn btn-sm border-0 bg-transparent position-absolute`) with minimal inline styles:
  - Positioning: `bottom: 0.5rem; right: 0.5rem; z-index: 10` (inline)
  - Opacity: `opacity: 0.5` (inline style, changes on hover for visual feedback)
  - Padding: `padding: 0.25rem 0.375rem` (inline)
  - No custom CSS file; all styling via Bootstrap classes and necessary inline properties
  - Font Awesome image icon (`fa-regular fa-image`) at default size
- **Interaction**: Click-triggered popovers (not hover)
- **Popover content**: HTML allowed (via `data-html="true"`) so caption links work
- **JavaScript**: Popover initialization in `_includes/footer-scripts.html` runs after Bootstrap/Popper.js load

## Troubleshooting
- **Double period**: If EXIF field value ends with punctuation (e.g., "C.E."), you'll see ".." in output. Remove trailing punctuation from EXIF values.
- **Image shows plain img**: Likely missing `.xmp` sidecar or sidecar has no DC fields set
- **XMP .xmp files appearing in _site/**: Check `_config.yml` exclude list includes `'**/*.xmp'`

