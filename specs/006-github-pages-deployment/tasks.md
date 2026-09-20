# Tasks: GitHub Pages Deployment

**Input**: Design documents from `/specs/006-github-pages-deployment/`

**Traceability**: GitHub Issue #8 — "Configure GitHub Pages deployment"; spec.md and plan.md are the source requirements for this work.

**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: Not required for this issue; validation is performed via build and deployment workflow checks rather than a separate test suite.

**Organization**: Tasks are grouped by user story to enable independent implementation and validation of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Confirm the repository is ready for GitHub Pages deployment and that the working branch and workflow expectations align with the issue and project constitution.

- [x] T001 [P] Review the issue, spec, and plan entries for GitHub Pages deployment traceability in spec.md, plan.md, and issue #8 requirements
- [x] T002 [P] Confirm the static app structure and Pages-compatible build inputs in package.json, vite.config.ts, and the repo root configuration are compatible with the repository’s Vite + React + GitHub Pages model

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Establish the deployment baseline that must be complete before story-specific deployment work can be validated.

**⚠️ CRITICAL**: No story work can begin until this phase is complete.

- [x] T003 Confirm the repository uses the correct Vite base path for the GitHub Pages project slug in vite.config.ts
- [x] T004 Validate the GitHub Pages workflow in .github/workflows/deploy-pages.yml uses the proper permissions, build steps, and artifact upload path for a static site
- [x] T005 [P] Confirm the build pipeline in package.json and the workflow step sequence produce a deployable `dist/` artifact from the main branch
- [x] T006 [P] Check that deployment flow uses the repository’s standard Pages artifact pattern and that the workflow is ready for production publication

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel.

---

## Phase 3: User Story 1 - Publish the website from production (Priority: P1) 🎯 MVP

**Goal**: Ensure the public site is published from the production branch using the repository’s GitHub Pages configuration.

**Independent Test**: A push or manual run on `main` triggers the deployment workflow and the site publishes successfully with asset paths resolved under the repository Pages URL.

### Implementation for User Story 1

- [x] T007 [P] [US1] Update .github/workflows/deploy-pages.yml to trigger on `main` and manual dispatch while preserving the Pages deployment flow for the production branch only
- [x] T008 [US1] Verify the Vite base path in vite.config.ts matches the repository’s GitHub Pages project URL and supports a clean static build
- [x] T009 [US1] Validate the build output in `dist/` resolves asset paths correctly under the expected repository prefix
- [x] T010 [US1] Document the production deployment verification steps in README.md or specs/006-github-pages-deployment/quickstart.md so maintainers can repeat the validation flow

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently.

---

## Phase 4: User Story 2 - Prevent feature-branch deployments from reaching production (Priority: P2)

**Goal**: Keep unfinished work on feature branches isolated from the public deployment target.

**Independent Test**: A branch other than `main` does not cause the production GitHub Pages deployment to run.

### Implementation for User Story 2

- [x] T011 [P] [US2] Review the workflow trigger conditions in .github/workflows/deploy-pages.yml to ensure the deployment path is explicitly limited to the production branch
- [x] T012 [US2] Document the branch-isolation requirement in README.md so contributors understand that feature branches must not publish to production
- [x] T013 [US2] Validate that non-production branch changes do not trigger deployment by checking the workflow trigger conditions and repository branch policy

**Checkpoint**: At this point, User Stories 1 and 2 should both work independently.

---

## Phase 5: User Story 3 - Verify deployment readiness before release (Priority: P3)

**Goal**: Ensure the repository remains ready for repeatable and reviewable GitHub Pages releases.

**Independent Test**: The repository can be built, reviewed, and published without manual workaround, and the deployment configuration remains consistent with project governance.

### Implementation for User Story 3

- [x] T014 [P] [US3] Confirm the repository documentation in README.md and specs/006-github-pages-deployment/quickstart.md references the correct GitHub Pages deployment flow and expected production path
- [x] T015 [US3] Validate that the deployment configuration supports static hosting constraints and does not invent content or claims beyond the repo’s verified business context
- [x] T016 [US3] Run the final repository validation sequence (`npm ci`, `npm run build`, and `npm run lint`) to confirm the site remains deployable and the production workflow remains consistent

**Checkpoint**: All user stories should now be independently functional.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Final quality pass for the deployment issue and readiness for downstream review.

- [x] T017 [P] Review the full GitHub Pages workflow and Vite configuration to ensure the issue acceptance criteria are reflected without adding scope beyond the production branch requirement
- [x] T018 Confirm the feature remains traceable to GitHub Issue #8, the spec, and the plan before review or PR creation
- [x] T019 [P] Run the final deployment readiness check from specs/006-github-pages-deployment/quickstart.md and confirm the main-branch-only workflow and Pages configuration remain stable

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on setup completion - blocks all story work
- **User Story 1 (Phase 3)**: Depends on foundational completion and is the primary MVP
- **User Story 2 (Phase 4)**: Depends on foundational completion and protects the production deployment boundary
- **User Story 3 (Phase 5)**: Depends on foundational completion and validates release readiness
- **Polish (Phase 6)**: Depends on all desired story work being complete

### User Story Dependencies

- **User Story 1 (P1)**: No dependencies on other stories; this is the first incremental MVP
- **User Story 2 (P2)**: No dependencies on other stories; it enforces the non-production deployment boundary
- **User Story 3 (P3)**: No dependencies on other stories; it verifies deployment readiness and release confidence

### Within Each User Story

- Workflow and configuration tasks precede validation tasks
- Validation tasks are executed after the deployment flow is considered stable
- Story completion should be validated independently before moving to the next priority

### Parallel Opportunities

- The setup tasks marked [P] can run in parallel
- The foundational configuration checks marked [P] can run in parallel once the issue and repo context are confirmed
- The User Story 1 tasks for workflow and build verification can proceed in parallel once the foundation is ready
- The User Story 2 tasks for workflow guard validation and documentation can proceed in parallel after the production path is confirmed
- The User Story 3 documentation and validation tasks can proceed in parallel once the deployment model is stable

---

## Parallel Example: User Story 1

```bash
# Launch the independent deployment checks together after foundation work is complete:
Task: "Update .github/workflows/deploy-pages.yml to trigger on main and manual dispatch while preserving the Pages deployment flow for the production branch only"
Task: "Verify the Vite base path in vite.config.ts matches the repository’s GitHub Pages project URL and supports a clean static build"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Confirm the repo publishes from `main` without broken asset paths
5. If stable, continue to branch isolation and release readiness tasks

### Incremental Delivery

1. Complete Setup + Foundational → deployment baseline ready
2. Add User Story 1 → public production deployment proven
3. Add User Story 2 → feature branches remain excluded from production
4. Add User Story 3 → deployment readiness confirmed through validation
5. Each story adds value without breaking the release boundary

### Parallel Team Strategy

With multiple contributors:

1. Team completes Setup + Foundational together
2. Once the foundation is stable:
   - Contributor A: User Story 1
   - Contributor B: User Story 2
   - Contributor C: User Story 3
3. Story outputs are validated independently before moving to the polish phase

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] labels map each task to a specific user story for traceability
- Each user story is independently testable and should remain isolated from other story work
- This issue is a repository deployment task; no separate GitHub Issues should be created for each task because the issue already serves as the top-level work item
- Avoid vague tasks or implementation drift; tasks reflect the repository-level requirements and design artifacts, not testing of a specific UI behavior
