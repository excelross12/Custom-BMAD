# BMAD Framework - Installation Validation Script
# Validates that BMAD framework is properly installed in project

$ErrorCount = 0

Write-Host "`n================================" -ForegroundColor Cyan
Write-Host "BMAD Installation Validator" -ForegroundColor Cyan
Write-Host "================================`n" -ForegroundColor Cyan

# Check critical files
$RequiredFiles = @(
    "docs\global-bmad-rules.md",
    "docs\BMAD.md",
    "docs\README.md",
    "docs\bmad-dashboard.html",
    "README.md"
)

Write-Host "Checking critical files..." -ForegroundColor Yellow
foreach ($file in $RequiredFiles) {
    if (Test-Path $file) {
        Write-Host "  [OK] $file" -ForegroundColor Green
    } else {
        Write-Host "  [MISSING] $file" -ForegroundColor Red
        $ErrorCount++
    }
}

# Check directory structure
$RequiredDirs = @("docs", "reference", "scripts")

Write-Host "`nChecking directory structure..." -ForegroundColor Yellow
foreach ($dir in $RequiredDirs) {
    if (Test-Path $dir -PathType Container) {
        Write-Host "  [OK] $dir\" -ForegroundColor Green
    } else {
        Write-Host "  [MISSING] $dir\" -ForegroundColor Red
        $ErrorCount++
    }
}

# Check if dashboard can be opened
Write-Host "`nChecking dashboard..." -ForegroundColor Yellow
if (Test-Path "docs\bmad-dashboard.html") {
    Write-Host "  [OK] Dashboard HTML exists" -ForegroundColor Green
    Write-Host "  [INFO] Open with: Start-Process docs\bmad-dashboard.html" -ForegroundColor Cyan
} else {
    Write-Host "  [MISSING] Dashboard not found" -ForegroundColor Red
    $ErrorCount++
}

# Final result
Write-Host "`n================================" -ForegroundColor Cyan
if ($ErrorCount -eq 0) {
    Write-Host "VALIDATION PASSED" -ForegroundColor Green
    Write-Host "================================`n" -ForegroundColor Cyan
    Write-Host "All required files and folders present!" -ForegroundColor Green
    Write-Host "`nNext Steps:" -ForegroundColor Yellow
    Write-Host "  1. Open dashboard: Start-Process docs\bmad-dashboard.html" -ForegroundColor White
    Write-Host "  2. Read README: cat README.md" -ForegroundColor White
    Write-Host "  3. Start using BMAD with your AI assistant!`n" -ForegroundColor White
} else {
    Write-Host "VALIDATION FAILED" -ForegroundColor Red
    Write-Host "================================`n" -ForegroundColor Cyan
    Write-Host "Found $ErrorCount missing file(s) or folder(s)." -ForegroundColor Red
    Write-Host "Please ensure all BMAD framework files are present.`n" -ForegroundColor Yellow
}
