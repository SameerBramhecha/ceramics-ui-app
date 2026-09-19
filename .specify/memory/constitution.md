# Bramhecha Ceramics — SDD Constitution

## 1. Project Purpose

Bramhecha Ceramics is a responsive showcase website for a ceramics business offering:

* Ceramic tiles
* Sanitary ware

Known brands include:

* Arvis
* Leopard
* Letoza
* Wall Cera
* Seagam
* Passion

The initial website navigation consists of:

* Home
* About
* Gallery
* Contact

The website MUST be responsive, mobile friendly, accessible, and deployable to GitHub Pages.

---

## 2. Technology Stack

The application MUST use:

* React
* TypeScript
* Vite
* npm

The project is initialized from the Vite React TypeScript template.

The implementation SHOULD remain lightweight and suitable for static hosting.

Unnecessary dependencies SHOULD NOT be introduced.

---

## 3. Issue-Driven Spec-Driven Development

GitHub Issues are the source of truth for requested work.

For issue-driven implementation, the workflow MUST be:

```text
GitHub Issue
    ↓
gh issue view
    ↓
/speckit-specify
    ↓
/speckit-clarify
    ↓
/speckit-plan
    ↓
/speckit-checklist
    ↓
/speckit-tasks
    ↓
/speckit-analyze
    ↓
/speckit-implement
    ↓
push feature branch
    ↓
create Pull Request
    ↓
CI + human review
    ↓
merge into main
```

The current GitHub Issue MUST be fetched before specification generation when an Issue reference is provided.

The Issue number, title, body, acceptance criteria, labels, milestone, and URL SHOULD be retained for traceability.

---

## 4. Git Branching Policy

`main` is the protected production branch.

Direct development on `main` is PROHIBITED.

No implementation, content, design, accessibility, infrastructure, configuration, or documentation work may be committed directly to `main`.

All work MUST be performed on a non-main branch.

Branch names SHOULD follow:

```text
feature/<issue>-<description>
content/<issue>-<description>
design/<issue>-<description>
a11y/<issue>-<description>
infra/<issue>-<description>
```

Examples:

```text
feature/12-pdf-gallery
design/8-ceramic-theme
content/11-brand-content
a11y/10-accessibility-baseline
infra/7-github-pages
```

---

## 5. Pull Request Policy

Every change targeting `main` MUST use a Pull Request.

The Pull Request SHOULD reference the originating GitHub Issue.

Example:

```text
Closes #12
```

Required CI checks MUST pass before merge.

Auto-merge SHOULD NOT be used unless explicitly enabled by the repository owner.

---

## 6. SDLC Project Status

The GitHub Project MUST use:

```text
Backlog
Ready
In Progress
Review
Done
```

Status ownership is:

| Lifecycle event                          | Status        |
| ---------------------------------------- | ------------- |
| Issue created                            | `Backlog`     |
| Specification/planning/analysis complete | `Ready`       |
| Implementation starts                    | `In Progress` |
| Pull Request exists                      | `Review`      |
| Pull Request merged / Issue closed       | `Done`        |

### Backlog → Ready

Owned by `/speckit-analyze`.

The transition is allowed only when:

* Specification exists.
* Clarification is complete or non-blocking.
* Plan exists.
* Tasks exist.
* Analysis reports no blocking inconsistency.

### Ready → In Progress

Owned by `/speckit-implement`.

Implementation MUST NOT begin before the issue is `Ready`.

### In Progress → Review

Performed by `scripts/New-PullRequest.ps1` after a real Pull Request has been successfully created.

The issue MUST NOT be moved to `Review` before the PR exists.

### Review → Done

Handled by GitHub Project automation after PR merge and/or Issue closure.

---

## 7. Spec Kit Skill Requirements

The following existing Spec Kit skills MUST be customized for this repository:

* `speckit-specify`
* `speckit-clarify`
* `speckit-plan`
* `speckit-checklist`
* `speckit-tasks`
* `speckit-analyze`
* `speckit-implement`

The repository MUST use only the installed, repository-supported Spec Kit skills and repository automation scripts.

---

## 8. Specification

Specifications MUST focus on:

* User needs
* Business value
* User scenarios
* Functional requirements
* Success criteria
* Scope
* Assumptions

Specifications SHOULD NOT contain implementation details that belong in the plan.

Where the specification originates from a GitHub Issue, the source Issue MUST remain traceable.

---

## 9. Clarification

Critical ambiguity SHOULD be resolved before implementation planning.

Maximum three blocking clarification questions SHOULD be used for a normal feature.

Clarifications that materially change business requirements SHOULD be recorded in the specification and, where appropriate, as a GitHub Issue comment.

---

## 10. Planning

The implementation plan MUST consider:

* The constitution
* The feature specification
* The originating GitHub Issue
* Existing project architecture

The plan MAY contain technical implementation details.

The plan MUST NOT silently change business requirements.

---

## 11. Tasks

Implementation tasks MUST be:

* Dependency ordered
* Traceable to the specification
* Traceable to the originating Issue
* Actionable by the implementing agent

Normal implementation tasks MUST NOT automatically become separate GitHub Issues.

---

## 12. Analyze Gate

`/speckit-analyze` is the final readiness gate.

If analysis finds blocking inconsistencies:

```text
Backlog → Backlog
```

The issue remains in `Backlog`.

If analysis is clean:

```text
Backlog → Ready
```

The transition SHOULD be performed through the repository's PowerShell Project-status helper.

---

## 13. Implementation

Before writing code, `/speckit-implement` MUST verify:

* Source Issue exists.
* Issue is open.
* Current branch is not `main`.
* Project Status is `Ready`.

When implementation begins:

```text
Ready → In Progress
```

All implementation MUST happen on the feature branch.

The implementation MUST follow the generated tasks.

The implementation MUST NOT push directly to `main`.

---

## 14. Pull Request Creation

After implementation and local validation:

```text
git push
    ↓
gh pr create
    ↓
In Progress → Review
```

The repository MUST use `scripts/New-PullRequest.ps1` or an equivalent repository-approved workflow.

---

## 15. Responsive Design

The website MUST support:

* Mobile
* Tablet
* Laptop
* Desktop

The UI MUST avoid unintended horizontal scrolling.

Navigation, cards, typography, gallery content, PDF links, and contact information MUST remain usable on small screens.

---

## 16. Accessibility

Accessibility MUST be treated as a first-class requirement.

The application SHOULD target WCAG 2.2 AA principles where practical.

The application MUST:

* Use semantic HTML.
* Support keyboard navigation.
* Provide visible focus states.
* Use meaningful alternative text.
* Use accessible form labels.
* Maintain logical heading hierarchy.
* Maintain sufficient contrast.
* Provide accessible names for interactive controls.
* Provide meaningful names for PDF/gallery links.

---

## 17. Gallery

The Gallery MUST support the supplied PDF catalogue material.

PDFs SHOULD be stored under:

```text
public/gallery/
```

Each gallery item SHOULD contain:

* Meaningful title
* Optional description
* Preview/card
* Open/view action

PDFs MUST remain accessible on desktop and mobile.

---

## 18. Content Integrity

The website MUST NOT invent business information.

Do not invent:

* Phone numbers
* Email addresses
* Addresses
* Pricing
* Product specifications
* Certifications
* Years of experience
* Ownership claims
* Manufacturing claims

Only verified information should be presented as factual business content.

---

## 19. Performance

The application SHOULD:

* Optimize images.
* Avoid unnecessary dependencies.
* Minimize JavaScript.
* Lazy-load non-critical images.
* Avoid eagerly loading large PDFs.

---

## 20. SEO

The application SHOULD provide:

* Page title
* Meta description
* Favicon
* Semantic headings
* Appropriate alt text
* Open Graph metadata where appropriate

---

## 21. CI/CD

GitHub Actions MUST provide:

* Pull Request CI
* Production build validation
* Linting where configured
* GitHub Pages deployment

A failing required CI check MUST prevent merge.

Production deployment MUST originate from the approved production branch/workflow.

---

## 22. Definition of Done

A feature is Done when:

* GitHub Issue requirements are satisfied.
* Spec Kit artifacts are complete.
* Implementation is complete.
* Work exists on a non-main branch.
* CI passes.
* Pull Request is created.
* Pull Request is reviewed.
* Pull Request is merged.
* GitHub Project status reaches `Done`.

---

## 23. Core Principle

Prefer simple, maintainable solutions that deliver a polished customer-facing showcase experience.

Technical complexity MUST remain proportional to the needs of the business website.

