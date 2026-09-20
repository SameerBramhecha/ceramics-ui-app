# Accessibility Guidance

This document captures accessibility targets and guidance for the Visual Design System.

## Targets

- WCAG AA for body text contrast (minimum 4.5:1 for normal text)
- WCAG AA for large text (minimum 3:1 where applicable)

## Focus Indicators

- Interactive controls (buttons, links, inputs) MUST have visible focus styles with a clear outline or ring that meets contrast requirements.

## Images

- Provide meaningful `alt` text for all content images. Decorative images may use empty `alt=""`.
- For images with dominant color conflicts, provide overlay guidance or alternative accent tokens.

## Keyboard Navigation

- All interactive interfaces must be operable via keyboard (tab navigation, skip links where appropriate).

## Verification

- Use automated color-contrast checks and manual keyboard navigation tests as described in `quickstart.md`.
