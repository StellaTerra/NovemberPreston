# November Preston Practice Site

Multi-page static site for [NovemberPreston.com](https://novemberpreston.com), deployed with GitHub Pages.

This repo is moving to a Jekyll-driven content workflow so that non-technical edits (copy, trainings, FAQ entries, photos) can be made without rewriting page HTML.

## Scope

The site covers five core routes:

- `/` (Home)
- `/about/`
- `/ecotherapy/`
- `/faq/`
- `/contact/`

## Why Jekyll Here

We want:

- Static output (fast, SEO-friendly, no runtime waterfall)
- Reusable templates for shared layout/nav/footer
- Content managed in simple files (YAML + Markdown)
- Push-to-deploy on GitHub Pages

Jekyll renders everything at build time. The browser receives fully rendered HTML on first request.

## Planned Content Model

The intended structure is:

- `_layouts/` shared page shells (default layout, metadata scaffolding)
- `_includes/` shared partials (nav, footer, reusable sections)
- `_data/` per-page YAML content sources (for example `faq.yml`, `about.yml`)
- Route templates (`index.html`, `about/index.html`, etc.) with Liquid loops/variables
- `assets/` images and static media

### Markdown Inside YAML

For rich text fields inside YAML (lists, bold, links), store Markdown in a multiline field and render with `markdownify` in templates.

Example `_data/faq.yml`:

```yml
- q: Do you offer virtual sessions?
  a_md: |-
    Yes. I offer virtual sessions across California.

    This includes:
    - Video sessions
    - Flexible scheduling
    - **Secure** platform use
```

Template usage:

```html
{% for item in site.data.faq %}
  <details>
    <summary>{{ item.q }}</summary>
    <div>{{ item.a_md | markdownify }}</div>
  </details>
{% endfor %}
```

## Local Development

### Prerequisites (macOS)

1. Install modern Ruby:
   - `brew install ruby`
2. Add Ruby + user gem bin to your shell PATH (zsh):
   - `echo 'export PATH="/opt/homebrew/opt/ruby/bin:$HOME/.gem/ruby/4.0.0/bin:$PATH"' >> ~/.zshrc`
   - `source ~/.zshrc`
3. Install Jekyll tooling:
   - `gem install --user-install jekyll webrick --no-document`

### Run Dev Server

1. `cd /Users/stellaclemens/november-preston-demo`
2. `jekyll serve --host 127.0.0.1 --port 4000 --livereload`
3. Open:
   - `http://127.0.0.1:4000/`
   - `http://127.0.0.1:4000/about/`
   - `http://127.0.0.1:4000/ecotherapy/`
   - `http://127.0.0.1:4000/faq/`
   - `http://127.0.0.1:4000/contact/`

Generated artifacts are gitignored (`_site/`, `.jekyll-cache/`, `.jekyll-metadata`, `.sass-cache/`).

## Editing Workflow (Non-Technical)

Target workflow for November:

1. Edit content in `_data/*.yml` (or page Markdown files where applicable).
2. Add/replace images in `assets/`.
3. Commit changes in GitHub web UI.
4. GitHub Pages rebuilds and deploys automatically.

No direct HTML editing required for routine copy updates once templates/data are fully wired.

## SEO and Accessibility Goals

Maintain existing standards during migration:

- Unique `<title>` and meta description per route
- Canonical URLs and basic social metadata
- Structured data (`Person`, `ProfessionalService`, and `FAQPage` where relevant)
- One `h1` per page, valid heading order, keyboard accessibility, visible focus states

## SimplePractice Integration

SimplePractice modal scheduling is wired via `data-spwidget-*` attributes and:

- `https://widget-cdn.simplepractice.com/assets/integration-1.0.js`

If account values change, update widget data attributes where used.

## Deployment

The deployed site remains static content on GitHub Pages.

- Source control: GitHub
- Build: Jekyll on GitHub Pages
- Publish trigger: push to default branch (`main`)
- Domain: `novemberpreston.com`
