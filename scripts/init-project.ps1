# Initialize BMAD Project in Warp

param([string]$ProjectPath = (Get-Location).Path)

Write-Host "Initializing BMAD project..." -ForegroundColor Cyan

# Create directory structure
$Dirs = @("docs/prd", "docs/architecture", "docs/epics", "docs/stories", "docs/qa", "src", "tests")
foreach ($Dir in $Dirs) {
    $FullPath = Join-Path $ProjectPath $Dir
    if (-not (Test-Path $FullPath)) {
        New-Item -Path $FullPath -ItemType Directory -Force | Out-Null
    }
}

# Create .current-story tracker
"" | Out-File -FilePath (Join-Path $ProjectPath "docs\stories\.current-story")

Write-Host "âœ“ Project structure created" -ForegroundColor Green
Write-Host "âœ“ Ready for BMAD development!" -ForegroundColor Green
