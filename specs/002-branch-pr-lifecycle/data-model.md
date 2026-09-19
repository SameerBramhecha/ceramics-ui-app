# Data Model: Branch and PR Lifecycle

## Overview

This feature is modeled around the repository's issue-driven workflow rather than a user-facing product entity model. The core entities are the GitHub Issue, the feature branch, the pull request, and the project lifecycle state.

## Entities

### Issue

Represents the source-of-truth work request for a feature or fix.

**Fields**
- `number`: Unique issue identifier in GitHub.
- `title`: Human-readable summary of the requested work.
- `body`: Requirement details and acceptance information.
- `state`: Open or closed; only active issues are valid for implementation.
- `labels`: Optional metadata used for classification or filtering.
- `milestone`: Optional project milestone reference.
- `url`: Direct GitHub issue URL.

**Relationships**
- One issue may lead to one active feature branch.
- One issue may have one or more pull requests as review artifacts.
- The issue drives the project status across Backlog, Ready, In Progress, Review, and Done.

### Feature Branch

Represents the isolated work environment for a specific issue.

**Fields**
- `issueNumber`: The originating issue number.
- `branchName`: Repository branch name, typically `feature/<issue>-<description>`.
- `sourceBranch`: Usually the current base branch from which the branch is created.
- `status`: Active or closed; in this workflow, a valid branch must be non-main and issue-linked.

**Relationships**
- Must be created from a non-main branch or from the current feature context before implementation work begins.
- Links directly to a single originating issue for traceability.

### Pull Request

Represents the review and approval gate for work merged into `main`.

**Fields**
- `issueNumber`: The originating issue being resolved.
- `title`: Usually `Implement issue #<number>`.
- `body`: Review instructions and issue-closing reference.
- `targetBranch`: Always `main` for this repository policy.
- `sourceBranch`: The feature branch being reviewed.
- `status`: Open, merged, or closed.

**Relationships**
- Must reference the originating issue in the PR body.
- Must be created only after implementation is complete and ready for review.
- Drives movement from In Progress to Review.

### Project Status

Represents the repository lifecycle state for the work item.

**Fields**
- `state`: Backlog, Ready, In Progress, Review, or Done.
- `owner`: The phase responsible for state transitions.

**Relationships**
- Backlog is the initial issue state.
- Ready indicates specification and planning coverage has been completed.
- In Progress indicates implementation has started.
- Review indicates a PR has been created.
- Done indicates the PR has been merged or the issue has been closed.

## Validation Rules

- An issue may only be worked when it is active and open.
- Direct edits to the protected `main` branch are prohibited.
- Feature work must be performed on a non-main branch.
- Pull requests must target `main` and reference the issue number.
- The branch and PR must remain traceable to the originating issue.

## State Transitions

- `Backlog` → `Ready` after specification and planning are complete.
- `Ready` → `In Progress` when implementation starts.
- `In Progress` → `Review` after a real pull request exists.
- `Review` → `Done` after merge and/or issue closure.

## Notes

This repository does not expose a public app-level data model for this workflow feature; the model is repository-process oriented and based on GitHub issue, branch, and PR metadata.
