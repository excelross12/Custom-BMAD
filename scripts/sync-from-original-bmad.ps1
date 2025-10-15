# Sync WARP-BMAD with Original BMAD Method
# Updates reference files from Original BMAD to WARP-BMAD

param(
    [string]$OriginalBmadPath = "C:\Users\AGC-Inventory\Desktop\BMAD-METHOD-4.44.1\bmad-core",
    [switch]$DryRun = $false
)

Write-Host "`n╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║" -ForegroundColor Cyan -NoNewline
Write-Host "                WARP-BMAD SYNC FROM ORIGINAL BMAD                         " -ForegroundColor White -NoNewline
Write-Host "║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

$WarpBmadRoot = Split-Path -Parent $PSScriptRoot

# Verify Original BMAD exists
if (-not (Test-Path $OriginalBmadPath)) {
    Write-Host "`n❌ ERROR: Original BMAD not found at: $OriginalBmadPath" -ForegroundColor Red
    Write-Host "   Please update the path or use -OriginalBmadPath parameter" -ForegroundColor Yellow
    exit 1
}

Write-Host "`n✅ Original BMAD found: $OriginalBmadPath" -ForegroundColor Green
Write-Host "✅ WARP-BMAD root: $WarpBmadRoot" -ForegroundColor Green

if ($DryRun) {
    Write-Host "`n⚠️  DRY RUN MODE - No files will be modified" -ForegroundColor Yellow
}

Write-Host "`n📦 SYNCING REFERENCE FILES..." -ForegroundColor Cyan

# Define sync mappings
$SyncMappings = @(
    @{
        Source = "$OriginalBmadPath\checklists"
        Destination = "$WarpBmadRoot\reference\checklists"
        FilePattern = "*.md"
        Description = "Checklists"
    },
    @{
        Source = "$OriginalBmadPath\tasks"
        Destination = "$WarpBmadRoot\reference\tasks"
        FilePattern = "*.md"
        Description = "Tasks"
    },
    @{
        Source = "$OriginalBmadPath\templates"
        Destination = "$WarpBmadRoot\reference\templates"
        FilePattern = "*.yaml"
        Description = "Templates"
    },
    @{
        Source = "$OriginalBmadPath\workflows"
        Destination = "$WarpBmadRoot\reference\workflows"
        FilePattern = "*.yaml"
        Description = "Workflows"
    },
    @{
        Source = "$OriginalBmadPath\data"
        Destination = "$WarpBmadRoot\reference\data"
        FilePattern = "*.md"
        Description = "Data/Knowledge Base"
    }
)

$TotalSynced = 0
$TotalSkipped = 0

foreach ($mapping in $SyncMappings) {
    Write-Host "`n📁 $($mapping.Description):" -ForegroundColor Cyan
    
    if (-not (Test-Path $mapping.Source)) {
        Write-Host "   ⚠️  Source not found: $($mapping.Source)" -ForegroundColor Yellow
        continue
    }
    
    $files = Get-ChildItem -Path $mapping.Source -Filter $mapping.FilePattern
    
    foreach ($file in $files) {
        $destFile = Join-Path $mapping.Destination $file.Name
        
        if (Test-Path $destFile) {
            $sourceHash = (Get-FileHash $file.FullName).Hash
            $destHash = (Get-FileHash $destFile).Hash
            
            if ($sourceHash -ne $destHash) {
                Write-Host "   📝 Updated: $($file.Name)" -ForegroundColor Yellow
                if (-not $DryRun) {
                    Copy-Item $file.FullName $destFile -Force
                }
                $TotalSynced++
            } else {
                Write-Host "   ✓ Current: $($file.Name)" -ForegroundColor Gray
                $TotalSkipped++
            }
        } else {
            Write-Host "   ➕ New: $($file.Name)" -ForegroundColor Green
            if (-not $DryRun) {
                Copy-Item $file.FullName $destFile
            }
            $TotalSynced++
        }
    }
}

Write-Host "`n📊 SYNC SUMMARY:" -ForegroundColor Cyan
Write-Host "   Files synced: $TotalSynced" -ForegroundColor $(if ($TotalSynced -gt 0) { "Green" } else { "Gray" })
Write-Host "   Files current: $TotalSkipped" -ForegroundColor Gray

if ($TotalSynced -gt 0) {
    Write-Host "`n⚠️  IMPORTANT: Review global-bmad-rules.md" -ForegroundColor Yellow
    Write-Host "   If reference files changed significantly, you may need to update:" -ForegroundColor Yellow
    Write-Host "   - warp-rules/global-bmad-rules.md" -ForegroundColor White
    Write-Host "   - Reference sections in documentation" -ForegroundColor White
}

Write-Host "`n✅ SYNC COMPLETE!" -ForegroundColor Green

if ($DryRun) {
    Write-Host "`n💡 Run without -DryRun to apply changes" -ForegroundColor Cyan
}

Write-Host ""
