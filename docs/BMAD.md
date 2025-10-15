# BMAD Project Configuration

**Project Name:** [Your Project Name]  
**Description:** [Brief description of your project]  
**Version:** 0.1.0  
**Last Updated:** [Date]

---

## Project Overview

**Type:** [Greenfield/Brownfield]  
**Category:** [Full-Stack/Backend/Frontend/Mobile]  
**Current Phase:** [Discovery/Planning/Development/Testing/Deployment]

---

## Technology Stack

### Frontend
- Framework: [React/Vue/Svelte/Next.js/etc.]
- State Management: [Redux/Zustand/Context/etc.]
- Styling: [Tailwind/CSS Modules/Styled Components/etc.]
- Build Tool: [Vite/Webpack/etc.]

### Backend
- Runtime/Language: [Node.js/Python/Go/etc.]
- Framework: [Express/FastAPI/Gin/etc.]
- Database: [PostgreSQL/MongoDB/MySQL/etc.]
- ORM: [Prisma/TypeORM/SQLAlchemy/etc.]

### Testing
- Unit: [Jest/Vitest/Pytest/etc.]
- Integration: [Testing Library/etc.]
- E2E: [Playwright/Cypress/etc.]

### DevOps
- Hosting: [Vercel/AWS/GCP/Netlify/etc.]
- CI/CD: [GitHub Actions/GitLab CI/etc.]
- Monitoring: [Sentry/DataDog/etc.]

---

## Project Structure

```
project/
├── docs/
│   ├── project-brief.md
│   ├── prd.md
│   ├── architecture.md
│   ├── epics/
│   └── stories/
├── src/
│   ├── components/
│   ├── services/
│   ├── utils/
│   └── [other directories]
├── tests/
└── [other directories]
```

---

## Current Sprint

**Sprint:** [Number]  
**Start Date:** [Date]  
**End Date:** [Date]  
**Current Epic:** [Epic Name/Number]  
**Current Story:** [Story Name/Number]

---

## Team Configuration

**Primary Developer:** [Name/AI Assistant]  
**Primary AI Tool:** [Cursor/Windsurf/Aider/Cline/etc.]  
**Version Control:** [Git/GitHub/GitLab/etc.]

---

## BMAD Agents in Use

- [ ] Analyst - Project discovery
- [ ] Product Manager - PRD creation
- [ ] UX Expert - UI/UX design
- [ ] Architect - System architecture
- [ ] Product Owner - Document management
- [ ] Scrum Master - Story creation
- [ ] Developer - Implementation
- [ ] QA - Quality assurance
- [ ] Master - General guidance
- [ ] Orchestrator - Workflow coordination

---

## Quality Standards

### Test Coverage Goals
- Overall Coverage: >80%
- Critical Path: 100%
- Business Logic: >90%
- UI Components: >70%

### Code Quality
- Linting: [ESLint/Ruff/golangci-lint/etc.]
- Type Checking: [TypeScript/MyPy/etc.]
- Formatting: [Prettier/Black/gofmt/etc.]

### Definition of Done
- [ ] All tasks completed
- [ ] Tests written and passing
- [ ] Code reviewed
- [ ] Documentation updated
- [ ] Lint and type-check passing
- [ ] Dev Notes added to story

---

## Development Workflow

1. **Story Creation** (SM Agent)
   - Read previous Dev Notes
   - Reference epic and architecture
   - Create comprehensive story

2. **Implementation** (Dev Agent)
   - Read story completely
   - Execute tasks sequentially
   - Write tests (TDD)
   - Add Dev Notes

3. **Quality Review** (QA Agent)
   - Review implementation
   - Validate tests
   - Check coverage

4. **Commit & Continue**
   - All validations pass
   - Commit changes
   - Move to next story

---

## Documentation

### Planning Documents
- [ ] Project Brief (docs/project-brief.md)
- [ ] PRD (docs/prd.md)
- [ ] Architecture (docs/architecture.md)
- [ ] Frontend Spec (docs/front-end-spec.md) - if applicable

### Development Documents
- [ ] Epics (docs/epics/)
- [ ] Stories (docs/stories/)
- [ ] API Documentation (if applicable)
- [ ] Component Library (if applicable)

---

## Project-Specific Rules

### Coding Standards
- [Add project-specific coding standards]
- [Add naming conventions]
- [Add file organization rules]

### Git Conventions
- Commit Format: `<type>(<scope>): <description>`
- Types: feat, fix, docs, style, refactor, test, chore
- Branch Strategy: [main/develop/feature branches]

### Testing Strategy
- [Add project-specific testing requirements]
- [Add test naming conventions]
- [Add mock/stub guidelines]

---

## Dependencies

### Key Libraries/Frameworks
- [List major dependencies]
- [Include version constraints if important]

### API Integrations
- [List third-party APIs]
- [Add authentication methods]

---

## Environment Setup

### Prerequisites
- [Node.js version / Python version / etc.]
- [Database setup requirements]
- [API keys needed]
- [Other tools required]

### Installation
```bash
# Clone repository
git clone [repository-url]

# Install dependencies
[command to install dependencies]

# Setup environment
[commands for environment setup]

# Run development server
[command to start dev server]
```

---

## Notes

### Context Preservation
- Dev Notes are mandatory for each story
- Always read previous story's Dev Notes before starting new story
- Document all technical decisions with rationale

### Agent Handoffs
- SM creates story -> You approve -> Dev implements -> QA reviews
- Fresh agent activation for clean context
- Reference documents as needed, don't duplicate content

---

## Status

**Last Story Completed:** [Story Number/Name]  
**Next Story:** [Story Number/Name]  
**Blockers:** [None/List any blockers]  
**Notes:** [Any additional notes]

---

**BMAD Method Version:** 4.44.1  
**Configuration Version:** 1.0  
**Last Updated:** [Date]
