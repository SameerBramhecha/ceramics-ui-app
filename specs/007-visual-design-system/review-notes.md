# Visual Review Notes — Visual Design System

**Created**: 2026-09-20

Summary:

- Buttons and Card components implemented using design tokens in `src/components/*.css`.
- GalleryCard and App styles updated to reference `src/styles/design-tokens.css`.

Findings:

- Visual tokens apply reasonably; confirm image edge-cases and responsive scales in a browser.
- Accessibility: run contrast checks on `--color-accent` against `--color-neutral-100` and body text against `--color-neutral-900`.

Action items:

- Capture screenshots of Home and Gallery at mobile/tablet/desktop and annotate token mappings.
- Run color-contrast audits (axe, pa11y, or a11y CLI) and document results.
