---
name: "speckit-commit-pr"
description: "Stage changes, commit the active issue branch, and create the pull request"
compatibility: "Requires a GitHub Issue, a non-main branch, and the repository scripts"
metadata:
  author: "github-spec-kit"
---

## User Input

```text
$ARGUMENTS
```

You MUST consider the user input before proceeding (if not empty).

## Purpose

Use this command when the implementation is complete and the work is ready to be committed and moved into review.

This command is the explicit handoff from implementation to review.

## Guardrails

- The current branch must not be `main`.
- The work must be tied to a valid GitHub Issue.
- The repo must be in a good local validation state before committing.
- Do not auto-create a PR from `main`.
- Use the repository script instead of ad hoc PR commands when available.
- The PR body must follow the repository template in [.github/PULL_REQUEST_TEMPLATE.md](../../.github/PULL_REQUEST_TEMPLATE.md), with the `implement` stage checked and the `specify` stage left unchecked unless the PR is truly a specification update.

## Required step

Run:

```powershell
./scripts/CommitAndCreatePr.ps1 -IssueNumber <issue-number> -CommitMessage "<commit message>"
```

If the user provides a custom commit message, pass it through. If no message is provided, default to:

```text
Implement issue #<issue-number>
```

If the repository is already clean and there are no changes, stop and tell the user there is nothing to commit.

## Execution flow

1. Verify the current branch is not `main`.
2. Verify the issue number is valid and accessible via `gh issue view`.
3. Run `git add -A` and create a commit.
4. Run the repo-supported PR helper:

   ```powershell
   ./scripts/New-PullRequest.ps1 -IssueNumber <issue-number>
   ```

5. Report success and the resulting PR status.
6. Do not claim the work is in `Review` unless the PR step completes successfully.

## Optional behavior

If the user wants to skip PR creation and only commit locally, use:

```powershell
./scripts/CommitAndCreatePr.ps1 -IssueNumber <issue-number> -CommitMessage "<commit message>" -SkipPr
```

This is useful when the user wants to review the commit before opening the pull request.

## Output expectations

The command should print:
- the issue number being committed
- the active branch name
- the commit message used
- whether the pull request was created successfully
- any error if the issue, branch, or PR step fails
