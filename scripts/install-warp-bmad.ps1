# WARP-BMAD Installation Script
# Automated installation for Warp Terminal

param(
    [string]$ProjectPath = (Get-Location).Path,
    [switch]$Force
)

Write-Host "Installing WARP-BMAD..." -ForegroundColor Cyan

# 1. Copy WARP.md to project
if (Test-Path "$ProjectPath\WARP.md" -and -not $Force) {
    Write-Warning "WARP.md already exists. Use -Force to overwrite."
} else {
    Copy-Item "C:\Users\AGC-Inventory\Desktop\WARP-BMAD\warp-rules\WARP.md" -Destination "$ProjectPath\WARP.md"
    Write-Host "âœ“ Copied WARP.md to project" -ForegroundColor Green
}

# 2. Create docs structure
$DocsPath = Join-Path $ProjectPath "docs"
@("epics", "stories", "qa\assessments", "qa\gates") | ForEach-Object {
    $Path = Join-Path $DocsPath $_
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -ItemType Directory -Force | Out-Null
    }
}
Write-Host "âœ“ Created docs structure" -ForegroundColor Green

# 3. Instructions for Global Rules
Write-Host "
ðŸ“‹ Next Steps:" -ForegroundColor Yellow
Write-Host "1. Open Warp Terminal"
Write-Host "2. Go to Settings > AI > Knowledge > Manage Rules"
Write-Host "3. Add Global Rule:"
Write-Host "   Name: BMAD Method"
Write-Host "   Content: Copy from C:\Users\AGC-Inventory\Desktop\WARP-BMAD\warp-rules\global-bmad-rules.md"
Write-Host "4. In your project, run: /init"
Write-Host "
âœ“ Installation complete!" -ForegroundColor Green
