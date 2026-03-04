# November Preston Static Site Demo

Multi-page static prototype for November Preston's practice website. No build step required.

## Scope

This repo now includes a complete 5-page site covering the core live-site territory:

- `/` (Home)
- `/about/`
- `/ecotherapy/`
- `/faq/`
- `/contact/`

The implementation keeps the current lavender-forward design language while improving semantic structure, accessibility behavior, and technical SEO.

## Primary goals

- Keep queer-first, trauma-informed messaging with clear hierarchy.
- Preserve therapist portrait trust cues and minimal visual clutter.
- Use route-based global navigation (no primary section-anchor nav).
- Keep SimplePractice scheduling as the primary consultation flow.
- Improve WCAG support and mobile/tablet/desktop responsiveness.
- Ensure static-host friendliness with clean relative paths.

## Run locally

1. `cd /Users/stellaclemens/november-preston-demo`
2. `python3 -m http.server 4173`
3. Open:
   - `http://127.0.0.1:4173/`
   - `http://127.0.0.1:4173/about/`
   - `http://127.0.0.1:4173/ecotherapy/`
   - `http://127.0.0.1:4173/faq/`
   - `http://127.0.0.1:4173/contact/`

## Key files

- `index.html` (Home)
- `about/index.html`
- `ecotherapy/index.html`
- `faq/index.html`
- `contact/index.html`
- `styles.css` (shared design system + responsive behavior)
- `assets/` (local images)
- `IMPLEMENTATION_NOTES.md` (change log and QA summary)

## SEO and structured data

Implemented per page:

- Unique `<title>`
- Unique meta description
- Canonical URL
- Open Graph basics
- Twitter card basics
- Internal links across relevant pages

Structured data:

- `Person` + `ProfessionalService` JSON-LD on all pages
- `FAQPage` JSON-LD on `/faq/`

## Accessibility notes

Implemented:

- One `h1` per page with valid heading order
- Skip link (`Skip to main content`)
- Keyboard-reachable nav/controls
- Visible focus styles
- Native `details/summary` FAQ interaction
- Reduced-motion handling

Automated checks:

- axe (`wcag2a`, `wcag2aa`, `wcag22aa`) run on all five pages with zero automatic violations.

Manual checks still recommended for:

- Keyboard flow comfort/cognitive load
- Cross-browser behavior of third-party SimplePractice modal

## SimplePractice integration

SimplePractice modal scheduling is wired via account-specific autobind attributes (`data-spwidget-*`).

- Primary consult CTAs on Home/About/Ecotherapy/FAQ/Contact are modal-trigger enabled.
- Script source:
  - `https://widget-cdn.simplepractice.com/assets/integration-1.0.js`

If account values change, update the `data-spwidget-scope-id`, `data-spwidget-scope-uri`, and `data-spwidget-application-id` attributes where used.

## Deployment

This project is plain static HTML/CSS and can be deployed as-is to Netlify, Cloudflare Pages, GitHub Pages, or similar static hosting.
