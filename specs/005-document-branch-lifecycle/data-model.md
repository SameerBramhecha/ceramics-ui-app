# Data Model: Branch lifecycle documentation

## Overview

This feature is a documentation-only workflow change. The data model is intentionally lightweight and focuses on the repository entities that contributors interact with when following the branch lifecycle.

## Entities

### Branch

Represents a named workstream created for a task or stage in the SDLC.

**Fields**
- name: unique branch identifier such as `spec/*`, `feature/*`, or `impl/*`
- purpose: identifies whether the branch supports specification, implementation, or review work
- lifecycle stage: specify, implement, review, or merged

**Relationships**
- A branch belongs to a single GitHub issue or work item.
- A branch may culminate in a pull request before merge into the protected branch.

### Pull Request

Represents the formal review gate before changes are merged into the protected default branch.

**Fields**
- source branch: the branch containing the proposed change
- target branch: usually `main` or the repository default branch
- required approval count: at least one approving review
- status: open, approved, merged, or closed

**Relationships**
- A pull request is associated with one or more branches.
- A pull request is informed by the repository workflow and the linked GitHub issue.

### Contributor

Represents anyone working in the repository.

**Fields**
- role: contributor, reviewer, maintainer
- responsibilities: create appropriate branch names, follow PR workflow, confirm merge requirements

**Relationships**
- Contributors create branches and open pull requests.
- Reviewers approve work before merge.

### Repository Workflow

Represents the documented operating rules for this repository.

**Fields**
- protected default branch: `main`
- branch naming conventions: `spec/*`, `feature/*`, `impl/*`
- review requirement: at least one approving review required
- deletion policy: branches auto-delete on merge when repository settings enable it

**Relationships**
- The workflow governs branch creation, PR creation, and merge behavior.
- It connects the contributor process to the repository settings and the PR template.

## Validation rules

- Branch names must reflect the correct stage of work.
- Pull requests are mandatory before the protected branch receives changes.
- A pull request requires at least one approving review.
- The repository must provide clear references to the PR template and branch protection guidance.

## State transitions

- `new branch` -> `spec branch` or `implementation branch`
- `branch in progress` -> `pull request opened`
- `pull request approved` -> `merge to protected branch`
- `merge complete` -> `branch auto-deleted when configured`
