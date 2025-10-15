# Setup Project-Specific BMAD Rules for Warp Terminal
# Date: October 9, 2025
# WARP-BMAD Version: 2.0.0

param(
    [Parameter(Mandatory=$false)]
    [string]$ProjectPath = $PWD,
    
    [Parameter(Mandatory=$false)]
    [string]$ProjectName = (Split-Path -Leaf $ProjectPath),
    
    [Parameter(Mandatory=$false)]
    [string]$ProjectType = "fullstack",
    
    [Parameter(Mandatory=$false)]
    [string]$TechStack = "Not specified"
)

Write-Host "🚀 Setting up project-specific BMAD rules..." -ForegroundColor Cyan
Write-Host ""

# 1. Create .warp directory
Write-Host "📁 Creating .warp directory..." -ForegroundColor Yellow
$warpDir = Join-Path $ProjectPath ".warp"
New-Item -Path $warpDir -ItemType Directory -Force | Out-Null

if (Test-Path $warpDir) {
    Write-Host "✅ .warp directory created: $warpDir" -ForegroundColor Green
} else {
    Write-Host "❌ Failed to create .warp directory" -ForegroundColor Red
    exit 1
}

# 2. Create project-specific rules.md
Write-Host "📄 Creating project-specific rules.md..." -ForegroundColor Yellow
$rulesFile = Join-Path $warpDir "rules.md"

$rulesContent = @"
# Project-Specific BMAD Rules

**Project Name**: $ProjectName  
**Project Type**: $ProjectType  
**Tech Stack**: $TechStack  
**BMAD Version**: 2.0.0  
**Date**: $(Get-Date -Format 'yyyy-MM-dd')

---

## 🎯 BMAD Method Active

This project uses **BMAD Method™** for AI-driven development.

### Available Agents

All 10 BMAD agents are available in this project:

- 🤖 **BMAD Developer (Dev)** - Implementation and coding
- 📋 **BMAD Product Owner (PO)** - Document management and validation
- 🏃 **BMAD Scrum Master (SM)** - Story creation and workflow
- 🧪 **BMAD Quality Assurance (QA)** - Testing and quality gates
- 🏗️ **BMAD Architect** - System design and architecture
- 📊 **BMAD Project Manager (PM)** - PRD creation and planning
- 🎨 **BMAD UX Expert (UX)** - Frontend specification and design
- 📈 **BMAD Analyst** - Research and discovery
- 🎯 **BMAD Master** - General BMAD tasks
- 🎭 **BMAD Process Guide** - Workflow guidance

---

## 🚀 Quick Start

### Agent Activation (Natural Language)

Activate any BMAD agent using natural language:

``````
"Act as BMAD Developer"
"Act as BMAD Scrum Master"
"Act as BMAD QA"
"Act as BMAD Architect"
``````

### Smart Intent Detection

Warp AI automatically detects your intent:

- **"implement story-003"** → Developer agent
- **"create next story"** → Scrum Master agent
- **"test this code"** → QA agent
- **"design the architecture"** → Architect agent

---

## 📁 Project Structure

``````
$ProjectName/
├── .warp/
│   └── rules.md           ← This file
├── docs/                  ← BMAD artifacts
│   ├── prd.md             ← Product Requirements
│   ├── architecture.md    ← System Architecture
│   ├── epics/             ← Epic files
│   └── stories/           ← User Stories
├── reference/             ← BMAD reference files (optional)
└── [your code]
``````

---

## 🔧 Project Configuration

### Tech Stack
$TechStack

### Project Type
$ProjectType

### BMAD Workflows Available
- Greenfield Full-Stack
- Greenfield Service
- Greenfield UI
- Brownfield Full-Stack
- Brownfield Service
- Brownfield UI

---

## 📚 Global Rules

This project references the **global BMAD Method™ rules** installed in Warp Terminal.
For complete methodology, see Warp Settings > AI > Rules.

### Project-Specific Overrides

Any project-specific configuration can be added here:
- Testing framework
- Build tools
- Package manager
- Coding standards
- Team conventions

---

## ✅ Agent Identification Protocol

**CRITICAL**: All BMAD agents MUST identify themselves at the start of EVERY response.

**Format**:
``````
🤖 **Agent: BMAD [Agent Name]** ([Role])

[Response content]
``````

**Example**:
``````
🤖 **Agent: BMAD Developer** (Dev)

I'll implement story-003 following the TDD approach...
``````

---

## 🎯 Development Loop

The standard BMAD development loop for this project:

1. **SM Agent** → Creates next story from epic
2. **You** → Review and approve story
3. **Dev Agent** → Implements approved story
4. **QA Agent** → Reviews and validates code
5. **You** → Verify completion
6. **Repeat** until epic complete

---

## 📋 Quick Commands

### Start Story Implementation
``````
"Act as BMAD Developer. Implement docs/stories/story-XXX-*.md"
``````

### Create Next Story
``````
"Act as BMAD Scrum Master. Create next story from current epic"
``````

### Run QA Checks
``````
"Act as BMAD QA. Review current implementation and run quality gates"
``````

### Validate Story Against Epic
``````
"Act as BMAD Product Owner. Validate story-XXX against epic requirements"
``````

---

## 🚀 Getting Started with BMAD

If this is your first time using BMAD in this project:

1. **Create initial documents** (PRD, Architecture)
2. **Shard into epics** (PO agent)
3. **Create first story** (SM agent)
4. **Implement story** (Dev agent)
5. **Review and refactor** (QA agent)
6. **Repeat** for all stories

---

**Last Updated**: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  
**BMAD Method™** is a trademark of BMad Code, LLC
"@

Set-Content -Path $rulesFile -Value $rulesContent -Encoding UTF8
Write-Host "✅ Project rules created: $rulesFile" -ForegroundColor Green

# 3. Create commands directory (optional)
Write-Host "📁 Creating commands directory..." -ForegroundColor Yellow
$commandsDir = Join-Path $warpDir "commands"
New-Item -Path $commandsDir -ItemType Directory -Force | Out-Null

# 4. Create sample BMAD commands file
$commandsFile = Join-Path $commandsDir "bmad-commands.yaml"
$commandsContent = @"
# Custom BMAD Commands for $ProjectName
# Auto-generated on $(Get-Date -Format 'yyyy-MM-dd')

commands:
  - name: bmad-status
    description: Show current BMAD project status
    command: |
      Write-Host "📊 BMAD Project Status" -ForegroundColor Cyan
      Write-Host ""
      
      if (Test-Path "docs/stories/.current-story") {
        `$current = Get-Content "docs/stories/.current-story"
        Write-Host "Current Story: `$current" -ForegroundColor Yellow
      } else {
        Write-Host "Current Story: None" -ForegroundColor Gray
      }
      
      if (Test-Path "docs/epics") {
        `$epics = (Get-ChildItem "docs/epics/*.md" -ErrorAction SilentlyContinue).Count
        Write-Host "Total Epics: `$epics" -ForegroundColor Yellow
      }
      
      if (Test-Path "docs/stories") {
        `$stories = (Get-ChildItem "docs/stories/*.md" -ErrorAction SilentlyContinue).Count
        Write-Host "Total Stories: `$stories" -ForegroundColor Yellow
      }
      
      Write-Host ""
      Write-Host "🚀 BMAD Method™ Active" -ForegroundColor Green

  - name: bmad-start-story
    description: Start implementing current story
    command: |
      if (Test-Path "docs/stories/.current-story") {
        `$story = Get-Content "docs/stories/.current-story"
        Write-Host "🚀 Starting story: `$story" -ForegroundColor Cyan
        Write-Host "Activating BMAD Developer agent..." -ForegroundColor Yellow
        # Open story file
        `$storyPath = "docs/stories/`$story"
        if (Test-Path `$storyPath) {
          Get-Content `$storyPath
        } else {
          Write-Host "❌ Story file not found: `$storyPath" -ForegroundColor Red
        }
      } else {
        Write-Host "❌ No current story set" -ForegroundColor Red
        Write-Host "Run 'bmad-create-story' first" -ForegroundColor Yellow
      }

  - name: bmad-create-story
    description: Create next story from epic
    command: |
      Write-Host "📋 Activating BMAD Scrum Master..." -ForegroundColor Cyan
      Write-Host "Use Warp AI: 'Act as BMAD Scrum Master. Create next story'" -ForegroundColor Yellow

  - name: bmad-qa-check
    description: Run QA checks on current implementation
    command: |
      Write-Host "🧪 Running BMAD QA Checks..." -ForegroundColor Cyan
      Write-Host ""
      
      # Run tests if available
      if (Test-Path "package.json") {
        Write-Host "Running tests..." -ForegroundColor Yellow
        npm test
        
        Write-Host ""
        Write-Host "Running linter..." -ForegroundColor Yellow
        npm run lint
        
        Write-Host ""
        Write-Host "Type checking..." -ForegroundColor Yellow
        npm run type-check
      } else {
        Write-Host "No package.json found - skipping automated checks" -ForegroundColor Gray
      }
      
      Write-Host ""
      Write-Host "Use Warp AI: 'Act as BMAD QA. Review current implementation'" -ForegroundColor Yellow

  - name: bmad-docs
    description: Open BMAD documentation directory
    command: |
      if (Test-Path "docs") {
        Write-Host "📚 BMAD Documentation:" -ForegroundColor Cyan
        Get-ChildItem "docs" -Recurse -Include "*.md" | ForEach-Object {
          Write-Host "  - `$(`$_.FullName.Replace((Get-Location).Path, '.'))" -ForegroundColor Yellow
        }
      } else {
        Write-Host "❌ docs/ directory not found" -ForegroundColor Red
        Write-Host "Create it with: mkdir docs" -ForegroundColor Yellow
      }
"@

Set-Content -Path $commandsFile -Value $commandsContent -Encoding UTF8
Write-Host "✅ BMAD commands created: $commandsFile" -ForegroundColor Green

# 5. Create .gitignore for .warp if needed
$gitignoreFile = Join-Path $warpDir ".gitignore"
if (-not (Test-Path $gitignoreFile)) {
    $gitignoreContent = @"
# Warp-specific files that shouldn't be committed
# (Uncomment if you have local-only settings)

# Uncomment to ignore local customizations:
# local-settings.md
"@
    Set-Content -Path $gitignoreFile -Value $gitignoreContent -Encoding UTF8
    Write-Host "✅ .gitignore created in .warp/" -ForegroundColor Green
}

# 6. Summary
Write-Host ""
Write-Host "═══════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✅ BMAD Project-Specific Rules Setup Complete!" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "📁 Project: $ProjectName" -ForegroundColor White
Write-Host "📍 Location: $ProjectPath" -ForegroundColor White
Write-Host "🎯 Type: $ProjectType" -ForegroundColor White
Write-Host "🛠️  Tech Stack: $TechStack" -ForegroundColor White
Write-Host ""
Write-Host "📋 Files Created:" -ForegroundColor Yellow
Write-Host "   ✓ .warp/rules.md           (Project-specific BMAD rules)" -ForegroundColor Gray
Write-Host "   ✓ .warp/commands/bmad-commands.yaml  (Custom commands)" -ForegroundColor Gray
Write-Host "   ✓ .warp/.gitignore         (Git configuration)" -ForegroundColor Gray
Write-Host ""
Write-Host "🚀 Next Steps:" -ForegroundColor Yellow
Write-Host "   1. Open Warp Terminal in this directory" -ForegroundColor White
Write-Host "   2. Activate agent: 'Act as BMAD Developer'" -ForegroundColor White
Write-Host "   3. Verify agent identification appears" -ForegroundColor White
Write-Host "   4. Start using BMAD Method™!" -ForegroundColor White
Write-Host ""
Write-Host "📚 Documentation:" -ForegroundColor Yellow
Write-Host "   - See PROJECT-SPECIFIC-RULES-GUIDE.md for details" -ForegroundColor White
Write-Host "   - See FINAL-COMPARISON.md for feature comparison" -ForegroundColor White
Write-Host ""
Write-Host "💡 Test it:" -ForegroundColor Yellow
Write-Host "   cd '$ProjectPath'" -ForegroundColor Cyan
Write-Host "   # Warp AI should auto-detect .warp/rules.md" -ForegroundColor Gray
Write-Host ""
Write-Host "🎉 Happy coding with BMAD Method™!" -ForegroundColor Green
Write-Host ""
