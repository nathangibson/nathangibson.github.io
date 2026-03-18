# Publications System

## Summary
Publications card system with Zotero API integration for Chicago-style citations + individual publication pages at `/publications/{citation-key}/`.

## File structure
```
_data/
  publications.yaml      # 77 publications, CSL-JSON format (read-only Zotero export)
  citations.yaml         # Chicago citations keyed by citation-key (managed by fetch script)
_includes/
  publication-card.html  # Single card component (older, not used by publications-list)
  publication-body.html  # Shared: Chicago citation, DOI badge, attachments. Params: title_tag, title_class, wrapper_class. Reads pub + chicago_bib from parent scope.
  publications-list.html # Grid + filter buttons; cards link to /publications/{citation-key}/. Optional param: `tag` filters to publications with that tag.
_layouts/
  publication.html       # Individual publication page layout (extends page.html)
_publications/
  *.md                   # 77 stub files (committed to git, never auto-overwritten)
scripts/
  fetch_zotero_citations.rb     # Fetches Zotero API → _data/citations.yaml
  generate_publication_pages.rb # Creates _publications/{slug}.md stubs (idempotent)
  update_publications.sh        # Wrapper: runs both scripts. Use after Zotero re-export.
css/
  publications.scss      # Minimal custom SCSS (~80 lines), Bootstrap-first
.github/workflows/
  ci.yml                 # fetch_zotero_citations.rb runs before jekyll build
```

## Individual publication pages

### How they work
- Jekyll collection `publications` in `_config.yml`: `output: true`, `permalink: /publications/:name/`
- Each `_publications/{slug}.md` stub has: `layout: publication`, `citation-key`, `title` — body is blank for manual notes
- `_layouts/publication.html` looks up data at render time:
  ```liquid
  {%- assign pub = site.data.publications.references | where: "citation-key", ck | first -%}
  {%- assign cit = site.data.citations[ck] -%}
  ```
- Layout renders: cover image (thumbnail attachment), type badge, authors, year/venue, Chicago citation, abstract (`<details>`), DOI/URL buttons, attachments, back link, `<hr>`, `{{ content }}`
- `page.html` already renders `page.title` as `<h1>` — layout does NOT repeat the title

### Publication header images
- `_includes/header.html` checks for `page.citation-key` and automatically looks up `pub.attachments` with `title: "thumbnail"`
- Sets `page_cover_img` variable from `thumb.url`, used as fallback to `page.cover-img` (for non-publication pages)
- Rendered in header big-img section with `data-img-src-*` attributes; works without front matter modification
- Logic: `{% assign final_cover_img = page.cover-img | default: page_cover_img %}`

### Stub generation
- Script slug rule: `citation-key.gsub(/[^a-zA-Z0-9\-]/, '-').gsub(/-{2,}/, '-')`
- Three keys with special chars: `gibsonModelingBodyLiterature[accepted...]` → `gibsonModelingBodyLiterature-accepted...`, `j.jacob...` → `j-jacob...`
- Original citation-key stored verbatim in front matter for data lookup; slug is only for the URL/filename

### Card link
`publications-list.html` uses `site.publications | where: "citation-key", pub['citation-key'] | first` for the URL. Falls back to `pub.URL` if no page exists (no `target="_blank"` for internal links).

## Zotero / citations system
- `fetch_zotero_citations.rb` fetches Zotero group 1114225, matches by URL normalization, writes `_data/citations.yaml`
- Caches in `.zotero_citations_cache.yml`; `--clear-cache` forces full refresh; `--test` runs first 5 items
- Build is offline-safe: citations committed to git, no API dependency at build time
- Custom CSL style wraps titles with `|BEGIN_TITLE|`/`|END_TITLE|` sentinels
  - Cards replace sentinels with `<h5 class="card-title fw-bold">` tags
  - Publication layout strips sentinels with `| remove:` for plain text display
- Fallback: `pub['chicago-bibliography']` embedded in `publications.yaml` (also has sentinels)
- Liquid join: `site.data.citations[pub['citation-key']]['chicago-bibliography']`
- Better BibTeX postscript (`zotero-better-bibtex-attachments-postscript.js`) extracts attachments and tags to CSL export
  - Collections are not accessible in postscripts (library-level, not item-level)
  - Tags exported as `csl.tags` array in publications.yaml

## Issued date handling (Liquid — multiple YAML shapes from Zotero)
```liquid
{%- if pub.issued[0].year -%}        → most publications
{%- elsif pub.issued[0].literal -%}  → forthcoming, e.g. "[forthcoming 2027]"
```

## Workflow
```bash
./scripts/update_publications.sh          # fetch citations + generate new stubs
./scripts/update_publications.sh --test   # citations test mode + generate stubs
# Commit _data/citations.yaml and any new _publications/*.md files
```

## Key conventions
- Beautiful Jekyll 6 + Bootstrap 4.5.3 (`gap-2`, `fw-bold`, `me-2`, etc.)
- `pub['citation-key']` — bracket notation required (hyphens invalid in Liquid dot notation)
- `_data/publications.yaml` is never modified by any script
- `_publications/*.md` stubs are never overwritten once created
- CSS: minimal custom SCSS; use Bootstrap utilities for typography/spacing/layout
- Tag filtering: `publications-list.html` can be called with `tag=` parameter to show only publications with that tag (e.g., `{% include publications-list.html tag="group: publications" %}`)
- Type filters: Dynamically generated from Zotero tags prefixed with `type: ` (e.g., `type: book`, `type: article-journal`). Display name strips the prefix (e.g., "Book"). Other tags appear as secondary filters in a separate row.
