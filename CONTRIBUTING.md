# Contributing

Thanks for helping improve Bramhecha Ceramics. Please follow the repository workflow below so work stays aligned with the issue-driven development process and the protected `main` branch.

## Branch lifecycle

- `spec/*` — use for branches created during the specify stage
- `feature/*` or `impl/*` — use for implementation work during the implement stage
- Never commit directly to `main`; create a non-main branch for every change
- Open a pull request before merging into `main` or `develop`
- Require at least one approving review before merge is accepted
- Branches are auto-deleted on merge when the repository setting is enabled

This project follows the issue-driven workflow documented in the repository and the GitHub Project lifecycle. Work should start from an issue, move through specification and planning, and then be implemented on a feature branch before review.

## Pull request workflow

Use the repository PR template in [.github/PULL_REQUEST_TEMPLATE.md](.github/PULL_REQUEST_TEMPLATE.md) when creating a pull request. The template includes the stage marker and description fields used by the project workflow.

Check the GitHub repository settings under `Settings` → `Branches` → `Branch protection rules` to confirm the current protected branch and merge requirements on the repository.

## Required review and merge policy

- All changes targeting `main` must go through a pull request
- At least one approving review is required before merge
- CI and validation checks should pass before merge is accepted
- Avoid direct pushes or bypassing the review flow
