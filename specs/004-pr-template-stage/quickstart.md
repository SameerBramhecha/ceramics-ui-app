# Quickstart: Validating the PR Template Stage Feature

## Prerequisites

- Repository access with permission to create or edit pull request templates.
- A working GitHub branch that will be used to open a pull request.

## Validation scenarios

### Scenario 1: Template is visible in a pull request

1. Open the repository in GitHub.
2. Create a new branch for a small change.
3. Open a new pull request.
4. Confirm that the repository shows a Stage section with `specify` and `implement` checkboxes.
5. Confirm that the PR body also contains a Description prompt.

**Expected outcome**: The PR template appears with the stage and description fields without requiring custom setup.

### Scenario 2: Stage is clearly communicated

1. Select the appropriate checkbox for the work phase.
2. Write a short description of the change in the Description section.
3. Submit the pull request.

**Expected outcome**: Reviewers can quickly determine the SDLC stage from the PR content without additional clarification.

### Scenario 3: Soft enforcement remains non-blocking

1. Open a PR without selecting a stage.
2. Confirm that the repository still allows the PR to be created.

**Expected outcome**: The workflow behaves as a soft enforcement mechanism, making the stage visible while avoiding an immediate block on contributor work.

## Success indicators

- The PR template is easy to find and use.
- The stage remains visible in the pull request body.
- Contributors and reviewers can interpret the work phase without ambiguity.
