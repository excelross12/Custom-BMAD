<#
.SYNOPSIS
    BMAD Project File Watcher - Monitors docs folder for changes and updates signal file

.DESCRIPTION
    Watches the docs folder (and subdirectories) for .md file changes and updates
    a signal file (.refresh-signal.json) that the dashboard polls for instant refresh.

.PARAMETER ProjectPath
    Full path to the BMAD project directory (containing the docs folder)

.EXAMPLE
    .\watch-bmad-project.ps1 -ProjectPath "C:\Users\Me\MyProject"

.NOTES
    File Name: watch-bmad-project.ps1
    Author: BMAD System
    Version: 1.0
    Press Ctrl+C to stop watching
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectPath
)

# Validate project path
if (-not (Test-Path $ProjectPath)) {
    Write-Host "❌ Error: Project path does not exist: $ProjectPath" -ForegroundColor Red
    exit 1
}

$docsPath = Join-Path $ProjectPath "docs"
if (-not (Test-Path $docsPath)) {
    Write-Host "❌ Error: docs folder not found in: $ProjectPath" -ForegroundColor Red
    exit 1
}

$signalFile = Join-Path $docsPath ".refresh-signal.json"

# Initialize signal file
$initialSignal = @{
    timestamp = (Get-Date).ToString("o")
    eventType = "Initialized"
    fileName = ""
    filePath = ""
    watcherStarted = $true
} | ConvertTo-Json

Set-Content -Path $signalFile -Value $initialSignal -Force

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║         🔄 BMAD Project File Watcher - ACTIVE 🔄          ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "📁 Watching: $docsPath" -ForegroundColor Green
Write-Host "📡 Signal File: $signalFile" -ForegroundColor Green
Write-Host "🎯 Monitoring .md files in docs/, epics/, and stories/" -ForegroundColor Yellow
Write-Host ""
Write-Host "✨ Dashboard will auto-refresh when files are created/modified/deleted" -ForegroundColor Magenta
Write-Host "⏸️  Press Ctrl+C to stop watching..." -ForegroundColor Gray
Write-Host ""

# Create FileSystemWatcher
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $docsPath
$watcher.Filter = "*.md"
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

# Define event action
$action = {
    param($source, $e)
    
    $eventType = $e.ChangeType
    $fileName = $e.Name
    $filePath = $e.FullPath
    $relativePath = $filePath.Replace($docsPath, "docs").Replace("\", "/")
    
    # Prepare signal data
    $signal = @{
        timestamp = (Get-Date).ToString("o")
        eventType = $eventType.ToString()
        fileName = $fileName
        filePath = $relativePath
    } | ConvertTo-Json
    
    # Write signal file
    try {
        Set-Content -Path $signalFile -Value $signal -Force
        
        # Console output with color
        $timeStamp = Get-Date -Format "HH:mm:ss"
        $icon = switch ($eventType) {
            'Created' { '➕'; break }
            'Changed' { '📝'; break }
            'Deleted' { '🗑️'; break }
            default { '🔄' }
        }
        
        $color = switch ($eventType) {
            'Created' { 'Green'; break }
            'Changed' { 'Yellow'; break }
            'Deleted' { 'Red'; break }
            default { 'White' }
        }
        
        Write-Host "[$timeStamp] $icon $eventType : $relativePath" -ForegroundColor $color
    }
    catch {
        Write-Host "⚠️ Error writing signal file: $_" -ForegroundColor Red
    }
}

# Register event handlers
$onCreate = Register-ObjectEvent -InputObject $watcher -EventName Created -Action $action
$onChange = Register-ObjectEvent -InputObject $watcher -EventName Changed -Action $action
$onDelete = Register-ObjectEvent -InputObject $watcher -EventName Deleted -Action $action
$onRename = Register-ObjectEvent -InputObject $watcher -EventName Renamed -Action $action

# Cleanup function
$cleanup = {
    Write-Host ""
    Write-Host "🛑 Stopping file watcher..." -ForegroundColor Yellow
    
    # Unregister events
    Unregister-Event -SourceIdentifier $onCreate.Name -ErrorAction SilentlyContinue
    Unregister-Event -SourceIdentifier $onChange.Name -ErrorAction SilentlyContinue
    Unregister-Event -SourceIdentifier $onDelete.Name -ErrorAction SilentlyContinue
    Unregister-Event -SourceIdentifier $onRename.Name -ErrorAction SilentlyContinue
    
    # Dispose watcher
    $watcher.EnableRaisingEvents = $false
    $watcher.Dispose()
    
    Write-Host "✅ File watcher stopped cleanly" -ForegroundColor Green
    exit 0
}

# Register Ctrl+C handler
[Console]::TreatControlCAsInput = $false
$null = Register-EngineEvent -SourceIdentifier PowerShell.Exiting -Action $cleanup

# Keep script running
try {
    while ($true) {
        Start-Sleep -Seconds 1
    }
}
catch {
    & $cleanup
}
finally {
    & $cleanup
}
