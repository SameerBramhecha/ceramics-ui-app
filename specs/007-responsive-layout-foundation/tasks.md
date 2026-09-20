# Tasks: Build responsive layout foundation

**Input**: specs/007-responsive-layout-foundation/spec.md, plan.md, research.md, data-model.md, contracts/

## Phase 1: Setup (Shared Infrastructure)

 - [X] T001 Create component directories: src/components/PageShell and src/components/Navigation (path: src/components/)
 - [X] T002 Create styles directory and base token file: src/styles/design-tokens.css
 - [X] T003 Create layout utilities file: src/styles/layout.css
 - [X] T004 Add README stub documenting responsive breakpoints and integration notes (path: specs/007-responsive-layout-foundation/quickstart.md)

---

## Phase 2: Foundational (Blocking Prerequisites)

 - [X] T005 Define breakpoint variables and container max-widths in src/styles/design-tokens.css
 - [X] T006 Implement container utility classes in src/styles/layout.css (fluid-to-fixed behavior per breakpoints)
 - [X] T007 Add global accessible focus styles in src/styles/accessibility.css
 - [X] T008 Add or update global import of styles in src/main.tsx or src/index.css (ensure styles applied)

---

## Phase 3: User Story 1 - Page Shell & Containers (Priority: P1) 🎯

**Goal**: Provide a reusable `PageShell` component (header + main + footer) and container behaviors so pages can adopt shared layout.

**Independent Test**: Manual validation using `specs/007-responsive-layout-foundation/quickstart.md` steps to verify no horizontal scrolling and container widths.

 - [X] T009 [US1] Create `src/components/PageShell/PageShell.tsx` implementing header, main slot, and footer (reference: contracts/navigation.md)
 - [X] T010 [US1] Create `src/components/PageShell/PageShell.css` with layout rules and responsive container usage
 - [X] T011 [US1] Add example usage in `src/App.tsx` to wrap existing routes/pages with `PageShell` (path: src/App.tsx)
 - [X] T012 [US1] Update or add storybook/visual snapshot (if available) or document visual checks in specs/007-responsive-layout-foundation/quickstart.md
 - [X] T024 [US1] Add explicit viewport-based horizontal-overflow checks (list viewports and expected behavior) (specs/007-responsive-layout-foundation/quickstart.md)

---

## Phase 4: User Story 2 - Navigation (Priority: P1)

**Goal**: Implement primary navigation that collapses on mobile, is visible inline on larger viewports, and is accessible.

**Independent Test**: Keyboard navigation and mobile collapse behavior per `quickstart.md`.

 - [X] T013 [US2] Create `src/components/Navigation/Navigation.tsx` implementing the Navigation UI Contract (contracts/navigation.md)
 - [X] T014 [US2] Create `src/components/Navigation/Navigation.css` with responsive styles for collapse/inline states
 - [X] T015 [US2] Ensure navigation toggle has `aria-expanded`, accessible label, and keyboard handlers (file: src/components/Navigation/Navigation.tsx)
 - [X] T016 [US2] Add integration snippet in `src/components/PageShell/PageShell.tsx` to consume `Navigation` and pass `items`/`brand`
 - [X] T023 [US2] Add keyboard navigation verification steps and test checklist (specs/007-responsive-layout-foundation/quickstart.md)

---

## Phase 5: User Story 3 - Integrate & Page Reuse (Priority: P2)

**Goal**: Integrate the PageShell and Navigation into the Home, About, Gallery, and Contact pages and ensure gallery PDFs respect container constraints.

**Independent Test**: Each page renders inside the shell and manual checks confirm no horizontal overflow at target breakpoints.

 - [X] T017 [US3] Update `src/App.tsx` or page entry files to use `PageShell` for Home, About, Gallery, Contact (paths: src/App.tsx, src/* pages)
 - [X] T018 [US3] Verify gallery PDF links and preview cards fit within container rules; update `src/components/GalleryCard.css` if needed (path: src/components/GalleryCard.css)
 - [X] T019 [US3] Add fallback rules for long words/images to prevent horizontal overflow (file: src/styles/layout.css)

---

## Phase 6: Polish & Cross-Cutting Concerns

 - [X] T020 [P] Accessibility QA notes: Run keyboard navigation checks and annotate any remaining issues in specs/007-responsive-layout-foundation/quickstart.md
 - [X] T021 [P] Add documentation comments to `src/components/*` files linking back to contracts/navigation.md and spec.md
 - [X] T022 Final visual review and small CSS tweaks (file: src/styles/design-tokens.css and src/styles/layout.css)

---

## Dependencies & Execution Order

- Setup (T001–T004) must start first; foundational tasks (T005–T008) block user stories.
- After T005–T008 complete, US1 (T009–T012) and US2 (T013–T016) can proceed in parallel where appropriate.
- US3 (T017–T019) depends on successful completion of US1 and US2.
- Polish tasks (T020–T022) run after user stories complete; some are parallelizable.

## Parallel Opportunities

- T009 vs T013 (PageShell vs Navigation implementation) can be worked in parallel after foundational tasks complete.
- T020 and T021 are explicitly parallel ([P]) and can be done alongside final visual review.

## Implementation Strategy and MVP

- MVP: Complete Phase 1, Phase 2, and Phase 3 (T001–T012). Deliver a working PageShell with responsive container behavior and a basic navigation.
- Incremental: After MVP, finalize Navigation accessibility, integrate pages (US3), and perform polish tasks.

---

## Generated artifact

- tasks file: specs/007-responsive-layout-foundation/tasks.md
 - total tasks: 24
 - tasks per story: Setup 4, Foundational 4, US1 5, US2 5, US3 3, Polish 3
# Tasks: Build responsive layout foundation

**Input**: specs/007-responsive-layout-foundation/spec.md, plan.md, research.md, data-model.md, contracts/

## Phase 1: Setup (Shared Infrastructure)

 - [X] T001 Create component directories: src/components/PageShell and src/components/Navigation (path: src/components/)
 - [X] T002 Create styles directory and base token file: src/styles/design-tokens.css
 - [X] T003 Create layout utilities file: src/styles/layout.css
 - [X] T004 Add README stub documenting responsive breakpoints and integration notes (path: specs/007-responsive-layout-foundation/quickstart.md)

---

## Phase 2: Foundational (Blocking Prerequisites)

- [ ] T005 Define breakpoint variables and container max-widths in src/styles/design-tokens.css
- [ ] T006 Implement container utility classes in src/styles/layout.css (fluid-to-fixed behavior per breakpoints)
- [ ] T007 Add global accessible focus styles in src/styles/accessibility.css
- [ ] T008 Add or update global import of styles in src/main.tsx or src/index.css (ensure styles applied)

 - [X] T005 Define breakpoint variables and container max-widths in src/styles/design-tokens.css
 - [X] T006 Implement container utility classes in src/styles/layout.css (fluid-to-fixed behavior per breakpoints)
 - [X] T007 Add global accessible focus styles in src/styles/accessibility.css
 - [X] T008 Add or update global import of styles in src/main.tsx or src/index.css (ensure styles applied)

---

## Phase 3: User Story 1 - Page Shell & Containers (Priority: P1) 🎯

**Goal**: Provide a reusable `PageShell` component (header + main + footer) and container behaviors so pages can adopt shared layout.

**Independent Test**: Manual validation using `specs/007-responsive-layout-foundation/quickstart.md` steps to verify no horizontal scrolling and container widths.

- [ ] T009 [US1] Create `src/components/PageShell/PageShell.tsx` implementing header, main slot, and footer (reference: contracts/navigation.md)
- [ ] T010 [US1] Create `src/components/PageShell/PageShell.css` with layout rules and responsive container usage
- [ ] T011 [US1] Add example usage in `src/App.tsx` to wrap existing routes/pages with `PageShell` (path: src/App.tsx)
- [ ] T012 [US1] Update or add storybook/visual snapshot (if available) or document visual checks in specs/007-responsive-layout-foundation/quickstart.md
- [ ] T024 [US1] Add explicit viewport-based horizontal-overflow checks (list viewports and expected behavior) (specs/007-responsive-layout-foundation/quickstart.md)

 - [X] T009 [US1] Create `src/components/PageShell/PageShell.tsx` implementing header, main slot, and footer (reference: contracts/navigation.md)
 - [X] T010 [US1] Create `src/components/PageShell/PageShell.css` with layout rules and responsive container usage
 - [X] T011 [US1] Add example usage in `src/App.tsx` to wrap existing routes/pages with `PageShell` (path: src/App.tsx)
 - [X] T012 [US1] Update or add storybook/visual snapshot (if available) or document visual checks in specs/007-responsive-layout-foundation/quickstart.md
 - [X] T024 [US1] Add explicit viewport-based horizontal-overflow checks (list viewports and expected behavior) (specs/007-responsive-layout-foundation/quickstart.md)

---

## Phase 4: User Story 2 - Navigation (Priority: P1)

**Goal**: Implement primary navigation that collapses on mobile, is visible inline on larger viewports, and is accessible.

**Independent Test**: Keyboard navigation and mobile collapse behavior per `quickstart.md`.

- [ ] T013 [US2] Create `src/components/Navigation/Navigation.tsx` implementing the Navigation UI Contract (contracts/navigation.md)
- [ ] T014 [US2] Create `src/components/Navigation/Navigation.css` with responsive styles for collapse/inline states
- [ ] T015 [US2] Ensure navigation toggle has `aria-expanded`, accessible label, and keyboard handlers (file: src/components/Navigation/Navigation.tsx)
- [ ] T016 [US2] Add integration snippet in `src/components/PageShell/PageShell.tsx` to consume `Navigation` and pass `items`/`brand`
- [ ] T023 [US2] Add keyboard navigation verification steps and test checklist (specs/007-responsive-layout-foundation/quickstart.md)

 - [X] T013 [US2] Create `src/components/Navigation/Navigation.tsx` implementing the Navigation UI Contract (contracts/navigation.md)
 - [X] T014 [US2] Create `src/components/Navigation/Navigation.css` with responsive styles for collapse/inline states
 - [X] T015 [US2] Ensure navigation toggle has `aria-expanded`, accessible label, and keyboard handlers (file: src/components/Navigation/Navigation.tsx)
 - [X] T016 [US2] Add integration snippet in `src/components/PageShell/PageShell.tsx` to consume `Navigation` and pass `items`/`brand`
 - [X] T023 [US2] Add keyboard navigation verification steps and test checklist (specs/007-responsive-layout-foundation/quickstart.md)

---

## Phase 5: User Story 3 - Integrate & Page Reuse (Priority: P2)

**Goal**: Integrate the PageShell and Navigation into the Home, About, Gallery, and Contact pages and ensure gallery PDFs respect container constraints.

**Independent Test**: Each page renders inside the shell and manual checks confirm no horizontal overflow at target breakpoints.

- [ ] T017 [US3] Update `src/App.tsx` or page entry files to use `PageShell` for Home, About, Gallery, Contact (paths: src/App.tsx, src/* pages)
- [ ] T018 [US3] Verify gallery PDF links and preview cards fit within container rules; update `src/components/GalleryCard.css` if needed (path: src/components/GalleryCard.css)
- [ ] T019 [US3] Add fallback rules for long words/images to prevent horizontal overflow (file: src/styles/layout.css)

 - [X] T017 [US3] Update `src/App.tsx` or page entry files to use `PageShell` for Home, About, Gallery, Contact (paths: src/App.tsx, src/* pages)
 - [X] T018 [US3] Verify gallery PDF links and preview cards fit within container rules; update `src/components/GalleryCard.css` if needed (path: src/components/GalleryCard.css)
 - [X] T019 [US3] Add fallback rules for long words/images to prevent horizontal overflow (file: src/styles/layout.css)

---

## Phase 6: Polish & Cross-Cutting Concerns

- [ ] T020 [P] Accessibility QA notes: Run keyboard navigation checks and annotate any remaining issues in specs/007-responsive-layout-foundation/quickstart.md
- [ ] T021 [P] Add documentation comments to `src/components/*` files linking back to contracts/navigation.md and spec.md
- [ ] T022 Final visual review and small CSS tweaks (file: src/styles/design-tokens.css and src/styles/layout.css)

 - [X] T020 [P] Accessibility QA notes: Run keyboard navigation checks and annotate any remaining issues in specs/007-responsive-layout-foundation/quickstart.md
 - [X] T021 [P] Add documentation comments to `src/components/*` files linking back to contracts/navigation.md and spec.md
 - [X] T022 Final visual review and small CSS tweaks (file: src/styles/design-tokens.css and src/styles/layout.css)

---

## Dependencies & Execution Order

- Setup (T001–T004) must start first; foundational tasks (T005–T008) block user stories.
- After T005–T008 complete, US1 (T009–T012) and US2 (T013–T016) can proceed in parallel where appropriate.
- US3 (T017–T019) depends on successful completion of US1 and US2.
- Polish tasks (T020–T022) run after user stories complete; some are parallelizable.

## Parallel Opportunities

- T009 vs T013 (PageShell vs Navigation implementation) can be worked in parallel after foundational tasks complete.
- T020 and T021 are explicitly parallel ([P]) and can be done alongside final visual review.

## Implementation Strategy and MVP

- MVP: Complete Phase 1, Phase 2, and Phase 3 (T001–T012). Deliver a working PageShell with responsive container behavior and a basic navigation.
- Incremental: After MVP, finalize Navigation accessibility, integrate pages (US3), and perform polish tasks.

---

## Generated artifact

- tasks file: specs/007-responsive-layout-foundation/tasks.md
 - total tasks: 24
 - tasks per story: Setup 4, Foundational 4, US1 5, US2 5, US3 3, Polish 3

