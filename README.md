# 🎯 CUSTOM-BMAD v4.45

## Breakthrough Method of Agile AI-Driven Development

**Multi-Terminal Edition** — Works with **ANY AI** (Claude, ChatGPT, Copilot, Warp, etc.)

![CUSTOM-BMAD](https://img.shields.io/badge/CUSTOM--BMAD-v4.45-blue?style=flat-square&logo=code&logoColor=white)
![License](https://img.shields.io/badge/License-BMAD%20Method%E2%84%A2-green?style=flat-square)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen?style=flat-square)

---

## What is CUSTOM-BMAD?

**CUSTOM-BMAD** is a complete AI-driven development framework that transforms you into a "Vibe CEO" directing specialized AI agents through structured workflows—from concept to deployed code.

### Key Features

✅ **Multi-Terminal Support** — Works with Claude, ChatGPT, Copilot, Warp, or ANY AI  
✅ **Auto-Activation via BMAD.md** — Presence of file = BMAD applies automatically  
✅ **9 Specialized Agents** — Each masters one role (Developer, SM, QA, Architect, etc.)  
✅ **Enhanced Dashboard** — Smart project tracker with hierarchical workflow tree  
✅ **Document-Driven** — PRD, Architecture, Stories guide everything  
✅ **Sequential Development** — One story at a time = manageable complexity  
✅ **Quality-First** — >80% test coverage, zero linting errors, strict types  
✅ **Zero Dependencies** — Pure markdown + JavaScript, works offline  

---

## Getting Started (60 seconds)

### 1. Clone or Create Project

```bash
# Clone existing CUSTOM-BMAD project
git clone <project-url>

# OR create new project
mkdir my-project
cd my-project
```

### 2. Install Global Rules

- **Copy** content from `global-bmad-rules.md`
- **Add** to your AI terminal:
  - **Claude**: Add to knowledge base or custom instructions
  - **ChatGPT**: Add to custom instructions
  - **Copilot**: Add to IDE settings or project rules
  - **Warp**: Settings > AI > Knowledge > Manage Rules
  - **Any other AI**: Add to its knowledge/rules/instructions section

### 3. Activate BMAD

Simply ensure **BMAD.md** exists in project root. BMAD auto-activates when:
- ✅ BMAD.md present
- ✅ Global rules installed in your AI
- ✅ AI detects project contains BMAD.md

### 4. Start Using Agents

Copy any prompt from dashboard or use natural language:

```
Act as BMAD Developer. Implement story-001.
Act as BMAD Scrum Master. Create next story.
Act as BMAD QA. Review this implementation.
```

### 5. Track Progress

Open `docs/bmad-dashboard-modern.html` in Chrome/Edge for:
- ✨ **Modern UI** with light/dark theme toggle
- 🌲 **Hierarchical workflow tree** with epic grouping
- 🔄 **Auto-refresh** (5-second polling with toggle)
- 📊 **Project details panel** with file metadata
- 📁 **File viewer** with markdown rendering
- 🎯 **Click-outside to close** and ESC key support

---

## Project Structure

```
project-root/
├── 🎯 BMAD.md                      ← Auto-activates BMAD (presence = activation)
├── 📊 bmad-dashboard.html          ← Auto-generated real-time tracker
├── 📚 global-bmad-rules.md         ← Install in your AI terminal
├── docs/
│   ├── prd.md                      ← Product Requirements Document
│   ├── architecture.md             ← System Architecture
│   ├── epics/
│   │   ├── epic-001-*.md
│   │   └── epic-002-*.md
│   ├── stories/
│   │   ├── .current-story          ← Tracks active story
│   │   ├── story-001-*.md
│   │   └── story-00X-*.md
│   └── qa/
├── src/                            ← Your source code
├── tests/                          ← Your test suite
└── README.md                       ← Your project readme
```

---

## The 9 BMAD Agents

| Agent | Role | When To Use |
|-------|------|-----------|
| 🎯 **Developer** | Implementation | "Implement story", code changes needed |
| 🏃 **Scrum Master** | Story Creation | "Create next story", task definition needed |
| 🧪 **QA** | Quality Assurance | "Review this", quality concerns |
| 📋 **Product Owner** | Document Management | "Shard document", alignment needed |
| 🏗️ **Architect** | System Design | "Design the system", tech decisions needed |
| 📈 **Analyst** | Research & Discovery | "Explore this", research needed |
| 📊 **Project Manager** | Planning & Vision | "Plan features", requirements needed |
| 🎨 **UX Expert** | User Experience | "Design interface", UX needed |
| 🎓 **BMAD Master** | General Guidance | General BMAD questions |

---

## Development Loop

```
┌─────────────────────────────────────────────┐
│ BMAD Development Loop (Repeating Pattern)   │
└─────────────────────────────────────────────┘

    1️⃣ Scrum Master creates story
         ↓
    2️⃣ You review & approve
         ↓
    3️⃣ Developer implements
         ↓
    4️⃣ QA reviews & validates
         ↓
    5️⃣ You verify completion
         ↓
    ✅ REPEAT for next story
```

---

## Modern Dashboard v2.0 ⭐ NEW!

### Key Features

✅ **Modern UI Design**
- 🎨 Light/Dark theme toggle with smooth transitions
- 💎 Professional color system and typography
- 🖱️ Click-outside to close panels + ESC key support
- 📱 Responsive layout with three-panel design

✅ **Smart Project Loading**
- Direct folder selection with File System Access API
- Auto-detects project structure and metadata
- Displays full project location path

✅ **Enhanced Workflow Tree**
- 🌲 **Hierarchical Structure**: Epic grouping with variants
- 📁 **Collapsible Nodes**: Expand/collapse epic sections
- 📝 **Story Nesting**: Stories and substories properly organized
- 🎯 **Visual Hierarchy**: Clear indentation and color coding
- 📊 **Gap Detection**: Identifies missing epics/stories

✅ **Auto-Refresh System**
- ▶️ Toggle auto-refresh on/off
- Polls every 5 seconds for file changes
- 🔔 Notification toasts when changes detected
- Tracks file metadata and timestamps

✅ **Project Details Panel**
- 📎 **Selected File**: Shows name, path, full date/time
- 🔄 **Last Refresh**: Mode (manual/auto) and timestamp  
- ✨ **Latest File**: Most recently modified file
- 📅 Complete datetime display for all files

✅ **File Viewer**
- Markdown rendering with syntax highlighting
- Smooth slide-in panel from right
- Click outside or press ESC to close
- Code block highlighting support

### Open Dashboard

1. Open `docs/bmad-dashboard-modern.html` in **Chrome** or **Edge**
2. Click **"Select Project Folder"**
3. Choose your project root directory
4. Explore the modern interface and features!

> **Note**: Classic dashboard still available at `docs/bmad-dashboard.html`

### Epic Grouping Example

```
▼ 📁 Epic 004 (3) ✓
  ├─ 📄 epic-004-main (Primary)
  ├─ 📄 epic-004-COMPLETE
  ├─ 📄 epic-004-analysis
  ├─ Stories (5)
  │  ├─ 📝 story-004-dashboard-ui
  │  ├─ 📝 story-004-data-viz
  │  └─ ...
  └─ Substories (2)
     ├─ 📋 substory-004-charts
     └─ 📋 substory-004-tables
```

---

## Multi-Terminal Integration

### Using with Claude

```
1. Go to claude.ai
2. Copy Quick Action from dashboard
3. Paste: "Act as BMAD Developer. Implement story-001..."
4. Claude responds with CUSTOM-BMAD context
```

### Using with ChatGPT

```
1. Go to chat.openai.com
2. Add global-bmad-rules to Custom Instructions
3. Copy prompt from dashboard
4. Paste into ChatGPT
5. ChatGPT uses BMAD methodology
```

### Using with Copilot

```
1. Open github.com/copilot
2. Add global-bmad-rules to Copilot rules
3. Reference story: "Based on docs/stories/story-001-*.md"
4. Get BMAD-guided implementation
```

### Using with Warp Terminal

```
1. Warp auto-detects BMAD.md
2. Agents auto-identify: "🎯 BMAD Agent: Developer | 🔧 CUSTOM-BMAD v4.45"
3. Full BMAD methodology applies automatically
```

---

## Key BMAD Rules

When **BMAD.md is present**:

✅ **Agent Identification (MANDATORY)**
```
🎯 **BMAD Agent: [Name]** | [Role] | 🔧 CUSTOM-BMAD v4.45
```

✅ **Dev Notes Required**
Every story completion MUST include comprehensive Dev Notes documenting:
- What worked
- Decisions made
- Lessons learned
- Context for next story

✅ **Quality Gates (ALL Must Pass)**
- ✓ Tests pass (>80% coverage)
- ✓ Zero linting errors
- ✓ Type checking passes
- ✓ Acceptance criteria met

✅ **Sequential Development**
- One story at a time
- Stories completed in order
- Each story builds on previous

✅ **Document-Driven**
- PRD guides product definition
- Architecture guides technical decisions
- Stories guide implementation

---

## File: BMAD.md

**Purpose**: Auto-activation trigger for CUSTOM-BMAD methodology

**When to create**: Every CUSTOM-BMAD project MUST have BMAD.md in root

**Effect**: Presence of this file = BMAD methodology automatically applies

**Distribution**: Include in git repos; when cloned, BMAD auto-applies if rules installed

**Customization**: Edit project name, description, tech stack, phase

### BMAD.md Template

```markdown
# 🎯 BMAD Project Configuration

Project Name: [Your Project Name]
Description: [Brief description]
Tech Stack: [Technologies]
Current Phase: [Planning / Development / Testing / Production]

[Rest of BMAD.md configuration...]
```

---

## File: global-bmad-rules.md

**Purpose**: Universal rules for CUSTOM-BMAD agents

**When to install**: Install ONCE in your AI terminal (not per-project)

**Effect**: When BMAD.md detected, these rules apply automatically

**Distribution**: Included in CUSTOM-BMAD; add to your AI's rules

### Installation Instructions

1. **Copy** content of `global-bmad-rules.md`
2. **Add** to your AI terminal:
   - Claude: Custom Instructions or Knowledge Base
   - ChatGPT: Custom Instructions
   - Copilot: Project Rules or Settings
   - Warp: Settings > AI > Knowledge > Manage Rules
3. **Save** changes
4. **Test**: Create/clone project with BMAD.md; BMAD should auto-apply

---

## Quality Standards

### Code Quality
- ✅ Test coverage >80%
- ✅ Zero linting errors
- ✅ Strict type checking enabled
- ✅ Inline docs for public APIs

### Story Quality
- ✅ Clear, testable acceptance criteria
- ✅ Dev Notes mandatory
- ✅ Architecture reference required
- ✅ Sequential task execution

### Validation Before Commit
```bash
# All must pass before git commit
npm test                    # >80% coverage
npm run lint               # Zero errors
npm run type-check         # Type safety
npm run build              # Builds successfully
```

---

## Dashboard: Real-Time Tracking

### What Gets Tracked

| Stage | Files Tracked | Triggers Phase |
|-------|--------------|----------------|
| Discovery | brainstorming-session.md, project-brief.md | Discovery phase |
| PRD | prd.md | Planning phase |
| UI Spec | front-end-spec.md | Planning phase |
| Architecture | architecture.md or docs/architecture/*.md | Planning phase |
| Epics | docs/epics/*.md (count all) | Epics stage |
| Stories | docs/stories/*.md (parse AC + Dev Notes) | Stories stage |
| Implementation | src/ directory | Development phase |
| Testing | tests/ directory | Testing phase |

### Phase Detection

```
Discovery → Planning → Development → Testing
```

Phases auto-determined based on file presence:
- **Discovery**: Brief or brainstorming exists
- **Planning**: PRD or architecture ready
- **Development**: Stories or code present
- **Testing**: Tests present

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| BMAD not activating | Ensure BMAD.md in root + rules installed in AI |
| Dashboard not generating | Run: `New-BMADDashboard -ProjectPath .` |
| Agent not identifying | Check BMAD.md present; verify rules installed |
| Story metrics wrong | Check "## Acceptance Criteria" formatting |
| Dev Notes not detected | Ensure "## Dev Notes" (exact spelling) |

---

## Project Workflows

### Discovery → Development → Production

**Phase 1: Discovery & Planning** (Use: Analyst → PM → UX → Architect → PO)
- Brainstorm & research
- Define requirements (PRD)
- Design UI/UX specification
- Create architecture
- Shard into epics

**Phase 2: Development** (Use: SM → Dev → QA, repeat)
- SM creates stories from epics
- Dev implements with TDD
- QA reviews & validates
- Repeat until epic complete

**Phase 3: Production** (Use: Architect → QA → PO)
- Final validation
- Deployment readiness
- Production monitoring

---

## Installation & Setup

### ⚡ Quick Start (2 minutes)

```bash
# 1. Clone CUSTOM-BMAD
git clone https://github.com/excelross12/Custom-BMAD.git
cd Custom-BMAD

# 2. Install rules in your AI (one-time)
#    Copy global-bmad-rules.md content to:
#    - Claude: Custom Instructions
#    - ChatGPT: Custom Instructions  
#    - Copilot: Knowledge Base
#    - Warp: Settings > AI > Knowledge > Manage Rules

# 3. You're ready! Start with:
#    Act as BMAD Analyst. Let's brainstorm...
```

### 📚 Detailed Setup

See **SETUP-GUIDE.md** for:
- Step-by-step installation for each AI
- Creating new projects
- Complete discovery-to-development workflow

### 🚀 Quick Reference

See **QUICK-REFERENCE.md** for:
- All agent commands
- File locations
- Development loop
- Troubleshooting

---

## Browser Compatibility

| Browser | Support | Notes |
|---------|---------|-------|
| Chrome 86+ | ✅ Full | Recommended |
| Edge 86+ | ✅ Full | Recommended |
| Brave | ✅ Full | Chromium-based |
| Firefox | ⚠️ Limited | File System API not supported |
| Safari | ❌ Not Supported | File System API not available |

*Dashboard requires File System Access API (Chromium browsers only)*

---

## Documentation

| Document | Purpose |
|----------|---------|
| `BMAD.md` | Project config (auto-activation trigger) |
| `global-bmad-rules.md` | Universal BMAD rules (install in AI) |
| `docs/DASHBOARD-GUIDE.md` | Complete dashboard user guide |
| `docs/BMAD-V9-ARCHITECTURE.md` | Dashboard technical architecture |
| `docs/v9-enhanced-workflow-tree-changelog.md` | Latest enhancements changelog |
| `QUICK-START.md` | Rapid onboarding guide |
| `SETUP-GUIDE.md` | Detailed installation instructions |

---

## Support & Community

### Getting Help

1. Check **BMAD.md** for project-specific rules
2. Review **global-bmad-rules.md** for agent definitions
3. See **BMAD-DASHBOARD-GUIDE.md** for detailed documentation
4. Check **DASHBOARD-QUICK-START.md** for quick answers

### Contributing

CUSTOM-BMAD is a framework for your projects. Contribute by:
1. Using BMAD in your projects
2. Sharing patterns and practices
3. Enhancing agent capabilities
4. Improving documentation

---

## Version History

| Version | Date | Notes |
|---------|------|-------|
| **4.45.0** | Oct 16, 2025 | Multi-Terminal Edition Release |
| 4.44.1 | Oct 8, 2025 | Warp Terminal Adaptation |
| 4.0.0 | Sept 2025 | Initial BMAD Method Release |

---

## License

**BMAD Method™** is a trademark of BMad Code, LLC

CUSTOM-BMAD framework is provided as-is for use in AI-driven development projects.

---

## Quick Summary

🎯 **CUSTOM-BMAD v4.45** is a complete AI development framework that:

1. ✅ **Works with ANY AI** (Claude, ChatGPT, Copilot, Warp, etc.)
2. ✅ **Auto-activates** when BMAD.md is present
3. ✅ **Uses 9 specialized agents** for different roles
4. ✅ **Tracks progress** with real-time dashboard
5. ✅ **Enforces quality** standards throughout
6. ✅ **Guides development** through documented workflows
7. ✅ **Provides agents** that identify themselves clearly
8. ✅ **Works offline** with no backend required

---

**Get started now:**

1. Clone/create project with BMAD.md
2. Install global-bmad-rules.md in your AI
3. Use natural language to activate agents
4. Track progress with auto-generated dashboard
5. Build amazing things! 🚀

---

**CUSTOM-BMAD v4.45 — Breakthrough Method of Agile AI-Driven Development**

🔧 Multi-Terminal Edition | Works with ANY AI | Auto-Activation via BMAD.md ✨
