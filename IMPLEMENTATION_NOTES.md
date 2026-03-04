# Implementation Notes

## File structure

- `/Users/stellaclemens/november-preston-demo/index.html` (Home)
- `/Users/stellaclemens/november-preston-demo/about/index.html`
- `/Users/stellaclemens/november-preston-demo/ecotherapy/index.html`
- `/Users/stellaclemens/november-preston-demo/faq/index.html`
- `/Users/stellaclemens/november-preston-demo/contact/index.html`
- `/Users/stellaclemens/november-preston-demo/styles.css` (shared styling for all pages)
- `/Users/stellaclemens/november-preston-demo/assets/*` (existing image assets reused)

## What changed

- Replaced the single-page anchor architecture with a 5-page static route structure.
- Updated global navigation on every page to use page routes as primary destinations:
  - `Home`, `About`, `Ecotherapy`, `FAQ`, `Contact`
- Removed single-page-only scroll/anchor script behavior.
- Built page-specific content for all required pages while preserving the existing visual direction:
  - lavender-forward palette
  - queer-first language
  - therapist portrait trust cues
  - clean hierarchy and low clutter
- Consolidated shared responsive styling in `styles.css` and kept mobile/tablet/desktop support.
- Added SEO metadata per page:
  - unique `<title>`
  - unique meta description
  - canonical URL
  - Open Graph + Twitter basic tags
- Added JSON-LD:
  - `Person` + `ProfessionalService` on all pages
  - `FAQPage` on `/faq/`
- Added/kept accessibility-oriented structure and behavior:
  - skip link
  - visible focus styles
  - semantic heading order
  - one `h1` per page
  - keyboard-friendly native `details/summary` FAQ pattern
  - reduced-motion handling in CSS
- Kept SimplePractice consult flow as the primary contact path and added a clear insertion-point note in `contact/index.html` for account-specific widget values.

## Remaining TODOs

- If this site is deployed on a domain other than `https://www.novemberpreston.com`, update canonical and social metadata URLs.
- If SimplePractice account values change, replace the `data-spwidget-*` attributes in `index.html` and `contact/index.html`.

## How to run locally

1. `cd /Users/stellaclemens/november-preston-demo`
2. `python3 -m http.server 4173`
3. Open:
   - `http://127.0.0.1:4173/`
   - `http://127.0.0.1:4173/about/`
   - `http://127.0.0.1:4173/ecotherapy/`
   - `http://127.0.0.1:4173/faq/`
   - `http://127.0.0.1:4173/contact/`
