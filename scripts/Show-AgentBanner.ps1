<#
.SYNOPSIS
    Display colorful agent identification banners in terminal

.DESCRIPTION
    Creates visual banners to identify which BMAD agent is currently active.
    Each agent has its own color scheme and icon for easy identification.

.PARAMETER AgentName
    Name of the agent (e.g., "Developer", "Product Manager", "Analyst")

.PARAMETER AgentIcon
    Emoji icon representing the agent (e.g., 💻, 📋, 🔍)

.PARAMETER AgentRole
    Role description or persona name (e.g., "James", "Full Stack Developer")

.PARAMETER AgentId
    Short identifier for the agent (e.g., "dev", "pm", "analyst")

.EXAMPLE
    Show-AgentBanner -AgentName "Developer" -AgentIcon "💻" -AgentRole "James - Full Stack Developer" -AgentId "dev"

.EXAMPLE
    Show-AgentBanner -AgentName "Product Manager" -AgentIcon "📋" -AgentRole "John" -AgentId "pm"

.NOTES
    File Name: Show-AgentBanner.ps1
    Author: BMAD System
    Version: 1.0
#>

function Show-AgentBanner {
    param(
        [Parameter(Mandatory=$true)]
        [string]$AgentName,
        
        [Parameter(Mandatory=$true)]
        [string]$AgentIcon,
        
        [Parameter(Mandatory=$false)]
        [string]$AgentRole = "",
        
        [Parameter(Mandatory=$false)]
        [string]$AgentId = ""
    )
    
    # Color scheme mapping per agent
    $colorSchemes = @{
        'analyst'     = @{ Primary = 'Cyan';    Secondary = 'DarkCyan';   Border = 'Blue' }
        'pm'          = @{ Primary = 'Magenta'; Secondary = 'DarkMagenta'; Border = 'Magenta' }
        'architect'   = @{ Primary = 'Blue';    Secondary = 'DarkBlue';   Border = 'Cyan' }
        'ux-expert'   = @{ Primary = 'Magenta'; Secondary = 'DarkMagenta'; Border = 'Magenta' }
        'po'          = @{ Primary = 'Yellow';  Secondary = 'DarkYellow'; Border = 'Yellow' }
        'sm'          = @{ Primary = 'Green';   Secondary = 'DarkGreen';  Border = 'Green' }
        'dev'         = @{ Primary = 'Green';   Secondary = 'DarkGreen';  Border = 'Cyan' }
        'qa'          = @{ Primary = 'Yellow';  Secondary = 'DarkYellow'; Border = 'Yellow' }
        'master'      = @{ Primary = 'White';   Secondary = 'Gray';       Border = 'White' }
        'orchestrator'= @{ Primary = 'Cyan';    Secondary = 'DarkCyan';   Border = 'Blue' }
    }
    
    # Determine colors
    $colors = if ($AgentId -and $colorSchemes.ContainsKey($AgentId.ToLower())) {
        $colorSchemes[$AgentId.ToLower()]
    } else {
        @{ Primary = 'Cyan'; Secondary = 'DarkCyan'; Border = 'Blue' }
    }
    
    # Get timestamp
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Calculate padding
    $maxWidth = 70
    $titleText = "  $AgentIcon  $AgentName  "
    $titleLength = $titleText.Length
    $padding = [Math]::Max(0, ($maxWidth - $titleLength) / 2)
    $leftPad = " " * [Math]::Floor($padding)
    $rightPad = " " * [Math]::Ceiling($padding)
    
    # Create banner
    Write-Host ""
    Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor $colors.Border
    Write-Host "║                                                                  ║" -ForegroundColor $colors.Border
    Write-Host "║$leftPad$titleText$rightPad║" -ForegroundColor $colors.Primary -NoNewline
    Write-Host "" -ForegroundColor $colors.Border
    Write-Host "║                                                                  ║" -ForegroundColor $colors.Border
    
    if ($AgentRole) {
        $roleText = "  $AgentRole  "
        $roleLength = $roleText.Length
        $rolePadding = [Math]::Max(0, ($maxWidth - $roleLength) / 2)
        $roleLeftPad = " " * [Math]::Floor($rolePadding)
        $roleRightPad = " " * [Math]::Ceiling($rolePadding)
        Write-Host "║$roleLeftPad$roleText$roleRightPad║" -ForegroundColor $colors.Secondary -NoNewline
        Write-Host "" -ForegroundColor $colors.Border
        Write-Host "║                                                                  ║" -ForegroundColor $colors.Border
    }
    
    # Timestamp
    $tsText = "  $timestamp  "
    $tsLength = $tsText.Length
    $tsPadding = [Math]::Max(0, ($maxWidth - $tsLength) / 2)
    $tsLeftPad = " " * [Math]::Floor($tsPadding)
    $tsRightPad = " " * [Math]::Ceiling($tsPadding)
    Write-Host "║$tsLeftPad$tsText$tsRightPad║" -ForegroundColor Gray -NoNewline
    Write-Host "" -ForegroundColor $colors.Border
    
    Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor $colors.Border
    Write-Host ""
}

# Export function
Export-ModuleMember -Function Show-AgentBanner

# Examples (only run when script is executed directly, not imported)
if ($MyInvocation.InvocationName -ne '.') {
    Write-Host "BMAD Agent Banner Display Utility" -ForegroundColor Cyan
    Write-Host "=================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage Examples:" -ForegroundColor Yellow
    Write-Host ""
    
    Write-Host "1. Import and use in PowerShell:" -ForegroundColor Green
    Write-Host '   . .\Show-AgentBanner.ps1' -ForegroundColor Gray
    Write-Host '   Show-AgentBanner -AgentName "Developer" -AgentIcon "💻" -AgentRole "James - Full Stack Developer" -AgentId "dev"' -ForegroundColor Gray
    Write-Host ""
    
    Write-Host "2. Direct execution:" -ForegroundColor Green
    Write-Host '   .\Show-AgentBanner.ps1 -AgentName "Product Manager" -AgentIcon "📋" -AgentRole "John" -AgentId "pm"' -ForegroundColor Gray
    Write-Host ""
    
    Write-Host "3. All BMAD Agents:" -ForegroundColor Green
    Write-Host ""
    
    # Show all agent examples
    $agents = @(
        @{ Name = "Business Analyst"; Icon = "🔍"; Role = "Mary - Strategic Analyst"; Id = "analyst" }
        @{ Name = "Product Manager"; Icon = "📋"; Role = "John - Product Strategist"; Id = "pm" }
        @{ Name = "Architect"; Icon = "🏛️"; Role = "System Architect"; Id = "architect" }
        @{ Name = "UX Expert"; Icon = "🎨"; Role = "UI/UX Designer"; Id = "ux-expert" }
        @{ Name = "Product Owner"; Icon = "🗂️"; Role = "Document Manager"; Id = "po" }
        @{ Name = "Scrum Master"; Icon = "🔁"; Role = "Story Creator"; Id = "sm" }
        @{ Name = "Developer"; Icon = "💻"; Role = "James - Full Stack Dev"; Id = "dev" }
        @{ Name = "QA Engineer"; Icon = "✅"; Role = "Quality Assurance"; Id = "qa" }
        @{ Name = "BMAD Master"; Icon = "🧠"; Role = "General Guidance"; Id = "master" }
        @{ Name = "Orchestrator"; Icon = "🎛️"; Role = "Workflow Coordinator"; Id = "orchestrator" }
    )
    
    foreach ($agent in $agents) {
        Start-Sleep -Milliseconds 300
        Show-AgentBanner -AgentName $agent.Name -AgentIcon $agent.Icon -AgentRole $agent.Role -AgentId $agent.Id
    }
}
