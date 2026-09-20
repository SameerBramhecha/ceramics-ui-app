# Implementation Plan: GitHub Pages Deployment

**Branch**: `feature/8-github-pages-deployment` | **Date**: 2026-09-20 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from [spec.md](./spec.md)

## Summary

Configure the repository to publish the Bramhecha Ceramics site from the production branch using GitHub Pages, while keeping feature branches out of the production deployment path. The solution stays within the project constitution: React + TypeScript + Vite + npm, lightweight static hosting, and issue-driven branch review.

## Technical Context

**Language/Version**: TypeScript 6.x, React 19.x, Vite 8.x, Node.js 20 in CI

**Primary Dependencies**: react, react-dom, vite, @vitejs/plugin-react, actions/deploy-pages, actions/upload-pages-artifact

**Storage**: N/A (static front-end application)

**Testing**: `npm ci`, `npm run build`, `npm run lint`, and a Pages deployment smoke check via the workflow output

**Target Platform**: GitHub Pages-compatible static web app

**Project Type**: web application / single-page frontend

**Performance Goals**: fast static load with no backend runtime; build output should deploy cleanly as a static site

**Constraints**: deployment must originate from `main`, the repository Vite base path must match the GitHub Pages project URL, and feature branches must not publish to production

**Scale/Scope**: small marketing site for a ceramics product catalog and brand showcase

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- ✅ Project purpose aligns with the Bramhecha Ceramics showcase website and GitHub Pages hosting model.
- ✅ Technology stack matches the constitution: React + TypeScript + Vite + npm.
- ✅ GitHub Issue #8 is the source of truth; the spec remains traceable to the issue requirements and acceptance criteria.
- ✅ Branching policy is preserved: deployment work remains on a non-main feature branch and does not bypass repository review expectations.
- ✅ Production deployment is constrained to the main branch, with feature branches kept out of the public deployment path.
- ✅ No project status change is performed in planning; the issue remains in Backlog until implementation and pull-request gating later in the workflow.

## Project Structure

### Documentation (this feature)

```text
specs/006-github-pages-deployment/
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
│   └── README.md
├── checklists/
│   └── requirements.md
├── spec.md
└── tasks.md (created later by /speckit-tasks)
```

### Source Code (repository root)

```text
.github/
├── workflows/
│   └── deploy-pages.yml
public/
├── [static assets]
src/
├── App.css
├── App.tsx
├── assets/
├── index.css
├── main.tsx
index.html
package.json
vite.config.ts
eslint.config.js
tsconfig.json
tsconfig.app.json
tsconfig.node.json
```

**Structure Decision**: Use the existing single-project Vite React app structure rooted at the repository. Keep deployment configuration at the repository root with the Vite base path aligned to the GitHub Pages project slug, and keep the workflow logic in the repository’s GitHub Actions config rather than adding a separate runtime service.

## Complexity Tracking

No constitution violations or unjustified complexity are present for this issue. The solution remains intentionally lightweight and aligned to the repository’s existing static hosting requirements and GitHub Pages deployment model.