# Quickstart: Branch lifecycle validation

## Purpose

This guide validates that the documentation communicates the repository’s branch lifecycle clearly enough for contributors to follow without additional clarification.

## Prerequisites

- Access to the repository on GitHub
- Permission to view CONTRIBUTING.md and the repository settings
- Access to the pull request template in `.github/PULL_REQUEST_TEMPLATE.md`

## Validation steps

1. Open [CONTRIBUTING.md](../../CONTRIBUTING.md) and locate the Branch lifecycle section.
2. Confirm the section explains the difference between `spec/*` and `impl/*` or `feature/*` branches.
3. Confirm the documentation states that pull requests are required before merging changes into `main`.
4. Confirm the workflow states that at least one approving review is required before merge.
5. Confirm the section references the repository PR template and branch protection rules.
6. Confirm the documentation describes branch auto-deletion behavior when enabled in the GitHub repository settings.

## Expected outcome

A contributor should be able to determine the correct branch strategy and review workflow from the documentation alone, without needing to ask for process clarification.
