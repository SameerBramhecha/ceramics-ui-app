# Tasks: Visual Design System

**Input**: Design documents from `/specs/007-visual-design-system/`

**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure for design tokens and documentation

- [x] T001 Create `src/styles/design-tokens.css` with initial CSS custom properties (colors, typography scale tokens, spacing variables). Provide token naming and short descriptions in comments. (path: `src/styles/design-tokens.css`)
- [x] T002 Create documentation file `specs/007-visual-design-system/tokens.md` listing token names, values, and intended usages (path: `specs/007-visual-design-system/tokens.md`).
- [x] T003 [P] Add a `specs/007-visual-design-system/components/` folder and stub example docs for `card.md`, `button.md`, `header.md` showing token mappings (path: `specs/007-visual-design-system/components/`).

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core artifacts that must exist before user-story implementation begins

- [x] T004 Create `specs/007-visual-design-system/accessibility.md` documenting WCAG AA targets, contrast guidance, and focus indicators (path: `specs/007-visual-design-system/accessibility.md`).
- [x] T005 [P] Add a lightweight visual-check quickstart script placeholder `specs/007-visual-design-system/tools/run-visual-checks.sh` with instructions to run manual/CLI contrast checks (path: `specs/007-visual-design-system/tools/run-visual-checks.sh`).
- [x] T006 Create `specs/007-visual-design-system/checklists/accessibility.md` (requirements-quality checklist stub for accessibility to be completed by reviewer) (path: `specs/007-visual-design-system/checklists/accessibility.md`).

**Checkpoint**: Foundation ready — user stories can begin after T004–T006 complete.

---

## Phase 3: User Story 1 - Apply Brand Visuals (Priority: P1) 🎯 MVP

**Goal**: Apply the brand palette, typography, and spacing tokens to representative pages and components so the site reflects the Bramhecha Ceramics visual identity.

**Independent Test**: Review Home and Gallery pages and confirm they use tokens from `src/styles/design-tokens.css` and match documentation in `specs/007-visual-design-system/tokens.md`.

 - [x] T007 [US1] Update `src/App.css` to import `src/styles/design-tokens.css` and expose base variables for the app (path: `src/App.css`).
 - [x] T008 [US1] Implement token usage in `src/pages/Home.css` (or `src/App.css` if pages not present) to style hero, headings, and body text according to typographic tokens (path: `src/pages/Home.css`).
 - [x] T009 [US1] Implement token usage in `src/components/GalleryCard.css` to style gallery item cards (spacing, type, background) using tokens (path: `src/components/GalleryCard.css`).
 - [x] T010 [US1] Add visual examples to `specs/007-visual-design-system/components/card.md` demonstrating the GalleryCard mapping and screenshots/examples (path: `specs/007-visual-design-system/components/card.md`).

---

## Phase 4: User Story 2 - Consistent Component Styling (Priority: P2)

**Goal**: Provide a documented component styling guide and implement core component styles so designers and developers can apply consistent rules across components.

**Independent Test**: Compare Button and Card implementations against `specs/007-visual-design-system/components/*.md` and confirm token mappings are used.

- [x] T011 [US2] Create `src/components/Button.css` implementing button tokens for primary/secondary/outline variants (path: `src/components/Button.css`).
- [x] T012 [US2] Create `src/components/Card.css` implementing card layout, spacing and elevation using tokens (path: `src/components/Card.css`).
- [x] T013 [US2] Update `specs/007-visual-design-system/components/button.md` with usage guidance and variant mapping (path: `specs/007-visual-design-system/components/button.md`).
- [x] T014 [US2] Run a visual review and document deviations in `specs/007-visual-design-system/review-notes.md` (path: `specs/007-visual-design-system/review-notes.md`).

---

## Phase 5: User Story 3 - Accessibility & Readability (Priority: P3)

**Goal**: Ensure color contrast, typographic choices, and focus indicators meet accessibility standards.

**Independent Test**: Automated or manual contrast checks for body text; keyboard navigation check for interactive elements.


- [x] T015 [US3] Run color-contrast checks for tokens in `src/styles/design-tokens.css` and update tokens if any color fails WCAG AA for body text (document changes in `specs/007-visual-design-system/accessibility.md`).
- [x] T016 [US3] Implement visible focus styles for interactive components and document them in `specs/007-visual-design-system/accessibility.md` (paths: `src/components/Button.css`, `src/components/Card.css`).
- [x] T017 [US3] Add accessibility examples and verification steps to `specs/007-visual-design-system/quickstart.md` for reviewer validation (path: `specs/007-visual-design-system/quickstart.md`).

---

## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Documentation, cleanup, and integration tasks that touch multiple stories

- [x] T018 [P] Documentation: Consolidate final design reference into `docs/design-system.md` linking to spec and component docs (path: `docs/design-system.md`).
- [x] T019 [P] Create a Pull Request from `feature/9-visual-design-system` to `main` with summary and links to spec/plan/tasks (use `gh pr create` or script) (path: repo root).
- [x] T020 Accessibility final review: reviewer to complete `specs/007-visual-design-system/checklists/accessibility.md` and `specs/007-visual-design-system/checklists/ux.md` entries (path: `specs/007-visual-design-system/checklists/`).

---

## Dependencies & Execution Order

- Phase 1 (T001–T003) → Phase 2 (T004–T006) → Phase 3 (T007–T010) → Phase 4 (T011–T014) → Phase 5 (T015–T017) → Polish (T018–T020)
- Within each story: follow listed order (models/stylesheet → component implementation → documentation → review)

## Parallel Opportunities

- Tasks marked `[P]` can be worked on in parallel by different contributors (T003, T005, T011, T018, T019).

## Suggested MVP

- Complete Phase 1 + Phase 2 + Phase 3 (User Story 1) to deliver a visible, token-driven MVP demonstrating brand visuals on core pages.
