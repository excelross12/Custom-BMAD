# BMAD Dashboard v10 - Feature Guide

**Version**: 10.0  
**Last Updated**: October 18, 2025  
**New Features**: Phase-Based Workflow, Hybrid Auto-Refresh, Full Path Display, Manual Refresh, Agent Icons

---

## 🎯 What's New in v10

### 1. Phase-Based Workflow Organization

The workflow panel now organizes your project files according to the BMAD methodology phases:

#### 📊 **Discovery Phase** (Blue)
- **Files**: brainstorming-session.md, project-brief.md, market-research.md
- **Purpose**: Initial research, brainstorming, and project discovery
- **Status**: Shows completion percentage and file count

#### 📋 **Planning Phase** (Purple)
- **Files**: prd.md, architecture.md, front-end-spec.md
- **Purpose**: Detailed planning, requirements, and design specifications
- **Status**: Real-time progress tracking

#### 💻 **Development Phase** (Green)
- **Files**: All epics and stories (organized by epic number)
- **Purpose**: Implementation and feature development
- **Organization**: 
  - Epic 001 → Story files → Substories
  - Epic 002 → Story files → Substories
  - Hierarchical nesting for easy navigation

#### ✅ **Testing Phase** (Orange)
- **Files**: QA reports, test results, quality gates
- **Purpose**: Quality assurance and validation
- **Status**: Coverage and quality metrics

### 2. Enhanced Visual Features

#### Collapsible Sections
- Click any phase header to expand/collapse
- Smooth animations and transitions
- Preserves state during navigation

#### Progress Indicators
- Color-coded progress bars per phase
- File count and completion percentage
- Status badges: 🟢 Complete, 🟡 In Progress, ⚪ Not Started

#### Smart Icons
- Unique icons for each file type:
  - 💡 Brainstorming sessions
  - 📄 Project briefs
  - 📊 Market research
  - 📝 PRD and epics
  - 🏛️ Architecture docs
  - 🎨 UI/UX specifications
  - 📋 Substories

---

## 🔄 Hybrid Auto-Refresh System

### How It Works

The dashboard uses a **dual-mode refresh system** for optimal performance:

#### **Mode 1: Signal File Polling** (Fast - 1 second)
- Monitors `.refresh-signal.json` in your project's docs folder
- Instant updates when PowerShell watcher is running
- Shows detailed event notifications:
  - ➕ New file detected
  - 📝 File modified
  - 🗑️ File deleted

#### **Mode 2: Directory Scanning** (Fallback - 5 seconds)
- Automatic fallback if watcher isn't running
- Scans all .md files in docs/, epics/, and stories/
- Compares file sizes and modification times
- Updates dashboard when changes detected

### Setting Up Auto-Refresh

#### Option A: With PowerShell Watcher (Recommended)

1. **Start the file watcher:**
   ```powershell
   cd Custom-BMAD\scripts
   .\watch-bmad-project.ps1 -ProjectPath "C:\Users\YourName\YourProject"
   ```

2. **Open the dashboard:**
   - Open `Custom-BMAD\docs\bmad-dashboard.html` in your browser
   - Select your project directory
   - Dashboard will now receive instant updates!

3. **Watcher Features:**
   - Color-coded console output
   - Real-time event logging
   - Press Ctrl+C to stop gracefully

#### Option B: Browser-Only Mode

Simply open the dashboard and select your project. The fallback scanner will automatically detect changes every 5 seconds.

---

## 📁 Full Path Display

### Multiple Display Locations

Your project's full path is now visible in:

1. **Header Bar**: Shows complete path after "Full Path:" label
2. **Sidebar Badge**: Shows folder name at the top
3. **Project Details Panel**: 
   - Project Name (folder name)
   - Full Path (complete directory path in monospace)
   - Last Updated file info
   - Update timestamp

### Path Handling

- Automatically resolves full paths from directory picker
- Handles long paths with proper text wrapping
- Scrollable if path exceeds panel width
- Monospace font for easy readability

---

## 🔄 Manual Refresh Button

### Usage

- **Location**: Header bar, next to "📁 Select Project" button
- **Visibility**: Appears only after a project is selected
- **Action**: Click to force immediate refresh

### What Gets Refreshed

1. Re-scans entire docs directory
2. Updates all file counts and phases
3. Recalculates completion percentages
4. Re-renders current view
5. Shows success notification

### When to Use

- After creating files outside the browser
- If auto-refresh seems delayed
- To ensure latest data is displayed
- After bulk file operations

---

## 🎨 Agent Icons

### Icon Mapping

All 14 BMAD agents now have unique visual identifiers:

| Agent | Icon | Color Scheme |
|-------|------|--------------|
| **Analyst** (Mary) | 🔍 | Cyan/Blue |
| **Product Manager** (John) | 📋 | Magenta |
| **Architect** (Winston) | 🏛️ | Blue |
| **UX Expert** (Sally) | 🎨 | Magenta |
| **Product Owner** (Sarah) | 🗂️ | Yellow |
| **Scrum Master** (Bob) | 🔁 | Green |
| **Developer** (James) | 💻 | Green/Cyan |
| **QA** (Quinn) | ✅ | Yellow |
| **BMAD Master** | 🧠 | White/Gray |
| **Orchestrator** | 🎛️ | Cyan |

### Terminal Integration

Use the agent banner script to display agent identity:

```powershell
# Import the function
. .\Custom-BMAD\scripts\Show-AgentBanner.ps1

# Display Developer banner
Show-AgentBanner -AgentName "Developer" -AgentIcon "💻" -AgentRole "James - Full Stack Developer" -AgentId "dev"
```

**Output Example:**
```
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║                  💻  Developer                                   ║
║                                                                  ║
║             James - Full Stack Developer                         ║
║                                                                  ║
║                  2025-10-18 15:30:00                            ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## 🚀 Performance Optimizations

### Smart Caching
- File contents cached in memory
- Only re-reads modified files
- Snapshot-based change detection

### Efficient Updates
- Updates only affected UI sections
- Smooth CSS transitions
- No full page reloads

### Large Project Support
- Handles 100+ files efficiently
- Progressive rendering
- Minimal memory footprint

---

## 🔧 Troubleshooting

### Auto-Refresh Not Working

**Symptom**: Dashboard doesn't update when files change

**Solutions**:
1. Check if file watcher is running:
   ```powershell
   # Should see colorful output with file events
   .\watch-bmad-project.ps1 -ProjectPath "your\project\path"
   ```

2. Verify signal file exists:
   ```powershell
   # Check for .refresh-signal.json in docs folder
   ls your\project\docs\.refresh-signal.json
   ```

3. Check browser console for errors:
   - Press F12 in browser
   - Look for JavaScript errors
   - Check for file access permissions

4. Try manual refresh:
   - Click the 🔄 Refresh button
   - Should work even if auto-refresh fails

### Phase Not Showing Files

**Symptom**: A phase section is empty or missing

**Causes**:
- Files not in expected location (must be in `docs/` folder)
- File naming doesn't match expected patterns
- Files not yet scanned (wait 5 seconds or manual refresh)

**Solution**:
- Ensure files follow naming conventions:
  - `brainstorming-session.md`
  - `project-brief.md`
  - `prd.md`
  - `architecture.md`
  - `front-end-spec.md`
  - `epic-XXX-*.md` (in docs/epics/)
  - `story-XXX-*.md` (in docs/stories/)

### Full Path Not Displaying

**Symptom**: Path shows only folder name

**Causes**:
- Browser security restrictions
- Path resolution failed
- Old browser version

**Solution**:
- Try Chrome/Edge (best File System API support)
- Manually check "Project Details" panel for full path
- Worst case: path will show folder name (still functional)

### Watcher Stops After Idle

**Symptom**: File watcher terminates unexpectedly

**Solution**:
- PowerShell execution policy issue:
  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  ```
- Run in dedicated terminal window
- Check for system sleep/hibernate settings

---

## 📊 Best Practices

### For Optimal Performance

1. **Keep Watcher Running**: Start watcher at beginning of work session
2. **Use Manual Refresh Sparingly**: Let auto-refresh do its job
3. **Organize Files Properly**: Follow BMAD naming conventions
4. **Monitor Console**: Watch watcher output for file events

### For Team Collaboration

1. **Share Watcher Script**: Team members can run their own watchers
2. **Standardize Paths**: Use consistent project structure
3. **Document Phases**: Keep files in correct phase folders
4. **Use Progress Tracking**: Check phase completion regularly

### For Large Projects

1. **Organize by Epic**: Keep stories grouped with their epics
2. **Archive Completed**: Move done epics to archive folder
3. **Regular Cleanup**: Remove obsolete files
4. **Monitor Performance**: Watch for slow scans (100+ files)

---

## 🎯 Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Click Phase Header` | Expand/Collapse phase |
| `Click File` | Open file in content panel |
| `Manual Refresh Button` | Force refresh |
| `Ctrl+F` (in browser) | Search within dashboard |

---

## 📈 Future Enhancements

Planned features for v11:
- Search/filter across all files
- Tagging and custom categories
- File history and versions
- Export reports per phase
- Team activity timeline
- Integration with Git commits

---

## 🆘 Support

If you encounter issues:

1. **Check this guide** - Most common issues covered
2. **Review console logs** - F12 in browser
3. **Test manual refresh** - Isolates auto-refresh issues
4. **Restart watcher** - Ctrl+C then restart script
5. **Clear cache** - Ctrl+Shift+R in browser

---

**BMAD Dashboard v10** - Built with ❤️ for the BMAD Method™  
**Updated**: October 18, 2025
