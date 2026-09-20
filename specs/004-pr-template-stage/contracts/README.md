# PR Template Contract

## Purpose

This repository contract defines the expected structure of a pull request created for work that follows the project SDLC.

## Contract format

When a contributor opens a pull request, the repository should present the following sections:

```md
## Stage
- [ ] specify
- [ ] implement

## Description
(Describe what this PR changes and why)
```

## Semantics

- The Stage section indicates whether the work is in the specify or implement phase.
- The Description section gives reviewers context on the change and its justification.
- The template is intentionally soft-enforcement friendly: the repository may later add CI or workflow automation that checks for missing stage information, but it does not block PR creation at the initial stage.

## Consumer expectations

- Contributors are expected to select the correct stage before submitting the PR for review.
- Reviewers should use the stage declaration to understand the work context quickly.
- Future automation can rely on the same field to apply labels, trigger checks, or generate workflow signals.
