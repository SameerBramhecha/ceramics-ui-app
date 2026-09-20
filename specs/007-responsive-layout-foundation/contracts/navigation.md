# contracts/navigation.md

## Navigation UI Contract

Purpose: Define the shape and responsibilities of the primary navigation component so pages can integrate consistently.

### Inputs
- `items: NavigationItem[]` — The ordered list of navigation entries.
- `brand: { title: string, href?: string }` — Brand label and optional home link.
- `onNavigate?: (href: string) => void` — Optional callback for SPA navigation handling.

### Behavior
- Renders inline navigation on tablet and larger breakpoints.
- Collapses to an accessible toggle (hamburger) on mobile.
- Supports keyboard focus, `Enter`/`Space` to activate links, and `Esc` to close mobile menu.
- Uses semantic HTML: `nav[role="navigation"]` and `ul`/`li` for lists.
- Emits no side-effects beyond calling `onNavigate` when provided.

### Accessibility
- Menu toggle must have `aria-expanded` and an accessible label.
- Link elements must have meaningful text; use `aria-label` where needed.

### Integrators
- Pages must provide `items` and `brand`; the navigation implementation must not assume global routing.

