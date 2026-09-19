# Research: Branch and PR Lifecycle Enforcement

## Decision: Enforce the existing issue-driven workflow rather than introducing a new process

The repository already defines the required workflow in the constitution, project workflow documentation, and PowerShell helper scripts. The implementation should reinforce those existing conventions instead of inventing a second branch/PR process.

### Rationale

- The constitution explicitly states that GitHub Issues are the source of truth and that work must happen on non-main branches.
- The repository already contains dedicated automation for feature-branch creation and pull request creation: `scripts/New-FeatureBranch.ps1` and `scripts/New-PullRequest.ps1`.
- The project workflow documentation names the exact lifecycle: Backlog → Ready → In Progress → Review → Done.
- The issue requirement specifically calls for behavior in the specify stage and implement stage, which matches the established project workflow and branch naming conventions.

### Alternatives considered

1. Manual branch creation through ad hoc git commands
   - Rejected because it is inconsistent with the documented workflow and the risk of forgetting branch creation during specify.

2. A GitHub Actions-only enforcement model
   - Rejected because the repo already emphasizes issue-driven local workflow and script-based automation; a script-based approach preserves repository conventions and traceability.

3. Creating a new PR model outside the repo scripts
   - Rejected because the existing pull request script already includes the required issue reference and review status update.

## Decision: Keep branch naming aligned to the repository convention

Feature branches should follow the repository pattern `feature/<issue>-<description>`.

### Rationale

- The constitution defines the naming pattern and examples.
- The existing script `New-FeatureBranch.ps1` generates `feature/<IssueNumber>-<slug>` branches, preserving traceability to the issue and readable branch names.

### Alternatives considered

1. Generic branch names such as `feature/branch-1`
   - Rejected because it weakens issue traceability and violates the policy in the constitution.

2. Using a separate branch taxonomy for workflow automation only
   - Rejected because the constitution is explicit that feature work should use the feature/ prefix.

## Decision: PR creation remains a post-implementation review gate

Implementation work must be submitted through a pull request targeting `main` after validation and before merge.

### Rationale

- The PR script already creates a pull request with a title, body, issue reference, and `Review` status update.
- The constitution requires every change targeting `main` to go through a pull request.
- This preserves human review and the issue-to-PR link required by the repository policy.

### Alternatives considered

1. Direct merge to `main` after validation
   - Rejected because it violates the constitution and process requirement.

2. Automated PR creation before implementation is finished
   - Rejected because the workflow requires PR creation after implementation is complete and ready for review.

## Decision: Treat the repo as workflow+validation automation, not a product runtime change

This feature is primarily a repository workflow and specification compliance update. The app itself remains a Vite + React + TypeScript project with no product-level behavior change.

### Rationale

- The issue only concerns lifecycle controls and repository skill/process requirements.
- The existing project stack remains intact and the constitution prohibits unnecessary dependencies.
- Validation should focus on workflow compliance rather than app feature behavior.

### Alternatives considered

1. Reworking the app’s UI or product features
   - Rejected because it would make the feature scope broader than the approved issue.

2. Adding heavy developer tooling or APis just for enforcement
   - Rejected because the repo’s lightweight conventions and scripts are sufficient.

## Open assumptions

- The repository maintains access to `gh` and Git for branch/PR work.
- The feature branch is created during the specify stage before implementation begins.
- The pull request is created by the repository's automation script or equivalent workflow during implement.
- If a branch or PR creation step fails, the workflow must report the failure and stop rather than silently continuing.
