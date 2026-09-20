# Design Tokens

This document lists the initial design tokens for the Visual Design System.

## Colors

- `--color-primary`: #1f2933 — Brand primary (dark slate)
- `--color-accent`: #d17b4a — Brand accent (warm terracotta)
- `--color-neutral-100`: #ffffff
- `--color-neutral-900`: #0b0f12
- `--color-success`: #2e7d32
- `--color-warning`: #f59e0b
- `--color-error`: #dc2626

## Typography

- `--font-size-base`: 16px
- `--font-size-scale-1`: 0.875rem — small
- `--font-size-scale-2`: 1rem — body
- `--font-size-scale-3`: 1.25rem — h3
- `--font-size-scale-4`: 1.5rem — h2
- `--font-size-scale-5`: 2rem — h1

## Spacing (base unit = 8px)

- `--spacing-1`: 4px
- `--spacing-2`: 8px
- `--spacing-3`: 16px
- `--spacing-4`: 24px
- `--spacing-5`: 32px

## Elevation

- `--elevation-1`: 0 1px 3px rgba(0,0,0,0.08)
- `--elevation-2`: 0 4px 8px rgba(0,0,0,0.10)

## Usage Notes

- Tokens are stored in `src/styles/design-tokens.css` as CSS custom properties.
- Implementation should prefer tokens over hard-coded values; document deviations in component docs.
