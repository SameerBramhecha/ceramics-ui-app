# Data Model: PR Template Stage

## Overview

This feature does not introduce a persistent application database or runtime model. The core information model is the repository pull request metadata that contributors provide when opening or updating a pull request.

## Entities

### PullRequest

Represents a proposed change submitted for review through GitHub.

**Fields**
- `title`: human-readable summary of the change
- `description`: narrative explanation of what the PR changes and why
- `stage`: one of `specify` or `implement`
- `reference`: optional link to the originating issue or related work item

**Validation rules**
- The stage field must be represented clearly in the pull request body.
- The stage should be selected from the repository’s standard set of values.
- The description should explain the purpose and impact of the change.

**Relationships**
- A pull request is associated with one or more repository changes and may reference one GitHub Issue.
- A stage declaration communicates to reviewers the current SDLC phase for the work.

### StageDeclaration

Represents the SDLC checkpoint selected by the contributor.

**Values**
- `specify`: work is focused on requirements and planning
- `implement`: work is focused on delivery and code changes

**Validation rules**
- The value must be selected from the approved stage list.
- The declaration should remain visible in the PR description for review and future automation.

## State and lifecycle

The stage declaration is a review-time metadata field rather than a system-managed state machine. The purpose is to support better process visibility and to prepare for later automation without making the template an immediate blocker.

## Notes

- This model is intentionally compact because the change is a repository workflow enhancement rather than a product data-system change.
- No database migration or runtime persistence is required for implementation.
