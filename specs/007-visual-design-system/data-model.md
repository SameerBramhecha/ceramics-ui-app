# Data Model: Visual Design System

This document defines the key entities used to represent the design system in repository artifacts and documentation.

## Entities

- DesignToken

  - description: A named value representing a single design decision (color, spacing, font-size, etc.).
  - fields:
    - `name` (string) — token identifier, e.g., `color-primary`, `spacing-4`.
    - `category` (enum) — one of `color`, `typography`, `spacing`, `elevation`, `semantic`.
    - `value` (string) — token value, e.g., `#1a2b3c`, `16px`, `1.25rem`.
    - `description` (string) — human-friendly note about usage.

- ComponentPattern

  - description: Visual mapping of tokens to a reusable component example.
  - fields:
    - `component` (string) — component name, e.g., `card`, `button`, `navbar`.
    - `tokens` (map) — mapping from token roles to token names, e.g., `{ background: color-surface, padding: spacing-4 }`.
    - `variants` (list) — optional variants like `primary`, `secondary`, `small`, `large`.
    - `examples` (list) — usage examples and notes.

- StyleReference

  - description: Human-friendly documentation page mapping tokens to visual examples and usage guidance.
  - fields:
    - `sections` (list) — grouped sections like `Colors`, `Typography`, `Spacing`, `Components`.
    - `examples` (list) — example markup or screenshots demonstrating token application.

## Validation Rules (informal)

- Colors used for body text must meet WCAG AA contrast against their background.
- Spacing tokens should be multiples of a base unit (e.g., 4px or 8px).
