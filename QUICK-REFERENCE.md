# 🎯 CUSTOM-BMAD Quick Reference Card

## Agent Commands

### Discovery & Planning Phase

```bash
# Brainstorm & Research
Act as BMAD Analyst. Let's brainstorm [project-idea].

# Create Requirements Document
Act as BMAD Product Manager. Create PRD from docs/project-brief.md

# Design User Interface
Act as BMAD UX Expert. Create UI spec from docs/prd.md

# Design System Architecture
Act as BMAD Architect. Create architecture from docs/prd.md and docs/front-end-spec.md

# Organize Documents
Act as BMAD Product Owner. Shard docs/prd.md into epics
```

### Development Phase (The Loop)

```bash
# Create next story
Act as BMAD Scrum Master. Create story-001 from docs/epics/epic-001-*.md

# Implement story
Act as BMAD Developer. Implement docs/stories/story-001-*.md

# Review implementation
Act as BMAD QA. Review story-001 implementation
```

### On-Demand

```bash
# General BMAD help
Act as BMAD Master. [Your question]

# Workflow guidance
Act as BMAD Process Guide. Help me with [task]
```

---

## File Locations

| File | Purpose |
|------|---------|
| `BMAD.md` | Auto-activation trigger (MUST exist in project root) |
| `global-bmad-rules.md` | Agent rules (install once in your AI) |
| `docs/project-brief.md` | Project discovery output |
| `docs/prd.md` | Product requirements document |
| `docs/front-end-spec.md` | UI/UX specification |
| `docs/architecture.md` | System architecture design |
| `docs/epics/epic-*.md` | Feature epics |
| `docs/stories/story-*.md` | Implementation stories |
| `bmad-dashboard.html` | Real-time progress tracker |

---

## Development Loop

```
┌─────────────────────────────────────┐
│  CUSTOM-BMAD Development Loop       │
└─────────────────────────────────────┘

1️⃣  Scrum Master creates story
    ↓
2️⃣  You review & approve
    ↓
3️⃣  Developer implements
    ↓
4️⃣  QA reviews & validates
    ↓
5️⃣  Verify & commit
    ↓
✅  REPEAT for next story
```

---

## Quality Gates (All Must Pass)

```bash
npm test              # >80% coverage required
npm run lint         # Zero linting errors
npm run type-check   # Strict type checking
npm run build        # Build succeeds
```

---

## 9 BMAD Agents

| Agent | Activation | Purpose |
|-------|-----------|---------|
| 🎯 Developer | `Act as BMAD Developer` | Code implementation |
| 🏃 Scrum Master | `Act as BMAD Scrum Master` | Story creation |
| 🧪 QA | `Act as BMAD QA` | Quality review |
| 📋 Product Owner | `Act as BMAD Product Owner` | Document management |
| 🏗️ Architect | `Act as BMAD Architect` | System design |
| 📈 Analyst | `Act as BMAD Analyst` | Discovery & research |
| 📊 Project Manager | `Act as BMAD Project Manager` | Requirements & planning |
| 🎨 UX Expert | `Act as BMAD UX Expert` | UI/UX design |
| 🎓 BMAD Master | `Act as BMAD Master` | General guidance |

---

## Multi-Terminal Setup (One-Time)

### Claude
1. Go to claude.ai
2. Click "Custom" (bottom left)
3. Create new custom Claude
4. Paste `global-bmad-rules.md` in Instructions
5. Save

### ChatGPT
1. Go to chat.openai.com
2. Settings > Custom Instructions
3. Paste `global-bmad-rules.md`
4. Save

### Copilot
1. Go to github.com/copilot
2. Settings > Knowledge
3. Add knowledge source
4. Paste `global-bmad-rules.md`
5. Save

### Warp
1. Open Warp Terminal
2. Settings > AI > Knowledge > Manage Rules
3. Add new rule
4. Paste `global-bmad-rules.md`
5. Save

---

## Starting a New Project (5 Steps)

```bash
# 1. Clone or create project
git clone https://github.com/excelross12/Custom-BMAD.git
cd Custom-BMAD

# 2. Install global-bmad-rules.md in your AI (one-time only)

# 3. Create project structure
mkdir -p docs/epics docs/stories src tests

# 4. Add BMAD.md to project root
cp BMAD-template.md BMAD.md

# 5. Start with discovery
Act as BMAD Analyst. Let's brainstorm...
```

---

## Dashboard

### Open Dashboard
1. Open `bmad-dashboard.html` in Chrome or Edge
2. Click "Select Project Directory"
3. Choose your project root
4. Watch real-time progress!

### What It Shows
- 📊 Current phase (Discovery → Planning → Development → Testing)
- 📈 Progress bar (0-100%)
- 📝 All stories with status
- 🔍 Dev Notes detection
- 📋 Quick copy-paste prompts

---

## Key Rules

✅ **BMAD.md must exist** in project root  
✅ **Install rules once** in your AI  
✅ **One story at a time**  
✅ **Dev Notes mandatory** at completion  
✅ **All tests must pass** before commit  
✅ **Sequential development** (stories in order)  

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| BMAD not working | Check BMAD.md exists + rules installed |
| Agent not identifying | Reload AI; verify BMAD.md present |
| Tests failing | Fix code; run `npm test` locally first |
| Coverage low | Add more test cases before commit |
| Dashboard blank | Use Chrome/Edge; refresh page |

---

## Phase Progression

```
Discovery
  ↓
  Use: Analyst → PM → UX → Architect
  Create: project-brief.md → prd.md → front-end-spec.md → architecture.md
  ↓
Planning
  ↓
  Use: Product Owner
  Create: Shard into epics (docs/epics/)
  ↓
Development
  ↓
  Use: SM → Dev → QA (repeat)
  Create: Stories & implementation code
  ↓
Testing
  ↓
  Use: QA → Architect
  Final validation & deployment readiness
```

---

## Essential Commands

```bash
# Create new story
Act as BMAD Scrum Master. Create story-[N] from docs/epics/epic-[X]-*.md

# Implement story
Act as BMAD Developer. Implement docs/stories/story-[N]-*.md

# Review implementation
Act as BMAD QA. Review story-[N] implementation and suggest improvements

# Validate all documents
Act as BMAD Product Owner. Run master checklist on all planning documents

# General help
Act as BMAD Master. I need help with [question]
```

---

## Dev Notes Template

Required at story completion:

```markdown
## Dev Notes

### What Worked
- [Successfully implemented features]

### Decisions Made
- [Technical decisions with rationale]

### Lessons Learned
- [Insights and gotchas]

### For Next Story
- [Context for continuation]
- [Suggested next steps]
- [Known issues to address]
```

---

## File Structure

```
project-root/
├── BMAD.md ← AUTO-ACTIVATION (MUST EXIST!)
├── bmad-dashboard.html ← PROGRESS TRACKER
├── global-bmad-rules.md ← AGENT RULES
├── docs/
│   ├── project-brief.md
│   ├── prd.md
│   ├── architecture.md
│   ├── front-end-spec.md
│   ├── epics/
│   │   ├── epic-001-*.md
│   │   └── epic-002-*.md
│   ├── stories/
│   │   ├── .current-story
│   │   ├── story-001-*.md
│   │   └── story-00X-*.md
│   └── qa/
├── src/ ← YOUR CODE
├── tests/ ← YOUR TESTS
└── reference/
    └── core-config.yaml
```

---

## Next Steps

1. ✅ Clone CUSTOM-BMAD
2. ✅ Install global-bmad-rules.md
3. ✅ Add BMAD.md to project
4. ✅ Use agents with natural language
5. ✅ Track progress with dashboard
6. ✅ Build amazing things! 🚀

---

**CUSTOM-BMAD v4.45 Quick Reference**  
Multi-Terminal Edition | Ready to Use | Bookmark This!
