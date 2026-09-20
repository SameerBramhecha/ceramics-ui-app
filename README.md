# Bramhecha Ceramics

## Stack

- React
- TypeScript
- Vite
- GitHub Actions
- GitHub Pages

## Development Workflow

GitHub Issue
→ Spec Kit
→ Feature Branch
→ Implementation
→ Pull Request
→ CI
→ Review
→ main

## Branch Rule

Never commit directly to main.

## SDLC Status

Backlog
→ Ready
→ In Progress
→ Review
→ Done

## Development Commands

```bash
npm install
npm run dev
npm run build
npm run lint
```

## GitHub CLI

```bash
gh auth login
```

## Feature Branch

```powershell
./scripts/New-FeatureBranch.ps1 -IssueNumber <number>
```

## Commit and Pull Request

```powershell
./scripts/CommitAndCreatePr.ps1 -IssueNumber <number> -CommitMessage "Implement issue #<number>"
```

This stages all changes, creates a commit on the current feature branch, and then opens the PR through the repository-supported workflow.

## Pull Request

```powershell
./scripts/New-PullRequest.ps1 -IssueNumber <number>
```
