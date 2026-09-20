# Tasks: PR Template Stage

**Input**: GitHub Issue #23, spec.md, plan.md

**Traceability**: GitHub Issue #23 -> spec.md -> plan.md

**MVP Scope**: User Story 1 (P1) is the minimum viable scope; User Story 2 extends review clarity and future automation readiness.

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Confirm the repository structure and the GitHub PR template location needed for the workflow change.

- [x] T001 Confirm the GitHub PR template path and repository conventions in .github/ before editing workflow files
- [x] T002 [P] Review the existing repo structure in .github/ and note the required placement for repository-level PR metadata

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Create the repository workflow baseline that all staged PR work depends on.

**Checkpoint**: Repository PR template scaffolding is ready and can support both story-level implementation tasks.

- [x] T003 Create or update .github/PULL_REQUEST_TEMPLATE.md with a clear Stage section using the values specify and implement
- [x] T004 [P] Add a Description section to .github/PULL_REQUEST_TEMPLATE.md so contributors explain the change and rationale in the PR body
- [x] T005 [P] Preserve the soft-enforcement intent in .github/PULL_REQUEST_TEMPLATE.md so future CI or automation can enforce missing stage values without blocking initial PR creation

---

## Phase 3: User Story 1 - Declare the SDLC stage when opening a pull request (Priority: P1) 🎯 MVP

**Goal**: Contributors can clearly declare whether the work is in the specify or implement phase when creating a PR.

**Independent Test**: Open a new PR in GitHub and verify that the Stage section is visible, easy to understand, and includes both expected options.

### Implementation for User Story 1

- [x] T006 [US1] Update .github/PULL_REQUEST_TEMPLATE.md so the Stage section appears above the Description section and remains easy to read in the standard GitHub PR UI
- [x] T007 [P] [US1] Ensure the checkboxes in .github/PULL_REQUEST_TEMPLATE.md use the exact values specify and implement and match the issue requirement and spec wording
- [x] T008 [US1] Validate the final PR template copy in .github/PULL_REQUEST_TEMPLATE.md against the issue and specification so the user-facing workflow remains consistent and traceable

**Checkpoint**: User Story 1 is independently functional and can be validated without any additional repo changes.

---

## Phase 4: User Story 2 - Reviewers understand the work stage without extra clarification (Priority: P2)

**Goal**: Reviewers can quickly and consistently understand whether the PR is in the specify or implement phase.

**Independent Test**: Open an example PR and verify that the review context is understandable from the Stage section without requiring additional conversation.

### Implementation for User Story 2

- [x] T009 [US2] Review the PR template language in .github/PULL_REQUEST_TEMPLATE.md to confirm it supports fast, unambiguous reviewer interpretation
- [x] T010 [P] [US2] Ensure the Description guidance in .github/PULL_REQUEST_TEMPLATE.md remains concise and actionable so the stage and rationale are both visible to reviewers
- [x] T011 [US2] Confirm the template remains appropriate for future automation by keeping the stage field explicit and machine-readable in format

**Checkpoint**: User Story 2 is independently usable and enhances review clarity without altering the soft enforcement model.

---

## Phase 5: Polish & Cross-Cutting Concerns

**Purpose**: Final validation, documentation consistency, and repository readiness.

- [x] T012 [P] Review the issue, spec, and plan together to confirm the PR template change stays within the requested scope and does not broaden implementation beyond the repository workflow requirement
- [x] T013 Run the quickstart validation flow from specs/004-pr-template-stage/quickstart.md and confirm the PR template can be used in the GitHub PR creation experience
- [x] T014 [P] Confirm the final repository state remains aligned with the issue-driven workflow and no branch or project status changes were introduced outside the intended feature work

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 1**: No dependencies; can begin immediately
- **Phase 2**: Depends on Phase 1 completion; establishes the required repository workflow baseline
- **Phase 3 (US1)**: Depends on Phase 2 completion; MVP story and primary deliverable
- **Phase 4 (US2)**: Depends on Phase 2 completion and optionally on US1 completion; independent review clarity enhancement
- **Phase 5**: Depends on all desired story work being complete

### User Story Dependencies

- **User Story 1 (P1)**: Independent of other stories; primary deliverable
- **User Story 2 (P2)**: Independent from core functionality; improves clarity and automation readiness

### Parallel Opportunities

- T002 can run in parallel with T001
- T004 and T005 can run in parallel after T003 is complete
- T007 can run in parallel with T006 or T008 if the template content is already agreed on
- T010 can run in parallel with T009 and T011 if the review interpretation is being validated separately
- T012 and T014 can run in parallel during final review if no shared edits are pending

---

## Implementation Strategy

### MVP First

1. Complete Phase 1
2. Complete Phase 2
3. Complete Phase 3 (User Story 1)
4. Validate the PR template manually in GitHub
5. Stop and confirm the core workflow is usable before expanding to User Story 2

### Incremental Delivery

1. Foundation: Add the PR template structure and description guidance
2. MVP: Require clear stage selection for contributors via the repository template
3. Enhancement: Improve reviewer clarity and future automation readiness
4. Final validation: Confirm the feature remains aligned with the issue, spec, and implementation plan

### Parallel Team Strategy

- One contributor can prepare template structure and wording in .github/PULL_REQUEST_TEMPLATE.md while another reviews the issue/spec alignment and validation expectations.
- Once the template is in place, the final validation and wording review can proceed in parallel across the issue/spec/plan documents.

---

## Notes

- This feature intentionally avoids code changes outside the repository workflow area.
- The task structure is organized by user story to keep implementation and validation independent.
- No automated test tasks were added because the feature specification does not explicitly request them and this change is primarily a repository workflow and PR UX improvement.
