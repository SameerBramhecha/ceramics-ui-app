# Quickstart: GitHub Pages Deployment Validation

## Prerequisites

- Repository access with permission to push to `main`
- GitHub Pages enabled for the repository
- Node.js 20 or compatible runtime
- Local checkout of the repository

## Validation Steps

1. Install dependencies:
   ```bash
   npm ci
   ```

2. Confirm the production-ready static build succeeds:
   ```bash
   npm run build
   ```

3. Verify the output is compatible with the GitHub Pages base path:
   - Confirm the repository base in `vite.config.ts` matches the Pages project URL.
   - Inspect the generated `dist` output and ensure asset URLs resolve under the expected project path.

4. Trigger the deployment workflow by pushing to `main` or by running the workflow manually.

5. Confirm the workflow runs successfully and the site is published to the GitHub Pages environment.

## Expected Outcomes

- The site builds without errors.
- The deploy workflow runs only from the production branch.
- The published site loads from the repository GitHub Pages URL with correct asset paths.
- Feature branches remain excluded from production deployment.
