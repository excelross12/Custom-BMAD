# WARP-BMAD Quick Start Guide

**Get started with WARP-BMAD in 15 minutes**

---

## Installation

### Step 1: Install Global Rules (2 minutes)

1. Open Warp Terminal (or your AI coding environment)
2. **Settings** -> **AI** -> **Rules**
3. Click **"Add Global Rule"**
4. Select: `docs/global-bmad-rules.md`
5. Name: **"BMAD Method"**
6. Save

**Done!** BMAD is now available in your environment.

### Step 2: Create Project (3 minutes)

```bash
# Create project
mkdir my-project
cd my-project

# Initialize
git init
mkdir -p docs/{epics,stories}

# Copy BMAD reference files (optional but recommended)
cp -r /path/to/WARP-BMAD/reference ./reference
```

---

## Your First BMAD Workflow

### Phase 1: Planning (5 minutes)

```bash
# 1. Brainstorm
"Act as BMAD Analyst. Brainstorm a task management API."
# -> Saves discussion to docs/project-brief.md

# 2. Create PRD
"Act as BMAD PM. Create PRD from docs/project-brief.md"
# -> Save output as docs/prd.md

# 3. Create Architecture
"Act as BMAD Architect. Design architecture from docs/prd.md"
# -> Save output as docs/architecture.md

# 4. Shard Documents
"Act as BMAD PO. Shard docs/prd.md into epic files"
# -> Creates docs/epics/epic-001-*.md, epic-002-*.md, etc.
```

### Phase 2: Development (5 minutes)

```bash
# 5. Create Story
"Act as BMAD SM. Create story 001 from epic-001"
# -> Save as docs/stories/story-001-*.md

# 6. Implement
"Act as BMAD Developer. Implement story-001"
# -> Dev codes, tests, adds Dev Notes

# 7. Validate
npm test && npm run lint && npm run type-check
# -> All must pass!

# 8. Commit
git add .
git commit -m "feat(story-001): implement feature"

# 9. Repeat!
```

---

## The 10 BMAD Agents

| Agent | Command | Use For |
|-------|---------|---------|
| **Analyst** | `"Act as BMAD Analyst"` | Discovery, research |
| **PM** | `"Act as BMAD PM"` | PRD creation |
| **UX Expert** | `"Act as BMAD UX Expert"` | UI/UX design |
| **Architect** | `"Act as BMAD Architect"` | Architecture |
| **SM** | `"Act as BMAD SM"` | Story creation |
| **Developer** | `"Act as BMAD Developer"` | Implementation |
| **QA** | `"Act as BMAD QA"` | Quality review |
| **PO** | `"Act as BMAD PO"` | Validation |
| **Master** | `"Act as BMAD Master"` | General help |
| **Orchestrator** | `"Act as BMAD Orchestrator"` | Workflow guide |

---

## Key Concepts

### Dev Notes (Secret Sauce!)

Every story ends with comprehensive Dev Notes:

```markdown
## Dev Notes

### What Worked
- JWT auth successful

### Decisions Made
- 7-day token expiry

### For Next Story
- Add rate limiting
```

**Why**: Preserves context between stories!

### Sequential Development

1. One story at a time
2. Each story builds on previous Dev Notes
3. Maintains context throughout project

### Quality Gates

Before every commit:
```bash
npm test              # All tests pass
npm run lint          # Zero errors
npm run type-check    # Types clean
```

---

## Tips

### Read Dev Notes First
```bash
cat docs/stories/story-001-*.md | grep -A 50 "## Dev Notes"
```

### Check Current Story
```bash
cat docs/stories/.current-story
```

### Get Help
```bash
"Act as BMAD Orchestrator. Guide me through greenfield workflow"
```

---

## Troubleshooting

**Issue**: Agents not recognized  
**Fix**: Verify global-bmad-rules.md installed in Settings -> AI -> Rules

**Issue**: Responses seem generic  
**Fix**: Ensure proper agent activation format

**Issue**: Dev Notes feel tedious  
**Remember**: They're the secret sauce! Context preservation prevents knowledge loss.

---

## Next Steps

- Read [README.md](README.md) for full overview
- Study [docs/global-bmad-rules.md](docs/global-bmad-rules.md) for methodology
- Check [reference/](reference/) for complete agent definitions

---

## Success Checklist

- [ ] Installed global-bmad-rules.md
- [ ] Created project structure
- [ ] Completed planning phase
- [ ] Implemented first story
- [ ] Added Dev Notes
- [ ] All tests passing

**You're now using WARP-BMAD!**

---

**Start building**: `"Act as BMAD Analyst. Let's start!"`

**Version**: 2.0.0 | **Updated**: October 15, 2025
