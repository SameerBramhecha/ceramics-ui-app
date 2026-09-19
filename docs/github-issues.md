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
- Title: Create Bramhecha Ceramics visual design system
- Description: Establish the brand palette, typography, spacing, and consistent design language for the ceramic showcase site.
- Acceptance Criteria:
  - Visual language matches the Bramhecha Ceramics brand and content.
  - Component styling is consistent and responsive.
  - Design choices support accessibility and readability.
- Labels: design
- Milestone: Foundation
- Project: Backlog

### #9 Build responsive layout foundation
- Title: Build responsive layout foundation
- Description: Create the core page structure, layout patterns, and content containers for the public-facing site.
- Acceptance Criteria:
  - Site supports mobile, tablet, laptop, and desktop breakpoints.
  - Layout avoids unintended horizontal scrolling.
  - Navigation and content containers are responsive.
- Labels: design, feature
- Milestone: Foundation
- Project: Backlog

### #10 Establish accessibility baseline
- Title: Establish accessibility baseline
- Description: Ensure the site follows an accessibility-first baseline with semantic structure, keyboard support, and visible focus states.
- Acceptance Criteria:
  - Semantic HTML is used throughout the application.
  - Keyboard navigation is supported.
  - Focus states and labels are accessible.
- Labels: a11y
- Milestone: Foundation
- Project: Backlog

### #11 Define website content and gallery structure
- Title: Define website content and gallery structure
- Description: Define the actual content architecture for the site and the structure of the gallery, including catalogue PDFs and supporting metadata.
- Acceptance Criteria:
  - Content is accurate and not invented.
  - Gallery structure includes catalogues and preview actions.
  - Content organization matches the business goals.
- Labels: content
- Milestone: Foundation
- Project: Backlog

## MVP

### #12 Build Home section
- Title: Build Home section
- Description: Create the landing experience for Bramhecha Ceramics with the required promotional structure and navigation.
- Acceptance Criteria:
  - Home section is implemented and responsive.
  - Content is presented clearly and with good hierarchy.
  - Design matches project style system.
- Labels: feature
- Milestone: MVP
- Project: Backlog

### #13 Build About section
- Title: Build About section
- Description: Implement the About section to explain the business and its ceramic offerings.
- Acceptance Criteria:
  - About section contains verified business information.
  - Layout is responsive and accessible.
  - Content matches the approved product story.
- Labels: feature, content
- Milestone: MVP
- Project: Backlog

### #14 Build brand showcase
- Title: Build brand showcase
- Description: Create a section or modules highlighting the brands and product categories represented by the business.
- Acceptance Criteria:
  - Brand showcase includes the approved brand names.
  - Section is visually clear and mobile-friendly.
  - Product categories are presented consistently.
- Labels: feature, design
- Milestone: MVP
- Project: Backlog

### #15 Build PDF Gallery
- Title: Build PDF Gallery
- Description: Add a gallery of catalogue PDFs that are accessible on mobile and desktop and presented with meaningful titles and preview actions.
- Acceptance Criteria:
  - PDF gallery exists in the application.
  - PDFs are available from public/gallery.
  - Gallery entries remain usable on small screens.
- Labels: feature, content
- Milestone: MVP
- Project: Backlog

### #16 Build Contact section
- Title: Build Contact section
- Description: Implement the contact experience for customers, with accessible labels and responsive layout.
- Acceptance Criteria:
  - Contact section is accessible and responsive.
  - Information uses verified business details only.
  - Contact entry points are clear and usable.
- Labels: feature, a11y
- Milestone: MVP
- Project: Backlog

### #17 Add SEO and social metadata
- Title: Add SEO and social metadata
- Description: Add the page metadata and social tags needed for discoverability and presentation on social channels.
- Acceptance Criteria:
  - Page title and meta description exist.
  - Favicon and semantic page structure are in place.
  - Social metadata and alt text are supported where appropriate.
- Labels: feature, infra
- Milestone: MVP
- Project: Backlog

### #18 Perform responsive QA
- Title: Perform responsive QA
- Description: Validate layouts, navigation, and gallery interactions across common mobile, tablet, laptop, and desktop screen sizes.
- Acceptance Criteria:
  - No unintended horizontal scrolling is observed.
  - Layouts remain usable at small screen sizes.
  - Content remains readable and accessible across breakpoints.
- Labels: design, a11y
- Milestone: MVP
- Project: Backlog

### #19 Perform accessibility QA
- Title: Perform accessibility QA
- Description: Test the site against accessibility and usability expectations with keyboard, semantics, contrast, and focus checks.
- Acceptance Criteria:
  - Keyboard navigation works across interactive elements.
  - Focus states are visible and logical.
  - Images, links, and form controls have appropriate names and labels.
- Labels: a11y
- Milestone: MVP
- Project: Backlog

### #20 Production release
- Title: Production release
- Description: Prepare the final website for production release and confirm that the repository and deployment pipeline are ready for public launch.
- Acceptance Criteria:
  - CI passes.
  - GitHub Pages deployment is configured.
  - Production release is ready for merge and publication.
- Labels: feature, infra
- Milestone: MVP
- Project: Backlog
