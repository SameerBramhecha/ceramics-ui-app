# quickstart.md

## Purpose
Runnable validation steps to verify the responsive layout foundation works end-to-end locally.

## Prerequisites
- Node.js (16+ recommended)
- npm

## Steps
1. Install dependencies:

```bash
npm install
```

2. Start the dev server:

```bash
npm run dev
```

3. Open the site at `http://localhost:5173` (Vite default) and verify:
   - Mobile viewport: navigation collapses to hamburger, no horizontal scroll.
   - Tablet viewport: navigation visible inline, spacing and typography comfortable.
   - Desktop viewport: content containers constrain to readable line lengths and gutters are correct.

4. Keyboard checks:
   - Tab through the page to ensure focus states are visible and navigation is operable.
   - Open and close mobile menu using keyboard controls (Enter/Space/Escape).

5. Manual checks:
   - Resize the browser across breakpoints and confirm no unintended horizontal scroll.

## Explicit viewport checks

Test these specific viewports and expected behaviors:

- 360×800 (mobile portrait): navigation collapsed to hamburger; no horizontal scroll; main content uses full width with mobile padding.
- 412×915 (mobile large): navigation collapsed; long words/images wrap or truncate; no horizontal overflow.
- 768×1024 (tablet portrait): navigation visible inline; container constrained to `--container-max-tablet` with tablet gutters.
- 1024×1366 (laptop): navigation inline; container constrained to `--container-max-laptop`; readable line lengths.
- 1280×800 (desktop): navigation inline; container constrained to `--container-max-desktop`; gutters equal to desktop padding.

For each viewport assert:

- No horizontal scrollbar is present.
- Navigation is operable via keyboard (Tab to focus, Enter/Space to open mobile menu, Escape to close).
- Images and media do not overflow their container (`.img-responsive` behavior).

## Keyboard verification checklist

- [ ] Tab through interactive elements in header and ensure visible focus ring.
- [ ] Open mobile menu with keyboard and navigate to each link using Tab and Arrow keys.
- [ ] Close mobile menu with Escape and ensure focus returns to the toggle button.


## Setup / Notes

- Development files created by implementation step:
   - `src/components/PageShell/PageShell.tsx`
   - `src/components/PageShell/PageShell.css`
   - `src/components/Navigation/Navigation.tsx`
   - `src/components/Navigation/Navigation.css`
   - `src/styles/design-tokens.css`
   - `src/styles/layout.css`

Use these files as integration references when validating the layout.

## Expected outcomes
- Layout adapts across breakpoints per spec.
- Navigation is accessible and reusable across pages.
