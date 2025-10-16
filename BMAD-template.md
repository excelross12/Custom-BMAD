# 🎯 BMAD Project Configuration

**CUSTOM-BMAD Version**: 4.45.0 (Multi-Terminal Edition)  
**Project Framework**: BMAD Method™  
**Auto-Activation**: Enabled (this file presence triggers BMAD)

---

## 📋 PROJECT OVERVIEW

```
Project Name: [Your Project Name]
Description: [Brief description of what this project does]
Tech Stack: [Primary technologies: e.g., Node.js, React, PostgreSQL]
Current Phase: [Planning / Development / Testing / Production]
```

---

## 🚀 BMAD AUTO-ACTIVATION

**When this BMAD.md file is present in project root:**

✅ All BMAD rules automatically apply  
✅ Agents auto-identify with `🎯 **BMAD Agent:** | 🔧 CUSTOM-BMAD v4.45` branding  
✅ Dashboard auto-generates at `bmad-dashboard.html`  
✅ Works with ANY AI terminal (Claude, ChatGPT, Copilot, Warp, etc.)  
✅ Sequential development workflow enforced  

---

## 🌍 COMPATIBLE AI TERMINALS

This project works with:
- ✅ **Claude** (claude.ai, Claude API)
- ✅ **ChatGPT** (chat.openai.com, API)
- ✅ **Copilot** (github.com/copilot, IDE integration)
- ✅ **Warp Terminal** (Warp AI)
- ✅ **Any other AI** (just copy prompts)

---

## 📁 PROJECT STATUS

```yaml
Current Epic: epic-001-[epic-name].md
Current Story: story-00X-[story-description].md
Stories Completed: X / Y
Sprint: [Sprint number or phase]
```

To check current story:
```bash
cat docs/stories/.current-story
```

---

## 📂 PROJECT STRUCTURE

```
project-root/
├── BMAD.md                      # This file (auto-activates BMAD)
├── bmad-dashboard.html          # Auto-generated dashboard
├── README.md                    # Project documentation
├── docs/
│   ├── prd.md                   # Product Requirements
│   ├── architecture.md          # System Architecture
│   ├── epics/                   # Epic shards
│   │   ├── epic-001-*.md
│   │   └── epic-002-*.md
│   ├── stories/                 # Development stories
│   │   ├── .current-story       # Tracks active story
│   │   ├── story-001-*.md
│   │   └── story-00X-*.md
│   └── qa/
│       ├── assessments/
│       └── gates/
├── src/                         # Source code
│   └── [your-structure]/
├── tests/                       # Test suite
│   └── [your-tests]/
└── [other-directories]/
```

---

## 🔧 BMAD CORE CONFIGURATION

### Document Locations

```yaml
prd:
  prdFile: docs/prd.md
  prdVersion: v4
  prdSharded: true
  prdShardedLocation: docs/epics

architecture:
  architectureFile: docs/architecture.md
  architectureVersion: v4
  architectureSharded: false
  # Optional: docs/architecture/ for shards

stories:
  storyLocation: docs/stories
  currentStoryTracker: docs/stories/.current-story
  storyPattern: "story-{n}-*.md"

qa:
  qaLocation: docs/qa
  assessments: docs/qa/assessments
  gates: docs/qa/gates
```

### Quality Standards

```yaml
code:
  testCoverageMinimum: 80
  linting: "zero errors before commit"
  typeSafety: "strict mode preferred"
  documentation: "inline docs for public APIs"

stories:
  devNotes: "mandatory for all stories"
  architectureReference: "required"
  testRequirements: "explicit test cases"
  acceptanceCriteria: "clear and testable"

commits:
  format: "Conventional Commits"
  validationRequired: "all tests must pass"
  messageFormat: "feat|fix|docs|refactor|test(scope): description"
```

---

## 🎯 AGENT ACTIVATION

### Explicit Activation (Any Terminal)

Simply type and copy the prompt into any AI terminal:

```
Act as BMAD Developer. Implement story-001.
Act as BMAD Scrum Master. Create next story from epic-001.
Act as BMAD QA. Review current implementation.
Act as BMAD Product Owner. Shard docs/prd.md.
Act as BMAD Architect. Design the system architecture.
Act as BMAD Analyst. Help me discover requirements.
Act as BMAD Project Manager. Create comprehensive PRD.
Act as BMAD UX Expert. Design the user interface.
```

### Implicit Activation (Context-Based)

```
"Implement this story" → Activates Developer
"Create next story" → Activates Scrum Master
"Review this code" → Activates QA
"Design the system" → Activates Architect
"What should we build?" → Activates Analyst
```

---

## 📊 BMAD WORKFLOW PHASES

### Phase 1: Discovery & Planning

**Agents**: Analyst → Project Manager → UX Expert → Architect → Product Owner

**Output**:
- Project Brief
- Product Requirements Document (PRD)
- UI/UX Specification
- System Architecture
- Epic sharding

---

### Phase 2: Development Loop

**Agents**: Scrum Master → Developer → QA

**Cycle**:
1. **SM**: Create story from epic
2. **Dev**: Implement story
3. **QA**: Review & validate
4. **Repeat** for next story

---

### Phase 3: Production & Deployment

**Agents**: Architect → QA → Product Owner

**Validation**:
- All quality gates pass
- Deployment readiness
- Production monitoring

---

## 📋 USING THE DASHBOARD

### Auto-Generated Dashboard

File: `bmad-dashboard.html`

**Features**:
- Real-time project progress tracking
- Phase detection (Discovery → Planning → Development → Testing)
- Story metrics (acceptance criteria, Dev Notes)
- Quick Actions for all 9 BMAD agents
- Auto-refresh every 3 seconds

**Usage**:
1. Open `bmad-dashboard.html` in Chrome/Edge
2. Click "Select Project Directory"
3. Choose your project root
4. Watch real-time progress updates
5. Copy Quick Actions → Paste into your AI terminal

---

## 🔄 DEVELOPMENT WORKFLOW

### Story Implementation Pattern

```bash
# 1. Start story
cat docs/stories/.current-story

# 2. Read full story
cat docs/stories/story-XXX-*.md

# 3. Check previous Dev Notes for context
grep -A 50 "## Dev Notes" docs/stories/story-$(expr $(cat docs/stories/.current-story | sed 's/story-0*//;s/-.*//')-1).md

# 4. Execute tasks sequentially (as listed in story)
# 5. Write tests for each task (TDD)
# 6. Implement feature
# 7. Run validations

npm test                    # All tests pass
npm run lint               # Zero errors
npm run type-check         # Type safety
npm run build              # Builds successfully

# 8. Add Dev Notes to story
# 9. Commit changes
git add .
git commit -m "feat(story-XXX): [description]"

# 10. Update .current-story tracker
echo "story-{XXX+1}-*.md" > docs/stories/.current-story
```

---

## ✅ QUALITY GATES

### Before Every Commit

```
REQUIRED:
✓ All tests pass (npm test)
✓ No linting errors (npm run lint)
✓ Type checking passes (npm run type-check)
✓ Dev Notes added to story file
✓ Acceptance criteria met
```

### Before Story Completion

```
ADDITIONAL:
✓ Coverage maintained/improved
✓ Documentation updated
✓ All acceptance criteria met
✓ Manual testing completed
```

---

## 📝 DEV NOTES TEMPLATE

Every story MUST include Dev Notes:

```markdown
## Dev Notes

### What Worked
- [List successful implementations]
- [Good patterns discovered]

### Decisions Made
- [Technical choices with reasoning]
- [Trade-offs considered]

### Lessons Learned
- [Challenges overcome]
- [Things to avoid]
- [Better approaches found]

### For Next Story
- [Context needed for continuation]
- [Suggested next steps]
- [Known issues to address]
```

---

## 🌐 MULTI-TERMINAL INTEGRATION

### Using with Claude

```
1. Open claude.ai
2. Copy Quick Action from dashboard
3. Paste: "Act as BMAD Developer. Implement story-001..."
4. Claude responds with full CUSTOM-BMAD context
```

### Using with ChatGPT

```
1. Open chat.openai.com
2. Copy prompt from dashboard
3. Paste into ChatGPT
4. ChatGPT uses BMAD methodology
```

### Using with Copilot

```
1. Open github.com/copilot
2. Reference story with: "Reference docs/stories/story-001-*.md"
3. Copilot provides BMAD-guided implementation
```

### Using with Warp Terminal

```
1. Warp AI automatically detects BMAD.md
2. Agents auto-identify: "🎯 BMAD Agent: Developer | Dev | 🔧 CUSTOM-BMAD v4.45"
3. Full BMAD methodology applies
```

---

## 🚀 BEST PRACTICES

### 1. Keep .current-story Updated
```bash
echo "story-003-login-backend.md" > docs/stories/.current-story
```

### 2. Use Consistent Naming
```
Epics:   epic-001-authentication.md, epic-002-api-layer.md
Stories: story-001-user-signup.md, story-002-login-backend.md
```

### 3. Add Dev Notes Early
Document your decisions, learnings, and context for the next story.

### 4. Use Markdown Checkboxes
```markdown
## Acceptance Criteria
- [x] Task completed
- [ ] Task remaining
```

### 5. Run Validations Before Commit
```bash
npm test && npm run lint && npm run type-check
```

---

## 🆘 TROUBLESHOOTING

| Issue | Solution |
|-------|----------|
| Agent not identifying | Ensure BMAD.md present; check terminal logs |
| Dashboard not creating | Manual create: `New-BMADDashboard -ProjectPath .` |
| Story metrics wrong | Check "## Acceptance Criteria" formatting |
| Dev Notes not detected | Ensure section is "## Dev Notes" (exact) |
| Phase detection wrong | Check for required files (PRD, src/, tests/) |

---

## 📚 QUICK LINKS

| Resource | Location |
|----------|----------|
| Global BMAD Rules | `global-bmad-rules.md` |
| Dashboard User Guide | `DASHBOARD-QUICK-START.md` |
| Implementation Details | `IMPLEMENTATION-SUMMARY.md` |
| Dashboard Generator | `scripts/generate-bmad-dashboard.ps1` |
| Full Documentation | `BMAD-DASHBOARD-GUIDE.md` |

---

## 🎓 GETTING STARTED

1. ✅ This file presence enables BMAD methodology
2. ✅ Copy any Quick Action from dashboard
3. ✅ Paste into your AI terminal (Claude, ChatGPT, Copilot, Warp, etc.)
4. ✅ AI agent activates with CUSTOM-BMAD branding
5. ✅ Follow story-driven development workflow
6. ✅ Track progress with auto-generated dashboard

---

## 🎯 CUSTOM-BMAD v4.45

**Breakthrough Method of Agile AI-Driven Development**

Multi-Terminal Edition — Works with ANY AI  
Presence of BMAD.md = Auto-Activation ✨

🔧 **CUSTOM-BMAD v4.45** — Ready to build!
