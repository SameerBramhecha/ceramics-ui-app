# Bramhecha Ceramics — GitHub Issues

## Foundation

### #1 Configure Vite React TypeScript foundation
- Title: Configure Vite React TypeScript foundation
- Description: Initialize the project scaffold using Vite with React and TypeScript and ensure the repository is ready for feature development.
- Acceptance Criteria:
  - Vite React TypeScript app is configured and working.
  - npm scripts support development, build, and lint workflows.
  - Repository is ready for future feature branches.
- Labels: feature, infra
- Milestone: Foundation
- Project: Backlog

### #2 Establish SDD constitution and Spec Kit workflow
- Title: Establish SDD constitution and Spec Kit workflow
- Description: Define the project constitution, GitHub issue-driven workflow, and repository governance needed to support Spec Kit development.
- Acceptance Criteria:
  - Constitution is stored in .specify/memory/constitution.md.
  - Project workflow documentation is available in docs/project-workflow.md.
  - The repository documents the issue-driven SDLC and project status flow.
- Labels: feature, infra
- Milestone: Foundation
- Project: Backlog

### #3 Protect main and establish branch/PR rules
- Title: Protect main and establish branch/PR rules
- Description: Enforce the repository policy that all work must happen on non-main branches and all changes to main go through a pull request.
- Acceptance Criteria:
  - main is protected from direct commits.
  - Branch naming convention is documented.
  - Pull request policy is documented and enforced.
- Labels: infra
- Milestone: Foundation
- Project: Backlog

### #4 Configure GitHub Project board and SDLC statuses
- Title: Configure GitHub Project board and SDLC statuses
- Description: Set up the GitHub Project board and its required workflow statuses for backlog, ready, in progress, review, and done.
- Acceptance Criteria:
  - Project board is configured with the required statuses.
  - Status transitions are documented.
  - Project metadata matches the repository workflow.
- Labels: infra
- Milestone: Foundation
- Project: Backlog

### #5 Add GitHub CLI + PowerShell SDLC automation
- Title: Add GitHub CLI + PowerShell SDLC automation
- Description: Add automation for fetching issues, creating branches, updating project status, and creating pull requests.
- Acceptance Criteria:
  - Repository contains project status scripts.
  - Issue fetching workflow is documented.
  - Branch and PR scripts support the SDLC process.
- Labels: infra
- Milestone: Foundation
- Project: Backlog

### #6 Configure GitHub Actions CI
- Title: Configure GitHub Actions CI
- Description: Add pull request validation that installs dependencies, builds the app, and runs lint if configured.
- Acceptance Criteria:
  - Pull request workflow runs on pull requests.
  - npm ci completes successfully.
  - npm run build passes.
  - npm run lint --if-present runs as configured.
- Labels: infra
- Milestone: Foundation
- Project: Backlog

### #7 Configure GitHub Pages deployment
- Title: Configure GitHub Pages deployment
- Description: Configure deployment to GitHub Pages from the production branch using the repository’s Vite base path.
- Acceptance Criteria:
  - Build is deployable to GitHub Pages.
  - Deployment workflow runs from main.
  - Feature branches are not deployed to production.
- Labels: infra
- Milestone: Foundation
- Project: Backlog

### #8 Create Bramhecha Ceramics visual design system
## Title: Create Bramhecha Ceramics visual design system
## User Story:
## Description:
Establish the brand palette, typography, spacing, and consistent design language for the ceramic showcase site.
## Background:
## Acceptance Criteria:
  - Visual language matches the Bramhecha Ceramics brand and content.
  - Component styling is consistent and responsive.
  - Design choices support accessibility and readability.
- Labels: design
- Milestone: Foundation
- Project: Backlog

### #9 Build responsive layout foundation
## Title: Build responsive layout foundation
## User Story:
As a visitor, I want the website layout to adapt to my device so that I can browse Bramhecha Ceramics comfortably on mobile, tablet, and desktop.
## Description:
Create the shared page structure, responsive layout patterns, navigation shell, and content containers used by the public-facing site.
## Background:
The site will be viewed across a range of screen sizes. A responsive foundation is needed before feature sections are built so that future content remains consistent and usable.
## Acceptance Criteria:
  - The layout supports mobile, tablet, laptop, and desktop viewport sizes.
  - Navigation, containers, spacing, and typography adapt at the defined breakpoints.
  - No unintended horizontal scrolling occurs at supported viewport sizes.
  - Shared layout patterns can be reused by the Home, About, gallery, and Contact sections.
## Definition of Done:
  - Responsive layout components are implemented and integrated into the application.
  - The layout has been manually checked at the supported breakpoints.
  - The application builds successfully and no related console errors are present.
  - The change has been reviewed and merged through the project workflow.
- Labels: design, feature
- Milestone: Foundation
- Project: Backlog

### #10 Establish accessibility baseline
## Title: Establish accessibility baseline
## User Story:
As a visitor, including visitors who use a keyboard or assistive technology, I want the website to be accessible so that I can understand and use its content and controls.
## Description:
Establish the application-wide accessibility baseline through semantic HTML, keyboard support, accessible names, focus management, and visible focus states.
## Background:
Accessibility must be built into the shared foundation rather than addressed only after individual sections are complete. This reduces barriers and gives later features a consistent standard.
## Acceptance Criteria:
  - Page landmarks and content use appropriate semantic HTML elements.
  - All interactive elements are reachable and usable with a keyboard.
  - Focus indicators are visible against the background and follow a logical order.
  - Links, buttons, images, and form controls have meaningful accessible names or alternative text.
## Definition of Done:
  - The baseline is implemented in shared components and documented where needed.
  - A keyboard and automated accessibility check has been completed.
  - Identified baseline issues are resolved or recorded as follow-up work.
  - The application builds successfully and the change has been reviewed.
- Labels: a11y
- Milestone: Foundation
- Project: Backlog

### #11 Define website content and gallery structure
## Title: Define website content and gallery structure
## User Story:
As a prospective customer, I want the website content and catalogue gallery to be organized clearly so that I can understand the business and find relevant products quickly.
## Description:
Define the approved content architecture for the site, including section content, catalogue PDF entries, titles, descriptions, and supporting metadata.
## Background:
The site should present verified business information and existing catalogue assets without inventing product or company details. A defined content structure will keep implementation consistent.
## Acceptance Criteria:
  - All planned sections and their content responsibilities are documented.
  - Content is based on approved or verified business information only.
  - Each catalogue entry has a meaningful title and a valid asset reference.
  - The gallery structure supports catalogue preview and open/download actions where applicable.
  - The content hierarchy supports the business goal of presenting ceramic products and contact routes.
## Definition of Done:
  - Content structure and metadata format are documented in the repository.
  - Catalogue assets and references have been checked for validity.
  - Content owners have approved the information included.
  - Open content questions are tracked as follow-up issues.
- Labels: content
- Milestone: Foundation
- Project: Backlog

## MVP

### #12 Build Home section
## Title: Build Home section
## User Story:
As a first-time visitor, I want to understand Bramhecha Ceramics and its offering from the Home section so that I can decide where to explore next.
## Description:
Create the responsive landing experience with the approved brand introduction, primary value proposition, featured content, and navigation or calls to action.
## Background:
The Home section is the primary entry point for visitors and should establish context quickly while directing them to the gallery, About, brands, and Contact sections.
## Acceptance Criteria:
  - The Home section includes the approved introductory content and primary calls to action.
  - Visitors can reach the main site sections from the Home experience.
  - Content hierarchy is clear on mobile and desktop layouts.
  - The implementation follows the visual design system and accessibility baseline.
## Definition of Done:
  - The Home section is implemented using reusable components.
  - Responsive and keyboard checks have been completed.
  - All displayed content and links have been verified.
  - The application builds successfully and the change has been reviewed.
- Labels: feature
- Milestone: MVP
- Project: Backlog

### #13 Build About section
## Title: Build About section
## User Story:
As a prospective customer, I want to learn about Bramhecha Ceramics and its offerings so that I can make an informed decision about contacting the business.
## Description:
Implement the About section with the approved business story, ceramic offering information, and supporting visual or textual content.
## Background:
Clear and accurate business context builds trust and helps visitors understand what Bramhecha Ceramics provides before they view catalogues or make contact.
## Acceptance Criteria:
  - The section contains only approved and verified business information.
  - The business story and ceramic offerings are presented with a clear content hierarchy.
  - The section is responsive across supported viewport sizes.
  - Text, images, and interactive elements meet the accessibility baseline.
## Definition of Done:
  - The About section is implemented and linked from the site navigation or relevant calls to action.
  - Content has been reviewed for accuracy and completeness.
  - Responsive, keyboard, and build checks pass.
  - The change has been reviewed and merged through the project workflow.
- Labels: feature, content
- Milestone: MVP
- Project: Backlog

### #14 Build brand showcase
## Title: Build brand showcase
## User Story:
As a prospective customer, I want to see the brands and product categories represented by Bramhecha Ceramics so that I can identify products relevant to my needs.
## Description:
Create a consistent showcase for approved brands and product categories, using reusable cards or modules where appropriate.
## Background:
Visitors need a quick way to understand the breadth of the offering. The showcase should remain easy to scan without introducing unverified claims.
## Acceptance Criteria:
  - The showcase includes all approved brand names and categories in the content plan.
  - Brand and category information is accurate and not invented.
  - Items use a consistent visual and content pattern.
  - The section remains readable and usable on mobile and desktop.
## Definition of Done:
  - The showcase is implemented with reusable, accessible components.
  - Brand names, labels, and assets have been verified.
  - Responsive and keyboard checks pass.
  - The application builds successfully and the change has been reviewed.
- Labels: feature, design
- Milestone: MVP
- Project: Backlog

### #15 Build PDF Gallery
## Title: Build PDF Gallery
## User Story:
As a prospective customer, I want to browse and open catalogue PDFs easily so that I can review the available ceramic products and collections.
## Description:
Add a responsive catalogue gallery with meaningful titles, supporting metadata, and clear preview or open actions for each PDF.
## Background:
Catalogue PDFs are a key product-discovery resource. They must remain findable and usable on small screens while preserving the provided assets.
## Acceptance Criteria:
  - The gallery displays every approved catalogue entry.
  - Each entry points to a valid PDF in the expected public asset location.
  - Each entry has a meaningful title and an accessible action to open or preview the PDF.
  - The gallery remains readable and usable on mobile, tablet, and desktop layouts.
  - Opening a PDF does not break the application navigation or layout.
## Definition of Done:
  - The gallery is implemented with reusable accessible components.
  - All PDF paths have been tested in a production build or deployed environment.
  - Keyboard and responsive checks have been completed.
  - The application builds successfully and the change has been reviewed.
- Labels: feature, content
- Milestone: MVP
- Project: Backlog

### #16 Build Contact section
## Title: Build Contact section
## User Story:
As a prospective customer, I want clear ways to contact Bramhecha Ceramics so that I can ask questions or request more information about the products.
## Description:
Implement the Contact section with approved contact details, clear contact entry points, and an accessible responsive layout.
## Background:
The Contact section converts product interest into a business enquiry. It must use verified details and make the next action obvious on every supported device.
## Acceptance Criteria:
  - The section displays only verified business contact information.
  - Contact links or controls have clear labels and perform the expected action.
  - The section is usable with keyboard navigation and assistive technology.
  - The layout remains readable and functional across supported viewport sizes.
## Definition of Done:
  - The Contact section is implemented and reachable from relevant navigation or calls to action.
  - Contact details and link targets have been verified.
  - Responsive and accessibility checks pass.
  - The application builds successfully and the change has been reviewed.
- Labels: feature, a11y
- Milestone: MVP
- Project: Backlog

### #17 Add SEO and social metadata
## Title: Add SEO and social metadata
## User Story:
As a prospective customer discovering the site through search or social media, I want accurate page information and previews so that I can understand the site before opening it.
## Description:
Add the document title, meta description, favicon, canonical or share metadata as applicable, and meaningful image alternative text.
## Background:
Consistent metadata improves discoverability, link previews, and the clarity of the site when it is shared or indexed.
## Acceptance Criteria:
  - The page has an accurate title and meta description.
  - A valid favicon is configured.
  - Open Graph or equivalent social metadata is configured where applicable.
  - Metadata values use approved brand and page content.
  - Informative images have meaningful alternative text and decorative images are handled appropriately.
## Definition of Done:
  - Metadata is implemented and visible in the production build output.
  - Metadata and image alternative text have been reviewed for accuracy.
  - The site passes the relevant build and validation checks.
  - The change has been reviewed and merged through the project workflow.
- Labels: feature, infra
- Milestone: MVP
- Project: Backlog

### #18 Perform responsive QA
## Title: Perform responsive QA
## User Story:
As a visitor using any supported device, I want the site to remain readable and functional so that I can browse without layout or interaction problems.
## Description:
Perform a responsive quality review of layouts, navigation, content, PDF gallery interactions, and contact entry points across supported viewport sizes.
## Background:
Feature implementation can introduce breakpoint-specific regressions. A dedicated review verifies the complete experience rather than isolated components.
## Acceptance Criteria:
  - Mobile, tablet, laptop, and desktop viewport checks are completed.
  - No unintended horizontal scrolling, clipped content, or overlapping controls is observed.
  - Navigation, gallery actions, and contact links work at each supported size.
  - Text, images, spacing, and controls remain readable and usable.
## Definition of Done:
  - A responsive QA checklist and results are recorded.
  - Any defects found are fixed or captured in follow-up issues with sufficient detail.
  - A production build has been checked at the agreed viewport sizes.
  - QA results have been reviewed and accepted by the project owner.
- Labels: design, a11y
- Milestone: MVP
- Project: Backlog

### #19 Perform accessibility QA
## Title: Perform accessibility QA
## User Story:
As a visitor with access needs, I want the complete site to work with keyboard navigation and assistive technology so that I can use the same core content and actions as other visitors.
## Description:
Conduct an end-to-end accessibility review covering semantics, keyboard navigation, focus behavior, accessible names, alternative text, and contrast.
## Background:
A final accessibility review validates the integrated site and catches issues that may not be visible when sections are tested separately.
## Acceptance Criteria:
  - All interactive elements can be reached and operated with a keyboard.
  - Focus indicators are visible and focus order is logical.
  - Images, links, buttons, and form controls have appropriate names, labels, or alternative text.
  - Heading structure and landmarks support navigation by assistive technology.
  - No critical accessibility defects remain open for the release.
## Definition of Done:
  - Manual keyboard and automated accessibility checks have been completed.
  - Findings are resolved or documented with an agreed follow-up issue.
  - The final accessibility results are recorded for the release.
  - The project owner has accepted the QA outcome.
- Labels: a11y
- Milestone: MVP
- Project: Backlog

### #20 Production release
## Title: Production release
## User Story:
As the business owner, I want the approved website released reliably so that customers can access Bramhecha Ceramics online.
## Description:
Complete the release readiness review, merge the approved implementation, and publish the website through the configured GitHub Pages deployment pipeline.
## Background:
The release is the final integration point for the foundation, content, feature, responsive, accessibility, and deployment work completed in the MVP milestone.
## Acceptance Criteria:
  - All required MVP issues are complete or explicitly accepted for release.
  - CI passes for the release candidate, including install, build, and configured lint checks.
  - GitHub Pages deployment completes successfully from the production branch.
  - The published site is accessible at the expected URL and loads its assets correctly.
  - A release smoke test confirms navigation, catalogue links, contact links, and responsive behavior.
## Definition of Done:
  - Release approval has been recorded.
  - The production branch contains the approved release through the required pull request workflow.
  - Deployment has completed successfully and the live site has been smoke-tested.
  - Release notes or a release record capture the deployed version and any known limitations.
- Labels: feature, infra
- Milestone: MVP
- Project: Backlog
