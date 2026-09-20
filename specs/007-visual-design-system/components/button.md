# Button Component — Token Mapping

- Primary background: `--color-accent`
- Primary text: `--color-neutral-100`
- Secondary background: transparent
- Secondary border: `--color-accent`
- Padding: `--spacing-2` / `--spacing-3`
- Font: `--font-size-scale-2`

Variants

- Primary: `.btn--primary` — filled accent background, white text.
- Secondary: `.btn--secondary` — neutral background (transparent) with subtle border.
- Outline: `.btn--outline` — accent-colored outline for emphasis without fill.

Usage example

```html
<button class="btn btn--primary">Buy</button>
<button class="btn btn--secondary">Learn more</button>
```

Notes:
- Ensure focus-visible styles are preserved for keyboard users; the implementation uses `:focus-visible` and token-based outlines.
- Update this doc with accessible contrast test results and any variant adjustments.
