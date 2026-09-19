# Quickstart: Validate Branch and PR Lifecycle

## Prerequisites

- Git repository is checked out locally.
- GitHub CLI (`gh`) is installed and authenticated.
- The repository has a valid open issue for the feature being worked.
- The repository is not currently on `main` when creating a feature branch.

## Validation Scenarios

### Scenario 1: Feature branch is created before implementation

1. Start from the issue-driven workflow and identify the GitHub issue.
2. Run the branch-creation workflow or script for the issue.
3. Confirm that the current branch is not `main`.
4. Confirm the branch name follows the pattern `feature/<issue>-<description>`.
5. Confirm the issue is still open and active.

Expected outcome: A dedicated non-main branch exists before implementation begins.

### Scenario 2: Pull request is created after implementation

1. Complete the implementation work on the feature branch.
2. Validate the work locally according to project requirements.
3. Trigger the pull request creation workflow or script.
4. Confirm that the PR targets `main`.
5. Confirm that the PR body references the issue via `Closes #<issue>` or an equivalent issue link.

Expected outcome: A pull request exists against `main`, and review can begin.

### Scenario 3: Failure is surfaced instead of skipped

1. Attempt branch or PR creation when access is missing or the issue is closed.
2. Observe the command output and exit status.
3. Confirm the workflow stops rather than continuing silently.

Expected outcome: The failure is visible and actionable.

## Suggested verification commands

```powershell
git branch --show-current
gh issue view 25 --json state,title,url
./scripts/New-FeatureBranch.ps1 -IssueNumber 25
./scripts/New-PullRequest.ps1 -IssueNumber 25
```

## Expected validation result

The branch lifecycle is considered valid when the repository consistently creates a non-main feature branch before implementation and opens a pull request against `main` before the change is merged.
