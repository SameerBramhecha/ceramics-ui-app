# Contracts

This feature does not expose a separate application API or public service contract. The contract here is the repository workflow contract enforced by GitHub Issue, branch naming, and pull request creation rules.

## Repository workflow contract

- Every implementation request starts from an open GitHub issue.
- A non-main feature branch must be created before implementation begins.
- The feature branch must remain traceable to the originating issue.
- A pull request must be created against `main` before merge.
- The pull request must reference the originating issue.
- The repository must surface failures instead of silently skipping required workflow steps.

## Validation

This contract is verified through the repository scripts and the GitHub project workflow rather than through an HTTP or CLI API surface.
