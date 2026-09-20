# Research: GitHub Pages Deployment

## Decision

Use the repository’s GitHub Actions Pages deployment workflow, configured to run on `main` only, and keep the Vite `base` value aligned to the repository slug (`/ceramics-ui-app/`).

## Rationale

- The project is a static React + Vite site, so GitHub Pages is the correct hosting target and does not require a separate server runtime.
- GitHub’s official Pages deployment actions provide a reliable, repository-native publish pipeline for static artifacts.
- Keeping the workflow limited to `main` aligns with the project constitution and prevents feature-branch work from being published to the public site.
- The Vite `base` value is required for asset paths to resolve correctly when the app is served from a repository project site.

## Alternatives considered

- Using a `gh-pages` branch deployment: rejected because the repository already standardizes on GitHub Actions and the official Pages deployment path is simpler and more maintainable.
- Publishing from feature branches: rejected because it would violate the acceptance criteria and the project’s production branch policy.
- Custom hosting or a backend runtime: rejected as unnecessary for a static marketing site and inconsistent with the project’s lightweight deployment model.

## Assumptions

- The repository remains a single static app with no server-side dependencies.
- The deployed project URL follows the GitHub Pages repository structure and therefore requires a repository-specific base path.
- The deployment artifact is the build output from `npm run build`, which is the expected static distribution for Pages hosting.
