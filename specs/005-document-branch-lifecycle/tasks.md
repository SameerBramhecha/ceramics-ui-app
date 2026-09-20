# Tasks: Document branch naming and lifecycle

**Input**: Design documents from `/specs/005-document-branch-lifecycle/`

**Traceability**: GitHub Issue #24 -> `/specs/005-document-branch-lifecycle/spec.md` -> `/specs/005-document-branch-lifecycle/plan.md`

**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/, quickstart.md

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Confirm the repository conventions and prepare the documentation update for the branch lifecycle guidance.

- [X] T001 Review the existing governance and branch rules in `.specify/memory/constitution.md`, `.github/PULL_REQUEST_TEMPLATE.md`, and the repository workflow docs to confirm the expected contributor process
- [X] T002 [P] Confirm the target documentation file and insertion point in `CONTRIBUTING.md` before writing the lifecycle section
- [X] T003 [P] Capture the exact GitHub references needed for branch protection and PR template guidance so they can be added to contributor docs

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Define the core lifecycle language and merge rules that all later documentation updates depend on.

**⚠️ CRITICAL**: No story-specific documentation is worth finalizing until this phase is complete.

- [X] T004 Draft the `Branch lifecycle` section language in `CONTRIBUTING.md` using the repository’s approved conventions (`spec/*`, `feature/*`, and `impl/*`)
- [X] T005 [P] Add the protected-branch merge rule and note that PR-based merges are required before changes reach `main`
- [X] T006 [P] Add the review requirement stating that at least one approving review is required before a merge can proceed
- [X] T007 Add the auto-delete-on-merge note so contributors understand the branch cleanup behavior when the repository setting is enabled

**Checkpoint**: Foundation ready - story-specific documentation can now be refined in parallel.

---

## Phase 3: User Story 1 - Find the correct branch naming pattern (Priority: P1) 🎯 MVP

**Goal**: Help contributors understand which branch prefix to use during each stage of the SDLC.

**Independent Test**: A new contributor can open `CONTRIBUTING.md` and correctly determine whether a branch should start with `spec/*`, `feature/*`, or `impl/*` for a given stage.

### Implementation for User Story 1

- [X] T008 [P] [US1] Add the `spec/*` guidance to `CONTRIBUTING.md` for work created during the specify stage
- [X] T009 [P] [US1] Add the `feature/*` and `impl/*` guidance to `CONTRIBUTING.md` for work created during implementation and PR-based delivery
- [X] T010 [US1] Ensure the wording in `CONTRIBUTING.md` matches the branch naming policy in `.specify/memory/constitution.md` and the issue’s requested lifecycle guidance

**Checkpoint**: At this point, the branch naming guidance should be understandable and independently testable.

---

## Phase 4: User Story 2 - Understand when a pull request is required (Priority: P1)

**Goal**: Ensure contributors know that protected branch changes must flow through a pull request and one approving review.

**Independent Test**: A contributor can read `CONTRIBUTING.md` and determine that merges into the default branch require a PR and at least one approval before merge is accepted.

### Implementation for User Story 2

- [X] T011 [P] [US2] Add the pull-request requirement to `CONTRIBUTING.md` for any merge into the protected branch
- [X] T012 [US2] Add the approval requirement to `CONTRIBUTING.md` so contributors know that at least one approving review is required before merge
- [X] T013 [US2] Clarify in `CONTRIBUTING.md` that the review process is part of the repository’s issue-driven and branch-protected workflow

**Checkpoint**: At this point, the merge and review policy should be clear without needing any additional explanation.

---

## Phase 5: User Story 3 - Find the repository’s supporting workflow references (Priority: P2)

**Goal**: Point contributors to the repository PR template and branch protection configuration so they can complete the process correctly.

**Independent Test**: A contributor can find the PR template and branch protection guidance directly from `CONTRIBUTING.md` and follow the repository’s expected workflow.

### Implementation for User Story 3

- [X] T014 [P] [US3] Add the reference to `.github/PULL_REQUEST_TEMPLATE.md` in `CONTRIBUTING.md` so contributors can see the required PR structure
- [X] T015 [US3] Add the branch protection guidance reference in `CONTRIBUTING.md` so contributors know where the repository settings live
- [X] T016 [US3] Include the branch deletion note in `CONTRIBUTING.md` to document the repo setting and its conditional nature when auto-delete is enabled

**Checkpoint**: At this point, the documentation should fully support contributors from branch creation through merge and cleanup.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Final consistency and quality review of the contributor documentation.

- [X] T017 [P] Review the final `CONTRIBUTING.md` text for consistency, clarity, and alignment with the issue, spec, and plan
- [X] T018 [P] Validate that the document uses plain-language guidance and does not add implementation-specific details outside the approved workflow
- [X] T019 Run the final repository documentation check to confirm the Branch lifecycle section is discoverable and complete in `CONTRIBUTING.md`

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - establishes the required lifecycle rules
- **User Story phases (Phase 3+)**: Depend on Foundational completion and may proceed in parallel if there are multiple contributors
- **Polish (Phase 6)**: Depends on all desired user story updates being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational - no dependency on other stories
- **User Story 2 (P1)**: Can start after Foundational - no dependency on other stories
- **User Story 3 (P2)**: Can start after Foundational - no dependency on other stories

### Parallel Opportunities

- Setup tasks T001-T003 can run in parallel
- Foundational tasks T005-T007 can run in parallel
- Story tasks T008, T009, T011, T014 can run in parallel once the foundational guidance is drafted
- Final polish tasks T017-T018 can run in parallel before the last validation task T019

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational
3. Complete Phase 3: User Story 1
4. Validate that a contributor can identify the correct branch prefix from the documentation alone
5. Stop and confirm the MVP before finishing the additional workflow guidance

### Incremental Delivery

1. Setup + Foundational → contributor policy and branch rules are defined
2. Add User Story 1 → branch naming guidance is complete
3. Add User Story 2 → merge and review policy is complete
4. Add User Story 3 → workflow references are complete
5. Final polish → documentation is ready for routine contributor usage

---

## Notes

- [P] tasks represent work that can happen in parallel because they do not depend on the same file section or duplicate decisions.
- Each story is independently testable and can be validated without changing application code.
- The feature remains documentation-only and should not introduce implementation detail or framework changes.
- The final output must remain aligned with the repository constitution and GitHub Issue #24.
