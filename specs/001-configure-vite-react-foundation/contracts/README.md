# Contracts

This feature does not expose a backend API or service contract. The repository-level contract is the expected developer workflow and project health checks.

## Project Contract

### Local development
- Prerequisite: Node.js and npm installed
- Command: `npm install`
- Command: `npm run dev`
- Expected outcome: the app starts locally without setup blockers

### Build validation
- Command: `npm run build`
- Expected outcome: the production bundle compiles successfully

### Quality validation
- Command: `npm run lint`
- Expected outcome: linting runs without blocking errors in the configured repository rules

## Contract Notes

This is a lightweight static frontend project, so there are no external API contracts to document. Future feature work should specify any external integrations when they are introduced.
