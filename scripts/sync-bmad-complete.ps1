# BMAD Method Complete Synchronization Script
# Version: 2.0.0
# Purpose: Sync ALL files from Original BMAD v4.44.1 to WARP-BMAD

param(
    [string]$OriginalBmadPath = "C:\Users\Mr. K\Desktop\BMAD\BMAD-METHOD-4.44.1",
    [string]$WarpBmadPath = "C:\Users\Mr. K\Desktop\WARP-BMAD - Copy",
    [switch]$DryRun = $false
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "BMAD Complete Synchronization Script" -ForegroundColor Cyan
Write-Host "Original BMAD → WARP-BMAD v2.0.0" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

if ($DryRun) {
    Write-Host "DRY RUN MODE - No files will be modified" -ForegroundColor Yellow
    Write-Host ""
}

# Validate paths
if (-not (Test-Path $OriginalBmadPath)) {
    Write-Host "ERROR: Original BMAD path not found: $OriginalBmadPath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $WarpBmadPath)) {
    Write-Host "ERROR: WARP-BMAD path not found: $WarpBmadPath" -ForegroundColor Red
    exit 1
}

# Statistics
$stats = @{
    NewFilesCopied = 0
    FilesUpdated = 0
    FilesSkipped = 0
    BackupsCreated = 0
    Errors = 0
}

function Copy-BmadFile {
    param(
        [string]$SourcePath,
        [string]$DestPath,
        [switch]$Backup = $true
    )
    
    try {
        # Ensure destination directory exists
        $destDir = Split-Path -Parent $DestPath
        if (-not (Test-Path $destDir)) {
            if (-not $DryRun) {
                New-Item -ItemType Directory -Path $destDir -Force | Out-Null
            }
            Write-Host "  [CREATE DIR] $destDir" -ForegroundColor Green
        }
        
        # Check if file exists
        $fileExists = Test-Path $DestPath
        
        if ($fileExists -and $Backup) {
            # Create backup
            $backupPath = "$DestPath.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
            if (-not $DryRun) {
                Copy-Item -Path $DestPath -Destination $backupPath -Force
            }
            Write-Host "  [BACKUP] $(Split-Path -Leaf $DestPath) → $(Split-Path -Leaf $backupPath)" -ForegroundColor Yellow
            $script:stats.BackupsCreated++
        }
        
        # Copy file
        if (-not $DryRun) {
            Copy-Item -Path $SourcePath -Destination $DestPath -Force
        }
        
        if ($fileExists) {
            Write-Host "  [UPDATE] $(Split-Path -Leaf $DestPath)" -ForegroundColor Cyan
            $script:stats.FilesUpdated++
        } else {
            Write-Host "  [NEW] $(Split-Path -Leaf $DestPath)" -ForegroundColor Green
            $script:stats.NewFilesCopied++
        }
        
        return $true
    }
    catch {
        Write-Host "  [ERROR] Failed to copy $(Split-Path -Leaf $SourcePath): $_" -ForegroundColor Red
        $script:stats.Errors++
        return $false
    }
}

# ========================================
# PHASE 1: REFERENCE LIBRARY SYNC
# ========================================

Write-Host "PHASE 1: Reference Library Synchronization" -ForegroundColor Magenta
Write-Host "--------------------------------------------" -ForegroundColor Magenta
Write-Host ""

# 1.1 Copy NEW Agent Files (6 files)
Write-Host "1.1 Copying NEW Agent Files..." -ForegroundColor White
$newAgents = @("analyst.md", "architect.md", "bmad-master.md", "bmad-orchestrator.md", "pm.md", "ux-expert.md")
foreach ($agent in $newAgents) {
    $source = Join-Path "$OriginalBmadPath\bmad-core\agents" $agent
    $dest = Join-Path "$WarpBmadPath\reference\agents" $agent
    Copy-BmadFile -SourcePath $source -DestPath $dest -Backup $false
}
Write-Host ""

# 1.2 Update Existing Agent Files (4 files)
Write-Host "1.2 Updating Existing Agent Files..." -ForegroundColor White
$existingAgents = @("dev.md", "po.md", "qa.md", "sm.md")
foreach ($agent in $existingAgents) {
    $source = Join-Path "$OriginalBmadPath\bmad-core\agents" $agent
    $dest = Join-Path "$WarpBmadPath\reference\agents" $agent
    if (Test-Path $dest) {
        Copy-BmadFile -SourcePath $source -DestPath $dest -Backup $true
    } else {
        Copy-BmadFile -SourcePath $source -DestPath $dest -Backup $false
    }
}
Write-Host ""

# 1.3 Copy ALL Template Files (13 files)
Write-Host "1.3 Copying Template Files..." -ForegroundColor White
$templates = Get-ChildItem -Path "$OriginalBmadPath\bmad-core\templates" -Filter "*.yaml"
foreach ($template in $templates) {
    $dest = Join-Path "$WarpBmadPath\reference\templates" $template.Name
    if (Test-Path $dest) {
        Copy-BmadFile -SourcePath $template.FullName -DestPath $dest -Backup $true
    } else {
        Copy-BmadFile -SourcePath $template.FullName -DestPath $dest -Backup $false
    }
}
Write-Host ""

# 1.4 Copy ALL Workflow Files (6 files)
Write-Host "1.4 Copying Workflow Files..." -ForegroundColor White
$workflows = Get-ChildItem -Path "$OriginalBmadPath\bmad-core\workflows" -Filter "*.yaml"
foreach ($workflow in $workflows) {
    $dest = Join-Path "$WarpBmadPath\reference\workflows" $workflow.Name
    if (Test-Path $dest) {
        Copy-BmadFile -SourcePath $workflow.FullName -DestPath $dest -Backup $true
    } else {
        Copy-BmadFile -SourcePath $workflow.FullName -DestPath $dest -Backup $false
    }
}
Write-Host ""

# 1.5 Verify/Update Task Files (23 files)
Write-Host "1.5 Verifying Task Files..." -ForegroundColor White
$tasks = Get-ChildItem -Path "$OriginalBmadPath\bmad-core\tasks" -Filter "*.md"
foreach ($task in $tasks) {
    $dest = Join-Path "$WarpBmadPath\reference\tasks" $task.Name
    if (Test-Path $dest) {
        # Compare file sizes to detect changes
        $sourceSize = (Get-Item $task.FullName).Length
        $destSize = (Get-Item $dest).Length
        if ($sourceSize -ne $destSize) {
            Copy-BmadFile -SourcePath $task.FullName -DestPath $dest -Backup $true
        } else {
            Write-Host "  [SKIP] $(Split-Path -Leaf $dest) (unchanged)" -ForegroundColor DarkGray
            $script:stats.FilesSkipped++
        }
    } else {
        Copy-BmadFile -SourcePath $task.FullName -DestPath $dest -Backup $false
    }
}
Write-Host ""

# 1.6 Verify/Update Checklist Files (6 files)
Write-Host "1.6 Verifying Checklist Files..." -ForegroundColor White
$checklists = Get-ChildItem -Path "$OriginalBmadPath\bmad-core\checklists" -Filter "*.md"
foreach ($checklist in $checklists) {
    $dest = Join-Path "$WarpBmadPath\reference\checklists" $checklist.Name
    if (Test-Path $dest) {
        $sourceSize = (Get-Item $checklist.FullName).Length
        $destSize = (Get-Item $dest).Length
        if ($sourceSize -ne $destSize) {
            Copy-BmadFile -SourcePath $checklist.FullName -DestPath $dest -Backup $true
        } else {
            Write-Host "  [SKIP] $(Split-Path -Leaf $dest) (unchanged)" -ForegroundColor DarkGray
            $script:stats.FilesSkipped++
        }
    } else {
        Copy-BmadFile -SourcePath $checklist.FullName -DestPath $dest -Backup $false
    }
}
Write-Host ""

# 1.7 Verify/Update Data Files (6 files)
Write-Host "1.7 Verifying Data Files..." -ForegroundColor White
$dataFiles = Get-ChildItem -Path "$OriginalBmadPath\bmad-core\data" -Filter "*.md"
foreach ($dataFile in $dataFiles) {
    $dest = Join-Path "$WarpBmadPath\reference\data" $dataFile.Name
    if (Test-Path $dest) {
        $sourceSize = (Get-Item $dataFile.FullName).Length
        $destSize = (Get-Item $dest).Length
        if ($sourceSize -ne $destSize) {
            Copy-BmadFile -SourcePath $dataFile.FullName -DestPath $dest -Backup $true
        } else {
            Write-Host "  [SKIP] $(Split-Path -Leaf $dest) (unchanged)" -ForegroundColor DarkGray
            $script:stats.FilesSkipped++
        }
    } else {
        Copy-BmadFile -SourcePath $dataFile.FullName -DestPath $dest -Backup $false
    }
}
Write-Host ""

# 1.8 Copy core-config.yaml for reference
Write-Host "1.8 Copying core-config.yaml for reference..." -ForegroundColor White
$coreConfigSource = Join-Path "$OriginalBmadPath\bmad-core" "core-config.yaml"
$coreConfigDest = Join-Path "$WarpBmadPath\reference" "core-config.yaml"
Copy-BmadFile -SourcePath $coreConfigSource -DestPath $coreConfigDest -Backup $true
Write-Host ""

# ========================================
# STATISTICS
# ========================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "SYNCHRONIZATION COMPLETE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Statistics:" -ForegroundColor White
Write-Host "  New Files Copied:    $($stats.NewFilesCopied)" -ForegroundColor Green
Write-Host "  Files Updated:       $($stats.FilesUpdated)" -ForegroundColor Cyan
Write-Host "  Files Skipped:       $($stats.FilesSkipped)" -ForegroundColor DarkGray
Write-Host "  Backups Created:     $($stats.BackupsCreated)" -ForegroundColor Yellow
Write-Host "  Errors:              $($stats.Errors)" -ForegroundColor Red
Write-Host ""

if ($DryRun) {
    Write-Host "This was a DRY RUN - no files were actually modified." -ForegroundColor Yellow
    Write-Host "Run without -DryRun parameter to apply changes." -ForegroundColor Yellow
} else {
    Write-Host "Next Steps:" -ForegroundColor White
    Write-Host "  1. Review backed up files (.backup-* files)" -ForegroundColor Gray
    Write-Host "  2. Run Phase 2: Update global-bmad-rules.md" -ForegroundColor Gray
    Write-Host "  3. Run Phase 3: Create terminal agent files" -ForegroundColor Gray
}

Write-Host ""
Write-Host "PHASE 1 COMPLETE [OK]" -ForegroundColor Green
Write-Host ""

# Return statistics for automation
return $stats
