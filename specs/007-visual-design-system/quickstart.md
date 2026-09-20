# Quickstart: Validate Visual Design System Integration

Purpose: Provide simple, runnable checks to validate the design system documentation and basic integration on the site.

Prerequisites

- Local repo checked out and feature branch `feature/9-visual-design-system` is active.
- Node and npm available to run local dev server (if needed) — optional for visual checks.

Validation Steps

1. Manual visual review

   - Open representative pages (Home, Gallery, Product) in desktop, tablet, and mobile viewports.
   - Confirm headings, body text, buttons, and cards reflect documented tokens.

2. Color contrast checks

   - Use a color-contrast tool (browser extension or CLI) to verify body text meets WCAG AA against background.

3. Component samples

   - Review `specs/007-visual-design-system/spec.md` component examples and confirm rendered components match token guidance.

4. Readability check

   - Verify line-length, font-size, and spacing maintain readable layouts on small screens.

Expected outcome: Stakeholder confirms visual alignment; automated contrast checks pass for body text samples.
