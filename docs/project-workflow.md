# Bramhecha Ceramics — Development Workflow

## GitHub Project Status

Backlog → Ready → In Progress → Review → Done

## Status Ownership

| Status | Trigger | Owner |
|---|---|---|
| Backlog | Issue created | GitHub |
| Ready | `/speckit-analyze` passes | Spec Kit |
| In Progress | `/speckit-implement` starts | Spec Kit |
| Review | Pull Request created | New-PullRequest.ps1 |
| Done | PR merged / issue closed | GitHub Project automation |

## Development Flow

1. User requests work.
2. Identify the GitHub Issue.
3. Fetch Issue with `gh issue view`.
4. Create a non-main branch.
5. Run `/speckit-specify`.
6. Run `/speckit-clarify`.
7. Run `/speckit-plan`.
8. Run `/speckit-checklist`.
9. Run `/speckit-tasks`.
10. Run `/speckit-analyze`.
11. Move Issue from Backlog to Ready.
12. Run `/speckit-implement`.
13. Move Issue from Ready to In Progress.
14. Validate implementation.
15. Run `/speckit-commit-pr` or `./scripts/CommitAndCreatePr.ps1` to commit and open the PR.
16. Push feature branch and create Pull Request through the repo script.
17. Move Issue from In Progress to Review.
18. Review and run CI.
19. Merge Pull Request into main.
20. GitHub Project moves the work to Done.

## Non-Negotiable Rule

No implementation work may be performed directly on main.

The repository uses the installed Spec Kit workflow, GitHub Issues, and the PowerShell PR script for pull request creation.
