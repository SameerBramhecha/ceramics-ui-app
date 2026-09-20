# Data Model: GitHub Pages Deployment

## Core Entities

### Production Branch
- Represents the approved release state of the repository.
- Must be the only branch allowed to trigger the public deployment workflow.
- Primary relationship: publishes the final build artifact to the GitHub Pages environment.

### Feature Branch
- Represents in-progress work that is not yet approved for public release.
- Must remain excluded from the public deployment workflow.
- Primary relationship: isolated from the production deployment path until merged to `main`.

### Build Artifact
- Generated from the repository’s static build process (`npm run build`).
- Contains bundled HTML, CSS, JavaScript, and static assets for the site.
- Primary relationship: uploaded to GitHub Pages as the deployment payload.

### GitHub Pages Environment
- The public hosting target for the static site.
- Requires a repository-specific base path so generated URLs resolve correctly.
- Primary relationship: receives published output from the production branch workflow.

## Lifecycle / State Transitions

1. Repository branch is created for work (`feature/...`).
2. Feature branch remains isolated from production publication.
3. Branch merges to `main` after review.
4. GitHub Actions workflow executes for the production branch.
5. Build artifact is generated and uploaded.
6. GitHub Pages environment publishes the artifact to the public site.

## Validation Rules

- Deployment triggers only when the workflow runs from `main`.
- Feature branches must not trigger the production deployment path.
- Publish output must respect the repository path prefix required by the Vite configuration.
- Deployment integrity depends on a successful static build and artifact upload.
