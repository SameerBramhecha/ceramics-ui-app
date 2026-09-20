# Card Component — Token Mapping

Example token mapping for the Gallery card component:

- Background: `--color-neutral-100`
- Border radius: `--spacing-2`
- Padding: `--spacing-3`
- Title: `--font-size-scale-3` + bold
- Body: `--font-size-scale-2`
- Shadow: `--elevation-1`
 - Shadow: `--elevation-1`

Example usage

HTML:

```html
<article class="gallery-card">
	<img class="gallery-card--image" src="/public/gallery/example.jpg" alt="Ceramic bowl" />
	<h3 class="gallery-card__title">Handmade Bowl</h3>
	<p class="gallery-card__body">Glazed stoneware with warm terracotta accent.</p>
</article>
```

CSS (see `src/components/GalleryCard.css`): uses the token mappings above to ensure spacing, typography and elevation match the design tokens.

Notes:
- Provide a screenshot demonstrating the card in the gallery and annotate token usages (title size, padding, background).
- This document is a living reference — update with real images and examples when available.
