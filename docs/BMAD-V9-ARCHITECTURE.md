# 🏗️ BMAD Dashboard v9 - Architecture & Technical Specification

**Version**: 9.0.0  
**Status**: Architecture Ready  
**Type**: Major Enhancement Release

---

## 🎯 Requirements Analysis

### From v8 Issues
1. **Analysis Menu** - Currently separate, should integrate into WorkTree
2. **Preview Panel** - Cards overlapping, layout broken
3. **Project Display** - Should show on successful load
4. **Auto-Refresh** - No monitoring for new/modified files
5. **Project Details** - Missing directory info and timestamps

### New Features to Implement
✅ WorkTree-based Analysis integration  
✅ Fixed preview panel layout  
✅ Project directory display  
✅ Auto-refresh on file changes  
✅ Project details section  

---

## 🏛️ System Architecture

### Layout Structure (v9)

```
┌─────────────────────────────────────────────────────────────────┐
│  HEADER: Title | Path Display | Status | Select Project         │
├──────────────┬──────────────────────────────┬──────────────────┤
│              │                              │                  │
│   SIDEBAR    │      MAIN CONTENT PANEL      │   PREVIEW PANEL  │
│              │                              │   (Fixed Layout) │
│ 🔄 Workflow  │  ┌────────────────────────┐  │                  │
│ 📊 Overview  │  │                        │  │ ┌──────────────┐ │
│ 📈 Analysis  │  │  Markdown Content      │  │ │ File Info    │ │
│ 📋 PRD       │  │  (Auto-refreshing)     │  │ │              │ │
│ 📂 Others    │  │                        │  │ │ Stats        │ │
│              │  │                        │  │ │              │ │
│ PROJECT      │  │                        │  │ │ Complexity   │ │
│ DETAILS      │  │                        │  │ │              │ │
│              │  │                        │  │ │ Actions      │ │
│              │  └────────────────────────┘  │ └──────────────┘ │
└──────────────┴──────────────────────────────┴──────────────────┘

Sidebar Width: 280px (fixed)
Preview Width: 320px (fixed)
Content: Flexible
```

### Component Hierarchy

```
Dashboard
├── Header
│   ├── Title
│   ├── Project Path Display (NEW)
│   ├── Status Badge
│   └── Select Project Button
│
├── Sidebar
│   ├── Logo & Status
│   ├── Project Path Display (NEW)
│   ├── Search Box
│   ├── Navigation Menu
│   │   ├── 🔄 Workflow (16)
│   │   ├── 📊 Overview
│   │   ├── 📈 Analysis (integrated into WorkTree)
│   │   ├── 📋 PRD
│   │   └── 📂 Others
│   │
│   └── PROJECT DETAILS (NEW)
│       ├── 📁 Directory
│       ├── 📝 Last Updated
│       ├── ⏰ Time Log
│       └── 🔄 Auto-Refresh Status
│
├── Content Panel
│   ├── Workflow Tree (with Analysis integrated)
│   ├── Markdown Content Display
│   └── Auto-Refresh Monitor
│
└── Preview Panel (FIXED LAYOUT)
    ├── File Info Section
    ├── Stats Grid
    ├── Complexity Section
    ├── Actions Buttons
    └── Proper Spacing/No Overlap
```

---

## 🔄 WorkTree Analysis Integration

### Current (v8)
```
Left Sidebar:
- 🔄 Workflow (16)
- 📊 Overview
- 📈 Analysis (separate section)
- 📋 PRD
- 📂 Others

Problem: Click Analysis → separate view → click file → view file
```

### New (v9)
```
Left Sidebar:
- 🔄 Workflow (16)
  - 📁 Epic 001 ✓
  - 📝 story-001-001 ✓
  - 📈 Analysis Files (3)  ← Integrated here
    - 📄 prd.md
    - 📄 architecture.md
    - 📄 front-end-spec.md
- 📊 Overview
- 📋 PRD
- 📂 Others

Benefit: Single click on Analysis file → view directly
```

### Implementation Logic

```javascript
renderWorkflowTree() {
    // Render Epics and Stories
    renderEpics();
    
    // NEW: Add Analysis section to WorkTree
    renderAnalysisSection(); // Inside tree, not separate
    
    // Render Other files
    renderOthersSection();
}

// Analysis integrated as collapsible section in tree
<div class="analysis-section-in-tree">
    <span class="toggle">📈 Analysis Files (${count})</span>
    <div class="analysis-items">
        // List analysis files
    </div>
</div>
```

---

## 🎨 Preview Panel Layout Fix

### Current (v8) - BROKEN
```
┌──────────────────┐
│ FILE INFO        │  ← Card 1
├──────────────────┤
│ STATS            │  ← Card 2 (overlaps)
├──────────────────┤
│ COMPLEXITY       │  ← Card 3 (overlaps)
├──────────────────┤
│ ACTIONS          │  ← Card 4 (overlaps)
└──────────────────┘

Problem: Cards overlap, scrolling issues
```

### New (v9) - FIXED
```
┌──────────────────┐
│ FILE INFO        │ ← 80px
├──────────────────┤
│ STATS            │ ← 100px
├──────────────────┤
│ COMPLEXITY       │ ← 80px
├──────────────────┤
│ ACTIONS          │ ← 70px
├──────────────────┤
│ (Scroll Area)    │ ← Remaining space
└──────────────────┘

Solution: Fixed heights, proper gap, scrollable
```

### CSS Solution

```css
.preview-panel {
    width: 320px;
    min-width: 320px;
    max-width: 320px;
    background: #141824;
    padding: 15px;
    overflow-y: auto;
    border-left: 1px solid rgba(102, 126, 234, 0.2);
    display: flex;
    flex-direction: column;
    gap: 12px; /* Clear spacing between sections */
}

.preview-section {
    flex-shrink: 0; /* Don't shrink sections */
    background: rgba(102, 126, 234, 0.1);
    border: 1px solid rgba(102, 126, 234, 0.2);
    border-radius: 8px;
    padding: 12px;
    border-left: 3px solid #667eea;
    min-height: auto; /* Let content determine height */
}

.stats {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 8px;
    flex-shrink: 0;
}

.action-buttons {
    display: flex;
    gap: 8px;
    flex-shrink: 0;
    flex-wrap: wrap;
}
```

---

## 📁 Project Directory Display

### On Load Success
```
Header:
Project: Custom-BMAD-Repo

Sidebar (New):
📁 LoadDen Builder  ← Directory name
📍 C:\Users\...\Custom-BMAD-Repo  ← Full path (NEW)
✅ Ready

Below Others Menu (NEW):
PROJECT DETAILS
─────────────────
📁 Directory
Custom-BMAD-Repo

📍 Path
C:\Users\Mr. R\Desktop\Custom-BMAD-Repo

📝 Last Updated
architecture.md
(docs/architecture.md)

⏰ Time Log
2025-10-16 14:32:15
```

---

## 🔄 Auto-Refresh System

### File Monitoring Strategy

```javascript
// 1. Initial scan on project selection
await scanProjectDirectory();

// 2. Set up auto-refresh interval
setInterval(() => {
    checkForChanges();
}, 2000); // Every 2 seconds

// 3. Check for changes
async function checkForChanges() {
    const currentEpics = await scanEpics();
    const currentStories = await scanStories();
    const currentOthers = await scanOthers();
    
    if (hasChanged(currentEpics, previousEpics) ||
        hasChanged(currentStories, previousStories) ||
        hasChanged(currentOthers, previousOthers)) {
        
        // Files changed
        refreshUI(); // Update display
        updateLastModified(); // Update timestamp
        showRefreshNotification(); // Brief notification
    }
}

// 4. Track file modifications
trackLastModified() {
    const allFiles = [...epics, ...stories, ...others];
    const sorted = allFiles.sort((a, b) => 
        b.modified - a.modified
    );
    
    lastModifiedFile = sorted[0];
    lastModifiedTime = new Date();
}
```

### Refresh Behavior

- ✅ Detects new .md files
- ✅ Detects modified files
- ✅ Updates counts automatically
- ✅ Refreshes UI seamlessly
- ✅ Shows last modified timestamp
- ✅ Maintains current view

---

## 📊 Project Details Section

### Display Information

```
PROJECT DETAILS
═════════════════════════════════════

📁 PROJECT DIRECTORY
┌─────────────────────────────────────┐
│ Custom-BMAD-Repo                    │
└─────────────────────────────────────┘

📍 LOCATION
┌─────────────────────────────────────┐
│ C:\Users\Mr. R\Desktop\             │
│ Custom-BMAD-Repo                    │
└─────────────────────────────────────┘

📝 LAST UPDATE
┌─────────────────────────────────────┐
│ architecture.md                     │
│ docs/architecture.md                │
└─────────────────────────────────────┘

⏰ UPDATE TIME
┌─────────────────────────────────────┐
│ 2025-10-16 14:32:15                 │
│ (2 minutes ago)                     │
└─────────────────────────────────────┘

🔄 AUTO-REFRESH
   Status: Active
   Last Check: Just now
```

### Data Collection

```javascript
projectDetails = {
    name: "Custom-BMAD-Repo",
    path: "C:\Users\Mr. R\Desktop\Custom-BMAD-Repo",
    lastModifiedFile: "architecture.md",
    lastModifiedPath: "docs/architecture.md",
    lastModifiedTime: 2025-10-16T14:32:15Z,
    lastModifiedRelative: "2 minutes ago",
    autoRefreshActive: true,
    lastRefreshCheck: 2025-10-16T17:17:00Z
}
```

---

## 🚀 Implementation Sequence

### Phase 1: Layout Fixes
1. Fix preview panel CSS (no overlap)
2. Implement proper flex/grid layout
3. Test scrolling and responsiveness

### Phase 2: Analysis Integration
1. Move Analysis into WorkTree structure
2. Make collapsible section
3. Direct file viewing on click
4. Remove Analysis from main menu

### Phase 3: Directory Display
1. Add path display to header
2. Add path display to sidebar
3. Update on project load
4. Format paths properly

### Phase 4: Auto-Refresh
1. Set up file monitoring interval
2. Track modifications
3. Detect new files
4. Update UI smoothly
5. Show notifications (optional)

### Phase 5: Project Details
1. Create details panel below Others
2. Display directory info
3. Show last modified file
4. Display timestamps
5. Format relative times

---

## 🧪 Testing Strategy

### Layout Testing
- ✅ Preview panel no overlap
- ✅ All sections visible
- ✅ Scrolling works
- ✅ Responsive on different sizes

### Functionality Testing
- ✅ Analysis files clickable
- ✅ Content loads on click
- ✅ Auto-refresh detects changes
- ✅ Timestamps update correctly
- ✅ Project details display accurate info

### Performance Testing
- ✅ Auto-refresh doesn't lag
- ✅ File scanning efficient
- ✅ UI responsive
- ✅ Memory usage stable

---

## 📋 Deliverables

1. **bmad-dashboard-v9.html** - Enhanced application
2. **BMAD-V9-ARCHITECTURE.md** - This specification
3. **BMAD-V9-IMPLEMENTATION.md** - Implementation guide
4. **Updated documentation** - Feature changes

---

**Architecture Ready for Development**

Next: Implement in bmad-dashboard-v9.html
