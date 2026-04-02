# TOC and Navbar

## TOC feature overview

Enabled per-page with `toc: true` in front matter. The `allejo/jekyll-toc` liquid include generates TOC HTML in `_layouts/page.html` via:
```liquid
{% capture _toc_html %}{% include toc.html html=content h_min=3 h_max=6 class="nav flex-column nav-pills small" item_class="nav-item" submenu_class="nav flex-column pl-3" anchor_class="nav-link py-1" sanitize=true skip_no_ids=true %}{% endcapture %}
```

The same TOC HTML is used two ways:

### 1. Sticky sidebar (`≥ lg`)
`<aside id="toc-nav" class="col-xl-2 col-lg-2 d-none d-lg-block sticky-top pt-5">` in `_layouts/page.html`. Bootstrap Scrollspy target.

### 2. Navbar dropdown (`< lg`)
`#toc-nav-row` — a `w-100 d-lg-none` second flex row in `_includes/nav.html`. Its `<div id="toc-dropdown-menu">` is populated by JS cloning `#toc-nav ul` at DOMContentLoaded.

## Scrollspy wiring (`_layouts/page.html` script block)

- `$('body').scrollspy({ target: '#toc-nav', offset: navbarHeight + 5 })`
- Event fires on **`$(window)`**, NOT `$('body')`, because `_scrollElement = window`
- `updateTocLabel()` — reads `$('#toc-nav .nav-link.active').last()`, updates `#toc-dropdown-label` text and mirrors `.active` to the cloned dropdown links
- Registered on `activate.bs.scrollspy` and `show.bs.dropdown`
- `$('body').scrollspy('refresh')` called on `window.load` (font/image load shifts positions)

## TOC navbar row fade-in

`#toc-nav-row` starts hidden (`max-height: 0; opacity: 0` in `assets/css/custom.css`) and fades in when the user scrolls past the first TOC heading.

**JS** (`updateTocRowVisibility` in page.html script):
- `getFirstAnchorTop()` — lazy-computes and caches the first heading's absolute doc offset (invalidated on `resize`)
- Uses same `offset` as Scrollspy (navbarHeight + 5) so row appears exactly when Scrollspy activates the first heading
- `$(window).on('scroll', updateTocRowVisibility)` + also called in `window.load` handler

**CSS** (in `assets/css/custom.css`):
```css
#toc-nav-row { max-height: 0; opacity: 0; transition: max-height 0.5s ease-in-out, opacity 0.5s ease-in-out; }
#toc-nav-row.toc-nav-row--visible { max-height: 8rem; opacity: 1; border-top: 1px solid #dee2e6; }
```
`overflow: hidden` (removed from CSS during a later fix — was on the element) is not needed since `max-height: 0` collapses the row.

Note: the `border-top` is on the visible state only in CSS (not as a Bootstrap class in HTML) — otherwise the 1px border bleeds through at `max-height: 0`.

## Navbar structure (`_includes/nav.html`)

```
<nav.navbar.navbar-expand-xl>
  [avatar-container]       ← position:absolute via custom.css; d-none d-lg-block on TOC pages
  <div.w-100.d-flex.align-items-center.flex-wrap>   ← first-row wrapper
    [navbar-brand]         ← conditional: two variants on TOC pages (d-lg-none / d-none d-lg-block)
    <button.navbar-toggler.ml-auto>   ← ml-auto pushes it right; flex-wrap on parent keeps it there when collapse opens
    <div#main-navbar.collapse.navbar-collapse>
      <ul.navbar-nav.ml-auto>
  </div>
  [navbar-extra]
  <div#toc-nav-row.w-100.d-lg-none>   ← TOC second row (flex-wrap wraps it to new row in navbar)
</nav>
```

Key structural decisions:
- **`flex-wrap` not `justify-content-between`** on the first-row wrapper: allows `#main-navbar.collapse` (`flex-basis: 100%`) to wrap to a new row instead of shoving the toggler to center; `ml-auto` on the toggler replaces `justify-content-between` for right-alignment
- **`w-100` on first-row wrapper and `#toc-nav-row`**: `<nav>` itself has `flex-wrap: wrap` (via `navbar-expand-xl` at `< xl`), so `w-100` children wrap to separate rows
- **Avatar**: `position: absolute` in `assets/css/custom.css` (overrides beautifuljekyll's centered-bottom default); `left: 1rem; top: 0.65rem; width: 4.5rem`; hidden on small screens (`d-none d-lg-block`) on TOC pages to avoid moving down when navbar grows

## Conditional brand rendering (TOC pages)

On `page.toc` pages with an avatar present, two brand links are rendered:
- `d-lg-none` variant: sidebar TOC not shown; brand link is bare (no `pl-5` offset)
- `d-none d-lg-block` variant: standard `pl-5` brand to clear the avatar

All other pages: single brand link with `pl-5` (or without, for `title-img` sites).
