# Research: Branch naming and lifecycle documentation

## Summary

The feature requires a concise documentation update in CONTRIBUTING.md that explains branch naming guidance, merge expectations, and the relationship between branch lifecycle stages and pull requests. The repository already defines a protected main branch, issue-driven development, and a PR review policy in the project constitution, so the documentation update should formalize those expectations rather than introduce new workflow rules.

## Decision: use a single documented lifecycle section

The repository will add a short Branch lifecycle section to CONTRIBUTING.md that summarizes the branch naming conventions and the expected review process.

### Rationale

- The issue explicitly requests a short documented lifecycle summary for contributors.
- The project constitution already states the required branch policy and PR requirements.
- A lightweight documentation section reduces confusion without changing the broader SDLC process.
- Contributors need a discoverable reference that points them to the PR template and branch protection settings.

## Decision: branch prefixes map to workflow stages

The documentation will describe the following naming conventions:

- `spec/*` for work created during the specify stage
- `impl/*` or `feature/*` for work created during implementation

### Rationale

This keeps the feature aligned with the repository’s branch policy while preserving a clear distinction between planning/specification work and implementation work.

## Decision: pull requests remain mandatory before merge

The documentation will state that merges into the protected branch must use a pull request and require at least one approving review.

### Rationale

This matches the project constitution and protects the `main` branch from unreviewed changes. It also reduces ambiguity for contributors who are preparing to merge work.

## Decision: reference the PR template and branch protection settings

The documentation will point contributors to the PR template and the repository’s branch protection rules in GitHub settings.

### Rationale

The issue specifically asks for visible references to the PR template and protection rules so contributors do not need to guess the proper workflow.

## Alternatives considered

### Alternative: only document `feature/*` usage

Rejected because the project already distinguishes specification work from implementation work, and the issue itself explicitly calls out `spec/*` as a valid branch type.

### Alternative: omit review requirements from the lifecycle section

Rejected because the constitution already requires a PR and approval before merge; leaving this out would create a gap between policy and contributor guidance.

### Alternative: keep all instructions embedded only in CONTRIBUTING.md

Rejected because the issue specifically asks for cross-references to the PR template and branch protection configuration so contributors can access the repository’s supporting materials directly.
