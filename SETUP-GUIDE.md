# 🚀 CUSTOM-BMAD Setup & Initialization Guide

## Quick Clone & Use (5 minutes)

### Step 1: Clone Repository

```bash
git clone https://github.com/excelross12/Custom-BMAD.git
cd Custom-BMAD
```

### Step 2: Choose Your AI Terminal

Select which AI you'll use:

- **Claude** (claude.ai)
- **ChatGPT** (chat.openai.com)
- **GitHub Copilot** (github.com/copilot)
- **Warp Terminal** (warp.dev)
- **Any Other AI** with instruction/rules support

### Step 3: Install Global Rules (One-Time)

**Copy** the content of `global-bmad-rules.md` and add to your AI:

#### Claude
1. Go to [claude.ai](https://claude.ai)
2. Open "Custom" at bottom left
3. Click "Make a custom Claude"
4. Paste `global-bmad-rules.md` content in "Instructions"
5. Save custom Claude

#### ChatGPT
1. Go to [chat.openai.com](https://chat.openai.com)
2. Settings > Custom Instructions
3. Paste `global-bmad-rules.md` content
4. Save

#### GitHub Copilot
1. Go to [github.com/copilot](https://github.com/copilot)
2. Settings > Knowledge > Add new knowledge source
3. Paste `global-bmad-rules.md` content
4. Save

#### Warp Terminal
1. Open Warp Terminal
2. Settings > AI > Knowledge > Manage Rules
3. Click "Add new rule"
4. Paste `global-bmad-rules.md` content
5. Save

---

## Initialize Your Project

### Option A: Use Existing Project Template

```bash
# The repository is already configured and ready to use
# Just start using the agents!
```

### Option B: Create New CUSTOM-BMAD Project

```bash
# Create project directory
mkdir my-awesome-project
cd my-awesome-project

# Copy BMAD template
cp ../Custom-BMAD/BMAD-template.md BMAD.md

# Create directory structure
mkdir -p docs/epics docs/stories/completed docs/qa src tests reference

# Initialize git
git init
git add BMAD.md
git commit -m "init: Add BMAD.md for CUSTOM-BMAD auto-activation"
```

---

## First Use: Start with Discovery Phase

### 1. Brainstorming Session

```
Act as BMAD Analyst. Let's brainstorm a [your-project-idea].
```

Save output as: `docs/project-brief.md`

### 2. Create PRD

```
Act as BMAD Product Manager. Create comprehensive PRD from docs/project-brief.md
```

Save output as: `docs/prd.md`

### 3. Design UI/UX (Optional for backend projects)

```
Act as BMAD UX Expert. Create frontend specification from docs/prd.md
```

Save output as: `docs/front-end-spec.md`

### 4. Create Architecture

```
Act as BMAD Architect. Create fullstack architecture from docs/prd.md and docs/front-end-spec.md
```

Save output as: `docs/architecture.md`

### 5. Shard Documents

```
Act as BMAD Product Owner. Shard docs/prd.md into separate epic files
```

Creates: `docs/epics/epic-001-*.md`, `docs/epics/epic-002-*.md`, etc.

---

## Development Phase: The Loop

### For Each Story:

**1. Create Story**
```
Act as BMAD Scrum Master. Create story-001 from docs/epics/epic-001-*.md
```

**2. Review & Approve**
- Read the story
- Verify acceptance criteria
- Approve it

**3. Implement**
```
Act as BMAD Developer. Implement docs/stories/story-001-*.md
```

**4. Quality Review**
```
Act as BMAD QA. Review story-001 implementation
```

**5. Verify**
- Check tests pass
- Review code quality
- Mark complete

**6. Repeat**
```
Act as BMAD Scrum Master. Create story-002 from epic-001
```

Continue until all stories complete!

---

## Real-Time Dashboard

### Open Dashboard

1. Open `bmad-dashboard.html` in **Chrome** or **Edge**
2. Click "Select Project Directory"
3. Choose your project root
4. Watch real-time progress tracking!

### Dashboard Shows

✅ Current phase (Discovery → Planning → Development → Testing)  
✅ Progress bar (0-100%)  
✅ All stories with status  
✅ Dev Notes status  
✅ Quick copy-paste agent prompts  

---

## File Reference

| File | Purpose | When to Create |
|------|---------|---|
| **BMAD.md** | Project config & auto-activation | Every project root |
| **docs/prd.md** | Product requirements | After discovery |
| **docs/architecture.md** | System design | After PRD |
| **docs/front-end-spec.md** | UI/UX specification | After PRD (optional for backends) |
| **docs/epics/\*.md** | Feature epics | After PRD validation |
| **docs/stories/\*.md** | Implementation stories | During development |
| **src/** | Your source code | Development phase |
| **tests/** | Test suite | Development phase |

---

## Key Rules

✅ **BMAD.md must exist** in project root for auto-activation  
✅ **Install global-bmad-rules.md** in your AI (one-time)  
✅ **Use natural language** to activate agents  
✅ **One story at a time** for manageable complexity  
✅ **Run validations before commit:**

```bash
npm test              # >80% coverage
npm run lint         # Zero errors
npm run type-check   # Type safety
npm run build        # Build succeeds
```

✅ **Dev Notes mandatory** at story completion

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| BMAD not activating | Check BMAD.md in root + verify rules installed in AI |
| Agent not identifying | Ensure BMAD.md present; reload AI window |
| Dashboard not working | Try Chrome/Edge; click "Select Project Directory" |
| Story metrics wrong | Check formatting: "## Acceptance Criteria" (exact) |
| Can't commit changes | Run tests/linting; fix errors first |

---

## Multi-Terminal Quick Reference

### Claude
```
Act as BMAD Developer. [Your request]
```

### ChatGPT
```
Act as BMAD Scrum Master. [Your request]
```

### Copilot
```
Act as BMAD QA. [Your request]
```

### Warp
```
Act as BMAD Architect. [Your request]
```

All agents work the same way across all terminals!

---

## Next Steps

1. ✅ Clone CUSTOM-BMAD repository
2. ✅ Install global-bmad-rules.md in your AI
3. ✅ Create/select project directory
4. ✅ Start with discovery phase
5. ✅ Open dashboard to track progress
6. ✅ Use development loop: SM → Dev → QA
7. ✅ Build amazing things! 🚀

---

## Support

- 📖 See **README.md** for complete documentation
- 📚 See **global-bmad-rules.md** for agent definitions
- 📊 Open **bmad-dashboard.html** for real-time progress

---

**CUSTOM-BMAD v4.45 — Ready to Use! 🎉**
