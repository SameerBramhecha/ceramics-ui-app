# data-model.md

This feature is primarily UI/layout-focused. Data entities document the conceptual models relevant to the layout and navigation patterns.

## Entities

### PageShell
- description: Top-level site shell that composes header, main, and footer.
- fields:
  - id: string
  - title: string
  - navigation: NavigationItem[]
  - contentSlots: string[] (named slots for pages)

### NavigationItem
- description: Represents an entry in the primary navigation.
- fields:
  - id: string
  - label: string
  - href: string
  - order: integer
  - ariaLabel: string? (optional override)
  - external: boolean (if true, opens in new tab)

### Container
- description: Layout container rules and breakpoint-aware widths.
- fields:
  - name: string (e.g., main, narrow, wide)
  - maxWidthByBreakpoint: object (mobile/tablet/laptop/desktop)
  - paddingByBreakpoint: object

## Validation Rules
- NavigationItem.href must be a valid relative or absolute URL.
- At least one NavigationItem must exist for the primary navigation.

## Notes
This data model is intentionally shallow — it documents the conceptual contracts for UI composition, not persisted domain data.
