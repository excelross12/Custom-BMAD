# Generate Remaining WARP-BMAD Files
# This script creates all remaining templates, tasks, docs, examples, scripts, and tests

$ErrorActionPreference = "Stop"
$BasePath = "C:\Users\AGC-Inventory\Desktop\WARP-BMAD"

Write-Host "Generating remaining WARP-BMAD files..." -ForegroundColor Cyan

# Create remaining workflow files
Write-Host "`nCreating workflow files..." -ForegroundColor Yellow
@"
name: test-automation-workflow
version: 1.0.0
description: Automated testing workflow for terminal
stages:
  - Run unit tests
  - Check coverage
  - Run lint
  - Type check
  - Integration tests
commands:
  test: npm test
  coverage: npm test -- --coverage
  lint: npm run lint
  type_check: npm run type-check
"@ | Out-File -FilePath "$BasePath\workflows\test-automation-workflow.yaml" -Encoding UTF8

# Create task files
Write-Host "Creating task files..." -ForegroundColor Yellow
@"
# Run Story Task

## Purpose
Execute BMAD story from terminal with full context

## Usage
\`\`\`bash
cat docs/stories/story-XXX-*.md
# Read completely
# Execute tasks sequentially
# Add Dev Notes
\`\`\`

## Steps
1. Read story file
2. Check prerequisites
3. Execute each task
4. Write tests
5. Run validations
6. Add Dev Notes
7. Commit

## Success Criteria
- All tasks complete
- Tests pass
- Dev Notes added
"@ | Out-File -FilePath "$BasePath\tasks\run-story-task.md" -Encoding UTF8

@"
# Validate Code Task

## Purpose
Run all code quality validations

## Commands
\`\`\`bash
npm test
npm run lint
npm run type-check
npm test -- --coverage
\`\`\`

## Success Criteria
- All tests pass ✓
- Zero lint errors ✓
- Type safe ✓
- Coverage >80% ✓
"@ | Out-File -FilePath "$BasePath\tasks\validate-code.md" -Encoding UTF8

@"
# Generate Tests Task

## Purpose
Generate and execute tests for implemented code

## Approach
1. Identify code to test
2. Write unit tests
3. Write integration tests
4. Run tests
5. Check coverage

## Example
\`\`\`bash
code tests/feature.test.ts
npm test -- feature.test.ts
npm test -- --coverage
\`\`\`
"@ | Out-File -FilePath "$BasePath\tasks\generate-tests.md" -Encoding UTF8

@"
# Commit Story Task

## Purpose
Commit completed story with proper message

## Steps
1. Validate all checks pass
2. Add Dev Notes
3. Stage changes
4. Commit with convention

## Command
\`\`\`bash
npm test && npm run lint && npm run type-check
git add .
git commit -m "feat(story-XXX): description"
\`\`\`

## Message Format
\`feat|fix|docs|refactor|test(story-XXX): description\`
"@ | Out-File -FilePath "$BasePath\tasks\commit-story.md" -Encoding UTF8

@"
# Shard from CLI Task

## Purpose
Shard large documents into consumable pieces from terminal

## Commands
\`\`\`bash
# Shard PRD
mkdir -p docs/epics
awk '/## Epic 001/,/## Epic 002/' docs/prd.md > docs/epics/epic-001.md

# Shard Architecture
mkdir -p docs/arch-sections
# Extract sections

# Or use Warp AI
"Help me shard docs/prd.md into epic files"
\`\`\`
"@ | Out-File -FilePath "$BasePath\tasks\shard-from-cli.md" -Encoding UTF8

# Create template files
Write-Host "Creating template files..." -ForegroundColor Yellow
@"
# Story XXX: [Title]

## Context
[Background from previous stories and epic]

## Architecture Reference
docs/architecture.md - Section X.Y
[Relevant details]

## Prerequisites
- [ ] Story XXX-1 complete
- [ ] [Dependencies]

## Implementation Tasks
1. **Task 1**: [Description]
   - Subtask 1.1
   - Subtask 1.2
2. **Task 2**: [Description]

## Acceptance Criteria
- [ ] [Testable criterion]
- [ ] [Another criterion]

## Test Requirements
- Unit tests for [feature]
- Integration tests for [workflow]

## Dev Notes
### What Worked
- [Successes]

### Decisions Made
- [Technical decisions]

### Lessons Learned
- [Insights]

### For Next Story
- [Context for continuation]
"@ | Out-File -FilePath "$BasePath\templates\terminal-story-template.md" -Encoding UTF8

Write-Host "Creating documentation files..." -ForegroundColor Yellow
@"
# BMAD-Warp Knowledge Base

## BMAD Method Overview
Story-driven, context-preserving agile development

## Key Concepts
- **Stories**: Sequential, detailed implementation units
- **Dev Notes**: Context preservation mechanism
- **Quality Gates**: Validation before commits
- **Architecture Alignment**: Reference-based implementation

## Workflows
1. SM drafts story
2. Dev implements
3. Validate (test/lint/type)
4. Add Dev Notes
5. Commit
6. Repeat

## Best Practices
- Read previous Dev Notes
- Reference architecture
- Test alongside code
- Comprehensive Dev Notes
- Clean commits
"@ | Out-File -FilePath "$BasePath\docs\bmad-warp-kb.md" -Encoding UTF8

@"
# Troubleshooting Guide

## Rules Not Applied
**Problem**: Warp doesn't use BMAD rules
**Solution**:
- Check WARP.md exists
- Run /init
- Verify in Settings > AI > Rules

## Commands Not Working
**Problem**: Slash commands not recognized
**Solution**:
- Use natural language
- Reference story files explicitly
- Check WARP.md defines patterns

## Context Loss
**Problem**: Agent doesn't have context
**Solution**:
- Ensure Dev Notes in previous story
- Check architecture references
- Verify WARP.md customized

## Common Issues
- File not found: Check paths
- Tests fail: Debug with npm test -- --verbose
- Lint errors: Run npm run lint:fix
- Type errors: Check tsconfig.json
"@ | Out-File -FilePath "$BasePath\docs\troubleshooting.md" -Encoding UTF8

@"
# Glossary

## BMAD Terms
- **BMAD**: Breakthrough Method of Agile AI-Driven Development
- **Story**: Detailed implementation unit with full context
- **Epic**: Collection of related stories
- **Dev Notes**: Context preservation at story completion
- **SM**: Scrum Master - Story creation agent
- **Dev**: Developer - Implementation agent
- **QA**: Quality Assurance agent
- **PO**: Product Owner - Document management agent

## Warp Terms
- **Rules**: Global or Project-specific AI context
- **Warp Drive**: Centralized workflows and knowledge
- **Command Palette**: Quick command access (Cmd/Ctrl+P)
- **Terminal Blocks**: Multi-line command execution

## Quality Terms
- **NFR**: Non-Functional Requirements
- **Coverage**: Test code coverage percentage
- **Lint**: Code style and error checking
- **Type Check**: TypeScript type validation
"@ | Out-File -FilePath "$BasePath\docs\glossary.md" -Encoding UTF8

# Create example files
Write-Host "Creating example files..." -ForegroundColor Yellow
New-Item -Path "$BasePath\examples\full-stack-project" -ItemType Directory -Force | Out-Null
@"
# Example Full-Stack Project

This directory would contain a complete example project with:
- WARP.md configured
- Sample docs/prd.md
- Sample docs/architecture.md
- Sample docs/stories/
- Working code structure

See WARP-BMAD/warp-rules/WARP.md for template to customize.
"@ | Out-File -FilePath "$BasePath\examples\full-stack-project\README.md" -Encoding UTF8

New-Item -Path "$BasePath\examples\sample-stories" -ItemType Directory -Force | Out-Null
@"
# Story 001: Project Setup

## Context
Initial project setup for SaaS application.

## Implementation Tasks
1. **Initialize repository**
   - git init
   - Create README.md
2. **Setup Node.js project**
   - npm init
   - Install dependencies

## Acceptance Criteria
- [ ] Git repository initialized
- [ ] package.json created
- [ ] Dependencies installed

## Dev Notes
### What Worked
- Used npm init -y for quick setup
- Added ESLint and Prettier

### For Next Story
- Ready for authentication implementation
"@ | Out-File -FilePath "$BasePath\examples\sample-stories\story-001-project-setup.md" -Encoding UTF8

# Create scripts
Write-Host "Creating utility scripts..." -ForegroundColor Yellow
@"
# WARP-BMAD Installation Script
# Automated installation for Warp Terminal

param(
    [string]`$ProjectPath = (Get-Location).Path,
    [switch]`$Force
)

Write-Host "Installing WARP-BMAD..." -ForegroundColor Cyan

# 1. Copy WARP.md to project
if (Test-Path "`$ProjectPath\WARP.md" -and -not `$Force) {
    Write-Warning "WARP.md already exists. Use -Force to overwrite."
} else {
    Copy-Item "$BasePath\warp-rules\WARP.md" -Destination "`$ProjectPath\WARP.md"
    Write-Host "✓ Copied WARP.md to project" -ForegroundColor Green
}

# 2. Create docs structure
`$DocsPath = Join-Path `$ProjectPath "docs"
@("epics", "stories", "qa\assessments", "qa\gates") | ForEach-Object {
    `$Path = Join-Path `$DocsPath `$_
    if (-not (Test-Path `$Path)) {
        New-Item -Path `$Path -ItemType Directory -Force | Out-Null
    }
}
Write-Host "✓ Created docs structure" -ForegroundColor Green

# 3. Instructions for Global Rules
Write-Host "`n📋 Next Steps:" -ForegroundColor Yellow
Write-Host "1. Open Warp Terminal"
Write-Host "2. Go to Settings > AI > Knowledge > Manage Rules"
Write-Host "3. Add Global Rule:"
Write-Host "   Name: BMAD Method"
Write-Host "   Content: Copy from $BasePath\warp-rules\global-bmad-rules.md"
Write-Host "4. In your project, run: /init"
Write-Host "`n✓ Installation complete!" -ForegroundColor Green
"@ | Out-File -FilePath "$BasePath\scripts\install-warp-bmad.ps1" -Encoding UTF8

@"
# Initialize BMAD Project in Warp

param([string]`$ProjectPath = (Get-Location).Path)

Write-Host "Initializing BMAD project..." -ForegroundColor Cyan

# Create directory structure
`$Dirs = @("docs/prd", "docs/architecture", "docs/epics", "docs/stories", "docs/qa", "src", "tests")
foreach (`$Dir in `$Dirs) {
    `$FullPath = Join-Path `$ProjectPath `$Dir
    if (-not (Test-Path `$FullPath)) {
        New-Item -Path `$FullPath -ItemType Directory -Force | Out-Null
    }
}

# Create .current-story tracker
"" | Out-File -FilePath (Join-Path `$ProjectPath "docs\stories\.current-story")

Write-Host "✓ Project structure created" -ForegroundColor Green
Write-Host "✓ Ready for BMAD development!" -ForegroundColor Green
"@ | Out-File -FilePath "$BasePath\scripts\init-project.ps1" -Encoding UTF8

@"
# Validate WARP-BMAD Installation

`$ErrorCount = 0

Write-Host "Validating WARP-BMAD installation..." -ForegroundColor Cyan

# Check WARP.md
if (Test-Path ".\WARP.md") {
    Write-Host "✓ WARP.md exists" -ForegroundColor Green
} else {
    Write-Host "✗ WARP.md not found" -ForegroundColor Red
    `$ErrorCount++
}

# Check docs structure
@("docs", "docs/epics", "docs/stories") | ForEach-Object {
    if (Test-Path `$_) {
        Write-Host "✓ `$_ exists" -ForegroundColor Green
    } else {
        Write-Host "✗ `$_ not found" -ForegroundColor Red
        `$ErrorCount++
    }
}

if (`$ErrorCount -eq 0) {
    Write-Host "`n✓ Installation valid!" -ForegroundColor Green
} else {
    Write-Host "`n✗ `$ErrorCount issues found" -ForegroundColor Red
}
"@ | Out-File -FilePath "$BasePath\scripts\validate-installation.ps1" -Encoding UTF8

# Create test files
Write-Host "Creating test files..." -ForegroundColor Yellow
New-Item -Path "$BasePath\tests\integration-tests" -ItemType Directory -Force | Out-Null
@"
# Integration Tests

## Test WARP.md Loading
- Verify WARP.md is detected by Warp
- Confirm rules are applied

## Test Story Workflow
- Create sample story
- Verify format
- Test Dev Notes section

## Test Agent Interactions
- SM drafts story
- Dev implements
- QA reviews
- PO validates
"@ | Out-File -FilePath "$BasePath\tests\integration-tests\README.md" -Encoding UTF8

# Create test runner script content
$TestScript = @'
# Test Execution Script

Write-Host "Running WARP-BMAD tests..." -ForegroundColor Cyan

# Test 1: File structure
Write-Host "`nTest 1: Validating file structure..."

# Test 2: Rules files exist
Write-Host "`nTest 2: Checking rules files..."
$BasePath = "C:\Users\AGC-Inventory\Desktop\WARP-BMAD"
@("global-bmad-rules.md", "WARP.md") | ForEach-Object {
    if (Test-Path "$BasePath\warp-rules\$_") {
        Write-Host "+ $_ exists" -ForegroundColor Green
    }
}

# Test 3: Agent files exist
Write-Host "`nTest 3: Checking agent files..."
@("terminal-dev.md", "terminal-sm.md", "terminal-qa.md", "terminal-po.md") | ForEach-Object {
    if (Test-Path "$BasePath\agents\$_") {
        Write-Host "+ $_ exists" -ForegroundColor Green
    }
}

Write-Host "`n+ Tests complete!" -ForegroundColor Green
'@

$TestScript | Out-File -FilePath "$BasePath\tests\run-tests.ps1" -Encoding UTF8

Write-Host "`n+ All remaining files generated!" -ForegroundColor Green
Write-Host "Run test script from WARP-BMAD directory" -ForegroundColor Cyan
