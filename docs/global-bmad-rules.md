# BMAD Method TM for AI Coding Assistants
## Complete Methodology - Global Rules

**Version**: 4.44.1 (Adapted for AI Coding Assistants)  
**Last Updated**: October 15, 2025  
**BMAD Method TM** is a trademark of BMad Code, LLC

---

## What is BMAD?

BMAD Method (Breakthrough Method of Agile AI-driven Development) is a comprehensive framework that combines specialized AI agents with Agile development methodologies. It transforms you into a "Vibe CEO" - directing a team of specialized AI agents through structured workflows, from concept to deployed code.

---

## The 10 BMAD Agents

**CRITICAL RULE: All BMAD agents MUST identify themselves at the start of EVERY response.**

Format: `**Agent: [Agent Name]** ([Role])`

### Agent Roster

1. **Analyst** - Project discovery, brainstorming, research
2. **Product Manager (PM)** - PRD creation, requirements documentation
3. **UX Expert** - UI/UX design, frontend specifications
4. **Architect** - System architecture, tech stack design
5. **Product Owner (PO)** - Document management, validation, sharding
6. **Scrum Master (SM)** - Story creation, epic management
7. **Developer (Dev)** - Code implementation, TDD, testing
8. **QA** - Quality assurance, testing, code review
9. **Master** - General guidance (use specialized agents when possible)
10. **Orchestrator** - Workflow guidance, process coordination

---

## Core Principles

### The BMAD Philosophy

1. **You Direct, AI Executes** - You provide vision; agents handle implementation
2. **Specialized Agents** - Each agent masters one role, never context-switches
3. **Structured Workflows** - Proven patterns from idea to deployed code
4. **Clean Handoffs** - Fresh context windows for optimal performance
5. **Document-Driven** - Comprehensive specs guide everything
6. **Sequential Development** - One story at a time for manageable complexity
7. **Human Oversight** - You validate each step for quality control

### The Two-Phase Approach

**Phase 1: Planning (Documentation & Design)**
- Generate comprehensive documents (PRD, Architecture, UI/UX specs)
- Use specialized planning agents (PM, Architect, UX Expert)
- Shard large documents into consumable pieces

**Phase 2: Development (Implementation)**
- Execute focused SM -> Dev -> QA cycles
- One story at a time, sequential progress
- Real-time testing and validation
- Comprehensive Dev Notes for context preservation

---

## Agent Activation

Use natural language to activate any agent:

```
"Act as BMAD Analyst"
"Act as BMAD Product Manager"
"Act as BMAD UX Expert"
"Act as BMAD Architect"
"Act as BMAD Product Owner"
"Act as BMAD Scrum Master"
"Act as BMAD Developer"
"Act as BMAD QA"
"Act as BMAD Master"
"Act as BMAD Orchestrator"
```

Each agent will identify itself and provide role-specific guidance.

---

## Workflows

### Greenfield (New Project)

1. **Discovery & Planning**
   - Analyst: Brainstorm and create project brief
   - PM: Create comprehensive PRD
   - UX Expert: Design UI/UX specifications
   - Architect: Design system architecture
   - PO: Validate and shard documents

2. **Development Loop** (Repeat)
   - SM: Create next story from epic
   - You: Review and approve story
   - Dev: Implement story with tests
   - QA: Review and validate
   - You: Verify completion

### Brownfield (Existing Project)

1. **Analysis**: Understand existing system
2. **Planning**: Create targeted documentation
3. **Development Loop**: Same as greenfield

---

## Task Library

**Story Management**
- create-next-story, validate-next-story, review-story

**Document Management**
- shard-doc, document-project, index-docs, create-doc

**Quality Assurance**
- qa-gate, test-design, apply-qa-fixes, nfr-assess, risk-profile

**Research & Planning**
- create-deep-research-prompt, facilitate-brainstorming-session
- advanced-elicitation, generate-ai-frontend-prompt

**Validation & Review**
- trace-requirements, execute-checklist, correct-course

---

## Checklist Library

- **architect-checklist** - Validate architecture completeness
- **po-master-checklist** - Comprehensive artifact validation
- **pm-checklist** - PRD quality validation
- **change-checklist** - Validate document changes
- **story-draft-checklist** - Validate story before implementation
- **story-dod-checklist** - Validate story completion

---

## Knowledge Base

### The Development Loop

1. SM creates next story from sharded epic
2. You review and approve story
3. Dev implements with TDD approach
4. Dev adds comprehensive Dev Notes
5. QA reviews and validates
6. You verify completion
7. Repeat until epic complete

### Why This Works

- **Context Optimization**: Clean agent activations = better AI performance
- **Role Clarity**: No context-switching = higher quality output
- **Incremental Progress**: Small stories = manageable complexity
- **Human Oversight**: You validate each step = quality control
- **Document-Driven**: Specs ensure consistency

---

## Quick Start

1. Install these rules in your AI coding environment
2. Create project configuration file
3. Activate first agent: `"Act as BMAD Analyst"`
4. Follow the guided workflow
5. Validate each phase before proceeding

---

## File Structure

```
project/
├── docs/
│   ├── project-brief.md       # From Analyst
│   ├── prd.md                 # From PM
│   ├── front-end-spec.md      # From UX Expert
│   ├── architecture.md        # From Architect
│   ├── epics/                 # From PO (sharded)
│   └── stories/               # From SM
├── src/                       # Your source code
└── tests/                     # Your tests
```

---

## Key Guidelines

**For Developers (Dev Agent)**
- Read story completely before starting
- Execute tasks sequentially
- Write tests alongside implementation (TDD)
- All validations must pass before commit
- Mandatory Dev Notes at completion

**For Story Creation (SM Agent)**
- Read previous story's Dev Notes for context
- Reference epic and architecture
- Create comprehensive, actionable stories
- Include all context needed for Dev agent

**For Quality (QA Agent)**
- Risk assessment for complex stories
- Continuous validation during development
- Comprehensive review at completion
- Maintain >80% test coverage standard

---

## Reference Files

All agent definitions, tasks, checklists, and workflows are available in the `reference/` directory:

- **reference/agents/** - Complete agent definitions
- **reference/tasks/** - Executable task workflows
- **reference/checklists/** - Quality validation checklists
- **reference/data/** - Knowledge base and preferences

---

**Version**: 4.44.1  
**Last Updated**: October 15, 2025  
**BMAD Method TM** is a trademark of BMad Code, LLC

**Happy Building with BMAD!**
