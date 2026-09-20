# research.md

## Decisions

- Breakpoints: standard device categories chosen for clarity and reuse:
  - mobile: up to 599px
  - tablet: 600px–899px
  - laptop: 900px–1199px
  - desktop: 1200px and up

- Container strategy: use a fluid-to-fixed container utility where content is fluid on small screens and constrained by max-widths at larger breakpoints. This balances readable line-lengths with adaptable layouts.

- Navigation pattern: primary navigation collapses to an accessible hamburger menu at mobile breakpoint. On tablet and up, show inline navigation with a visible focus ring and keyboard operability. Use ARIA roles and logical heading order for accessibility.

- Accessibility: follow WCAG best-practices from the constitution: semantic HTML, keyboard navigation, visible focus states, and sufficient contrast testing. Navigation should be reachable and operable by keyboard in all breakpoints.

## Alternatives Considered

- Fixed-only containers: rejected because they cause poor use of space on small screens.
- Off-canvas navigation vs. modal drawer: off-canvas preferred for mobile to preserve spatial context.

## Rationale

These choices align with the project constitution (responsive, accessible, lightweight) and provide patterns usable by Home, About, Gallery, and Contact.
