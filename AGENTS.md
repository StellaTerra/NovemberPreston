# November Preston Practice Site

## Who this workflow is for

- The site owner is a non-developer. Explain changes and choices in plain language.
- Codex is the normal interface for editing, previewing, checking, committing, and publishing this site.
- Do not require the owner to operate Git, Docker, Ruby, Bundler, Jekyll, or a terminal manually during routine work.

## Content and structure

- Routine page copy is stored in `_data/pages/*.yml`.
- Shared practice and site metadata is stored in `_data/site.yml`.
- Image metadata is stored in `_data/images.yml`; image files are stored in `assets/`.
- Reusable HTML is stored in `_includes/` and `_layouts/`.
- Preserve accessibility, responsive behavior, metadata, structured data, and the SimplePractice integration when changing templates or styles.
- Never add client names, session details, health information, or other PHI to the repository, prompts, logs, screenshots, commits, or published pages.

## Local preview

- Use `./scripts/preview` to start the owner-facing Docker preview.
- The preview is available at `http://127.0.0.1:4100/`; LiveReload uses port `35730`.
- These ports intentionally differ from the VS Code dev container's `4000` and `35729`.
- Use `./scripts/stop-preview` to stop the owner-facing preview.
- Do not replace these scripts with a native Ruby setup on the owner's Mac.

## Verification

- After changing site content or presentation, run `./scripts/check`.
- Review every affected route in the local browser. For shared layout, navigation, footer, or stylesheet changes, review all five public routes.
- Treat YAML, Liquid, Jekyll, missing assets, broken navigation, obvious responsive regressions, and accessibility regressions as failures to fix before publishing.
- Summarize what was checked in user-facing language.

## Git and publishing

- Direct publication from `main` is intentional for this repository. Do not create a branch or pull request unless the user explicitly asks for one.
- Routine owner work happens in the local checkout on `main`, not in a managed worktree.
- At the beginning of a new task, inspect `git status`. If the working tree is clean, update with `git pull --ff-only`. If it is not clean, preserve the existing work and do not pull across it without discussing the conflict.
- Editing and publishing are separate actions. Never commit or push merely because an edit is complete.
- Publish only when the user explicitly asks to publish, commit, or push.
- Before publishing, run `./scripts/check`, review the diff, make a concise descriptive commit on `main`, and push to `origin main`.
- Never force-push. If a push is rejected, explain why and resolve it without discarding work.
- A push to `main` deploys the production website automatically through GitHub Pages.
- To undo an already-published change, prefer `git revert`, run `./scripts/check`, and push the revert to `main` after user confirmation.
