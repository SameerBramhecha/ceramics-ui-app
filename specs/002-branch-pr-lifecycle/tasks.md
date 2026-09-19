# Tasks: Branch and PR Lifecycle

**Input**: Design documents from `/specs/002-branch-pr-lifecycle/`

**Issue Traceability**: GitHub Issue #25 → `/specs/002-branch-pr-lifecycle/spec.md` → `/specs/002-branch-pr-lifecycle/plan.md`

**Prerequisites**: plan.md (required), spec.md (required), research.md, data-model.md, quickstart.md, contracts/ README

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description with file path`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Confirm the existing repository workflow and baseline enforcement points before changing behavior.

- [ ] T001 Review the active workflow in `scripts/New-FeatureBranch.ps1`, `scripts/New-PullRequest.ps1`, and `scripts/Set-GitHubProjectStatus.ps1` to confirm current branch and PR behavior against issue #25.
- [ ] T002 [P] Compare the current requirements in `.github/skills/speckit-specify/SKILL.md` and `.github/skills/speckit-implement/SKILL.md` against the issue, spec, and constitution to identify enforcement gaps.
- [ ] T003 [P] Confirm the repository policy in `.specify/memory/constitution.md` and `docs/project-workflow.md` still matches the required branch lifecycle and pull-request policy.

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Make the workflow enforcement explicit at the repo level before implementing story-specific behavior.

- [ ] T004 Update `.github/skills/speckit-specify/SKILL.md` so the specify stage requires a non-main feature branch and preserves issue traceability without changing project status.
- [ ] T005 Update `.github/skills/speckit-implement/SKILL.md` so implementation starts only from a non-main branch and requires PR creation against `main` before completion is reported.
- [ ] T006 [P] Align `scripts/New-FeatureBranch.ps1` with the repository policy: reject `main`, require GitHub issue validation, and create `feature/<issue>-<slug>` branches from a valid non-main context.
- [ ] T007 [P] Align `scripts/New-PullRequest.ps1` with the repository policy: require a feature branch, push it, create a PR against `main`, and reference the originating issue in the PR body.
- [ ] T008 Confirm the project status workflow in `scripts/Set-GitHubProjectStatus.ps1` remains consistent with `Backlog → Ready → In Progress → Review → Done` and does not bypass the PR gate.

**Checkpoint**: Foundation ready - branch/PR enforcement can now be validated story by story.

---

## Phase 3: User Story 1 - Start an issue on a protected feature branch (Priority: P1) 🎯 MVP

**Goal**: Guarantee branch creation occurs during the specify stage and before implementation starts.

**Independent Test**: For an open issue, a contributor can begin the workflow only on a non-main feature branch and can confirm the branch is tied to the issue.

### Implementation for User Story 1

- [ ] T009 [P] [US1] Update `.github/skills/speckit-specify/SKILL.md` to validate the issue is open and fail fast if the branch creation step is blocked or the GitHub CLI is unavailable.
- [ ] T010 [US1] Update `scripts/New-FeatureBranch.ps1` to enforce the branch creation rules and emit a clear failure when run from `main` or when issue validation fails.
- [ ] T011 [US1] Validate the generated branch name follows `feature/<issue>-<description>` and remains traceable to the GitHub issue number.
- [ ] T012 [US1] Add or update repository guidance in `docs/project-workflow.md` so the specify-stage branch requirement is visible to contributors.

**Checkpoint**: At this point, User Story 1 should be fully testable independently.

---

## Phase 4: User Story 2 - Finish implementation with a pull request against main (Priority: P1)

**Goal**: Ensure implementation completes through a pull request against `main` rather than a direct merge path.

**Independent Test**: When implementation is ready, the repository opens a PR from the feature branch to `main` and includes the originating issue reference.

### Implementation for User Story 2

- [ ] T013 [P] [US2] Update `.github/skills/speckit-implement/SKILL.md` to require a non-main branch and block direct implementation on `main` before any implementation tasks begin.
- [ ] T014 [US2] Update `scripts/New-PullRequest.ps1` to push the branch, open the PR against `main`, and include `Closes #<issue>` in the PR content.
- [ ] T015 [US2] Confirm `scripts/New-PullRequest.ps1` reports failure clearly when the branch cannot be pushed or the PR creation step fails, instead of silently continuing.
- [ ] T016 [US2] Verify status transitions in `scripts/Set-GitHubProjectStatus.ps1` still move the issue to `Review` only after a real PR exists.

**Checkpoint**: At this point, User Stories 1 and 2 should both work independently.

---

## Phase 5: User Story 3 - Maintain traceability across issue, branch, and pull request (Priority: P2)

**Goal**: Keep the issue, branch, and PR workflow consistent and auditable throughout delivery.

**Independent Test**: A reviewer can identify the originating issue from the branch name and the PR metadata without ambiguity.

### Implementation for User Story 3

- [ ] T017 [P] [US3] Review `specs/002-branch-pr-lifecycle/spec.md` and the workflow docs to confirm the traceability language matches the enforced repo behavior.
- [ ] T018 [US3] Update `docs/project-workflow.md` or related repo docs so the lifecycle is documented as GitHub Issue → feature branch → PR → main merge.
- [ ] T019 [US3] Validate that closed or inactive issues are treated as invalid for implementation flow and that the workflow surfaces that as a clear failure.
- [ ] T020 [US3] Confirm all branch and PR requirements are reflected consistently in the repo automation and in the relevant skill instructions.

**Checkpoint**: All user stories should now be independently functional and traceable.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Final validation and workflow compliance checks across the issue-driven repo process.

- [ ] T021 [P] Run the repository validation commands for the branch lifecycle flow: `gh issue view`, `git branch --show-current`, and the relevant PowerShell scripts.
- [ ] T022 Confirm the issue-driven workflow remains compatible with the existing Vite + React + TypeScript + npm repository setup and does not add unnecessary project-level dependencies.
- [ ] T023 [P] Review final changes for traceability, branch safety, PR gate enforcement, and any missing requirement in the specs or workflow docs.
- [ ] T024 Run a final pass against `spec.md`, `plan.md`, and the updated automation to ensure the repository policy now matches the issue goal and the project constitution.

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately.
- **Foundational (Phase 2)**: Depends on Setup completion; it blocks all story work.
- **User Story 1 (Phase 3)**: Depends on Foundational completion; no dependency on other stories.
- **User Story 2 (Phase 4)**: Depends on Foundational completion; may run after Story 1 but should validate independently.
- **User Story 3 (Phase 5)**: Depends on Foundational completion and should validate independently from the story-specific automation.
- **Polish (Phase 6)**: Depends on all desired story work being complete.

### Within Each User Story

- Branch validation before PR creation
- Non-main branch requirement before implementation
- PR target and issue reference before completion
- Final verification before reporting completion

### Parallel Opportunities

- T002 and T003 can run in parallel during Setup.
- T006 and T007 can run in parallel during the Foundational phase.
- T009 and T011 can run in parallel in User Story 1 if branch validation and workflow documentation are updated independently.
- T013 and T016 can run in parallel in User Story 2 if the skill instructions and status transition checks are validated separately.
- T017 and T018 can run in parallel in User Story 3 if review and documentation updates are split.
- T021 and T023 can run in parallel during final polish validation.

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1 and Phase 2.
2. Validate the branch lifecycle requirement from User Story 1.
3. Confirm the repository rejects direct implementation on `main`.
4. Stop and verify the requirement before proceeding to PR creation enforcement.

### Incremental Delivery

1. Enforce branch creation in the specify flow.
2. Enforce PR creation in the implement flow.
3. Add traceability and documentation consistency for issue/branch/PR accountability.
4. Run repository validation against the final workflow contract.
