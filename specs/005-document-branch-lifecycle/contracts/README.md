# Branch Lifecycle Contract

## Purpose

This repository contract defines the expected branch lifecycle and review rules for all work targeting the protected default branch.

## Contract format

The contributor workflow is defined by the following expectations:

```md
Branch lifecycle
- `spec/*` — create branches during the specify stage
- `impl/*` or `feature/*` — use during the implement stage and open PRs
- PRs must be used to merge into `main`/`develop`; at least 1 approving review required
- Branches are auto-deleted on merge (repo setting enabled)
```

## Semantics

- `spec/*` branches are used for specification and planning work.
- `impl/*` and `feature/*` branches are used for implementation work.
- All code changes targeting the protected branch must use a pull request.
- The pull request process requires at least one approving review before merge.
- Branch deletion on merge is a repository setting and should be documented as conditional rather than guaranteed.

## Consumer expectations

- Contributors should create branches matching the current lifecycle stage.
- Reviewers should expect PR-based merge flow for all protected branch changes.
- Maintainers and contributors should use the PR template and branch protection rules as the authoritative workflow references.
