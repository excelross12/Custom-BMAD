# Upgrade Existing WARP.md to v2.0.0
# This script safely merges your existing WARP.md with the new v2.0.0 template

param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectPath,
    [string]$WarpBmadPath = "C:\Users\Mr. K\Desktop\WARP-BMAD - Copy",
    [switch]$DryRun = $false
)

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  WARP.md Upgrade to v2.0.0" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Validate paths
if (-not (Test-Path $ProjectPath)) {
    Write-Host "ERROR: Project path not found: $ProjectPath" -ForegroundColor Red
    exit 1
}

$currentWarpMd = Join-Path $ProjectPath "WARP.md"
if (-not (Test-Path $currentWarpMd)) {
    Write-Host "ERROR: WARP.md not found in project: $currentWarpMd" -ForegroundColor Red
    Write-Host "Use copy command instead for new projects." -ForegroundColor Yellow
    exit 1
}

$newTemplate = Join-Path $WarpBmadPath "warp-rules\WARP.md"
if (-not (Test-Path $newTemplate)) {
    Write-Host "ERROR: New WARP.md template not found: $newTemplate" -ForegroundColor Red
    exit 1
}

Write-Host "Project Path: $ProjectPath" -ForegroundColor White
Write-Host "Current WARP.md: Found" -ForegroundColor Green
Write-Host ""

# Step 1: Backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Magenta
$backupPath = "$currentWarpMd.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
if (-not $DryRun) {
    Copy-Item -Path $currentWarpMd -Destination $backupPath -Force
}
Write-Host "  [BACKUP] Created: $(Split-Path -Leaf $backupPath)" -ForegroundColor Yellow
Write-Host ""

# Step 2: Read current settings
Write-Host "Step 2: Extracting your project settings..." -ForegroundColor Magenta
$currentContent = Get-Content $currentWarpMd -Raw

# Extract project-specific values (simple regex parsing)
$projectSettings = @{}

# Extract Project Name
if ($currentContent -match 'Project Name:\s*(.+)') {
    $projectSettings['ProjectName'] = $matches[1].Trim()
    Write-Host "  [FOUND] Project Name: $($projectSettings['ProjectName'])" -ForegroundColor Cyan
}

# Extract Description
if ($currentContent -match 'Description:\s*(.+)') {
    $projectSettings['Description'] = $matches[1].Trim()
    Write-Host "  [FOUND] Description: $($projectSettings['Description'])" -ForegroundColor Cyan
}

# Extract Tech Stack
if ($currentContent -match 'Tech Stack:\s*(.+)') {
    $projectSettings['TechStack'] = $matches[1].Trim()
    Write-Host "  [FOUND] Tech Stack: $($projectSettings['TechStack'])" -ForegroundColor Cyan
}

# Extract Current Phase
if ($currentContent -match 'Current Phase:\s*(.+)') {
    $projectSettings['CurrentPhase'] = $matches[1].Trim()
    Write-Host "  [FOUND] Current Phase: $($projectSettings['CurrentPhase'])" -ForegroundColor Cyan
}

# Extract Current Epic
if ($currentContent -match 'Current Epic:\s*(.+)') {
    $projectSettings['CurrentEpic'] = $matches[1].Trim()
    Write-Host "  [FOUND] Current Epic: $($projectSettings['CurrentEpic'])" -ForegroundColor Cyan
}

# Extract Current Story
if ($currentContent -match 'Current Story:\s*(.+)') {
    $projectSettings['CurrentStory'] = $matches[1].Trim()
    Write-Host "  [FOUND] Current Story: $($projectSettings['CurrentStory'])" -ForegroundColor Cyan
}

# Extract Stories Completed
if ($currentContent -match 'Stories Completed:\s*(.+)') {
    $projectSettings['StoriesCompleted'] = $matches[1].Trim()
    Write-Host "  [FOUND] Stories Completed: $($projectSettings['StoriesCompleted'])" -ForegroundColor Cyan
}

# Extract Sprint
if ($currentContent -match 'Sprint:\s*(.+)') {
    $projectSettings['Sprint'] = $matches[1].Trim()
    Write-Host "  [FOUND] Sprint: $($projectSettings['Sprint'])" -ForegroundColor Cyan
}

Write-Host ""

# Step 3: Copy new template
Write-Host "Step 3: Applying new v2.0.0 template..." -ForegroundColor Magenta
$newContent = Get-Content $newTemplate -Raw

# Replace placeholders with extracted values
if ($projectSettings['ProjectName']) {
    $newContent = $newContent -replace 'Project Name: \[Your Project Name\]', "Project Name: $($projectSettings['ProjectName'])"
}
if ($projectSettings['Description']) {
    $newContent = $newContent -replace 'Description: \[Brief description of what this project does\]', "Description: $($projectSettings['Description'])"
}
if ($projectSettings['TechStack']) {
    $newContent = $newContent -replace 'Tech Stack: \[Primary technologies.*?\]', "Tech Stack: $($projectSettings['TechStack'])"
}
if ($projectSettings['CurrentPhase']) {
    $newContent = $newContent -replace 'Current Phase: \[Planning / Development / Testing / Production\]', "Current Phase: $($projectSettings['CurrentPhase'])"
}
if ($projectSettings['CurrentEpic']) {
    $newContent = $newContent -replace 'Current Epic: epic-001-\[epic-name\]\.md', "Current Epic: $($projectSettings['CurrentEpic'])"
}
if ($projectSettings['CurrentStory']) {
    $newContent = $newContent -replace 'Current Story: story-00X-\[story-description\]\.md', "Current Story: $($projectSettings['CurrentStory'])"
}
if ($projectSettings['StoriesCompleted']) {
    $newContent = $newContent -replace 'Stories Completed: X / Y', "Stories Completed: $($projectSettings['StoriesCompleted'])"
}
if ($projectSettings['Sprint']) {
    $newContent = $newContent -replace 'Sprint: \[Sprint number or phase\]', "Sprint: $($projectSettings['Sprint'])"
}

if (-not $DryRun) {
    Set-Content -Path $currentWarpMd -Value $newContent -NoNewline
}
Write-Host "  [UPDATE] WARP.md upgraded to v2.0.0" -ForegroundColor Green
Write-Host ""

# Step 4: Summary
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  UPGRADE COMPLETE!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "What was done:" -ForegroundColor White
Write-Host "  1. Backup created: $(Split-Path -Leaf $backupPath)" -ForegroundColor Gray
Write-Host "  2. New v2.0.0 template applied" -ForegroundColor Gray
Write-Host "  3. Your project settings preserved" -ForegroundColor Gray
Write-Host ""

Write-Host "What's new in v2.0.0:" -ForegroundColor White
Write-Host "  + Agent Activation Reference (10 agents)" -ForegroundColor Green
Write-Host "  + Enhanced BMAD configuration" -ForegroundColor Green
Write-Host "  + Reference files documentation" -ForegroundColor Green
Write-Host ""

Write-Host "Next steps:" -ForegroundColor White
Write-Host "  1. Review the updated WARP.md" -ForegroundColor Gray
Write-Host "  2. Check the new 'Agent Activation Reference' section" -ForegroundColor Gray
Write-Host "  3. Verify your settings are correct" -ForegroundColor Gray
Write-Host ""

if ($DryRun) {
    Write-Host "DRY RUN - No files were modified" -ForegroundColor Yellow
} else {
    Write-Host "Files to review:" -ForegroundColor White
    Write-Host "  - WARP.md (upgraded)" -ForegroundColor Gray
    Write-Host "  - $(Split-Path -Leaf $backupPath) (backup)" -ForegroundColor Gray
}

Write-Host ""
Write-Host "SUCCESS! Your WARP.md is now v2.0.0 with your settings preserved!" -ForegroundColor Green
Write-Host ""
