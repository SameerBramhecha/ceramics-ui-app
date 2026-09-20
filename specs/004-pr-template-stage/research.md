# Research: PR Template Stage

## Decision

Create a repository-level GitHub pull request template at `.github/PULL_REQUEST_TEMPLATE.md` that includes a Stage section with checkboxes for `specify` and `implement`, along with a Description section for a short PR summary.

## Rationale

- Matches the issue requirement and preserves traceability to the original GitHub Issue.
- Keeps the workflow visible in the GitHub pull request UI without blocking contributors from opening PRs.
- Aligns with the repository’s lightweight static-site architecture and issue-driven delivery process.
- Provides a stable foundation for future automation, such as label assignment or a CI check, without introducing a hard blocker in the first iteration.

## Alternatives considered

- Immediate hard enforcement via repository settings or CI checks: rejected because the issue specifically calls for soft enforcement and the repository is still establishing the SDLC conventions.
- Branch-based or label-only tracking: rejected because those approaches are less obvious to reviewers and do not surface the stage in the pull request body itself.
- Complex multi-step PR metadata: rejected because the requirement is intentionally simple and must stay low-friction for contributors.

## Open questions resolved

- No unresolved clarifications remain for the feature; the requirements are specific enough to proceed into design and validation.
- The stage is defined as the SDLC phase rather than a technical label, which keeps it aligned with the project constitution and GitHub issue wording.
