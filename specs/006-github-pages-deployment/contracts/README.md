# Deployment Contract

## Summary

The repository publishes a static site to GitHub Pages using a GitHub Actions workflow. The deployment flow is internal to the repository and does not expose a separate API or runtime interface.

## Trigger Contract

```yaml
on:
  push:
    branches: [main]
  workflow_dispatch:
```

## Required Permissions

```yaml
permissions:
  contents: read
  pages: write
  id-token: write
```

## Build and Publish Contract

1. Check out the repository.
2. Install the project dependencies with `npm ci`.
3. Build the static package with `npm run build`.
4. Upload the generated `dist` directory as the Pages artifact.
5. Deploy the artifact to the GitHub Pages environment using the official GitHub Pages action.

## Postconditions

- Only the main branch may produce public deployment output.
- Feature branches do not publish to the production Pages environment.
- Output asset URLs respect the repository-specific base path configured for the Vite app.
