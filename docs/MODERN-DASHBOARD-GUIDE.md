# BMAD Modern Dashboard - User Guide

**Version**: 1.0  
**Last Updated**: October 18, 2025  
**Dashboard File**: `bmad-dashboard-modern.html`

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [Getting Started](#getting-started)
3. [Features](#features)
4. [Using the Dashboard](#using-the-dashboard)
5. [Understanding the Interface](#understanding-the-interface)
6. [Troubleshooting](#troubleshooting)
7. [FAQ](#faq)

---

## 🎯 Overview

The BMAD Modern Dashboard is a beautiful, feature-rich web application that provides an intuitive interface for managing and viewing your BMAD (Breakthrough Method of Agile AI-driven Development) projects.

### Key Features

✅ **Phase-Based Organization** - View your project organized by BMAD phases (Discovery, Planning, Development, Testing)  
✅ **Epic Tree Structure** - Hierarchical view of epics and their related stories  
✅ **Gap Detection** - Automatically identifies missing epics and stories  
✅ **File Viewer** - Click any file to view its markdown content  
✅ **Light/Dark Theme** - Toggle between themes with automatic preference saving  
✅ **Smart Sorting** - Auto-sorts files by date (newest first) or number (1→up)  
✅ **Browser Compatibility Check** - Alerts you if using an unsupported browser  

---

## 🚀 Getting Started

### System Requirements

**Supported Browsers** (File System Access API required):
- ✅ Google Chrome (version 86+)
- ✅ Microsoft Edge (version 86+)
- ✅ Opera (version 72+)

**Not Supported**:
- ❌ Firefox (lacks File System Access API)
- ❌ Safari (lacks File System Access API)

### Opening the Dashboard

1. Navigate to your project's `docs` folder
2. Open `bmad-dashboard-modern.html` in a supported browser
3. Click **"Select Project"** button
4. Choose your BMAD project root folder
5. Dashboard will scan and display all BMAD files

---

## ✨ Features

### 1. Phase-Based Organization

Your BMAD project is automatically organized into four phases:

#### 📊 Discovery Phase
- **Files**: brainstorming-session.md, project-brief.md, market-research.md
- **Sorting**: By date (newest first)
- **Purpose**: Initial research and project definition

#### 📋 Planning Phase
- **Files**: prd.md, architecture.md, front-end-spec.md
- **Sorting**: By date (newest first)
- **Purpose**: Requirements and design specifications

#### 💻 Development Phase
- **Files**: Epics and Stories
- **Sorting**: By number (1, 2, 3...)
- **Structure**: Tree view showing epic-story relationships
- **Purpose**: Implementation tracking

#### ✅ Testing Phase
- **Files**: QA documentation, test results
- **Sorting**: By date (newest first)
- **Purpose**: Quality assurance validation

---

### 2. Epic Tree Structure

The Development phase displays a hierarchical tree structure:

```
📦 EPIC TREE

1  epic 001 location niche input                    3 stories ✓
   └ 1-1  story 001 1 setup project structure ✓
   └ 1-2  story 001 2 create base components ✓
   └ 1-3  story 001 3 implement routing ✓

3  epic 003 website scoring                         2 stories ✓
   └ 3-1  story 003 1 scoring logic ✓
   └ 3-2  story 003 2 display results ✓
```

**Features**:
- Parent-child relationship visualization
- Story count displayed for each epic
- Visual indentation and connection lines
- Click any epic or story to view its content

---

### 3. Gap Detection

The dashboard automatically detects and highlights gaps in your numbering:

#### Epic-Level Gaps
```
⚠️ MISSING EPICS
Gap detected: Epic #2 (not found in project)
```

Shows when epic numbers have gaps (e.g., 1, 3, 4 with #2 missing)

#### Story-Level Gaps
```
4  epic 004 final summary
   ⚠️ Missing stories: 4-3
   └ 4-1  substory 001 ✓
   └ 4-2  substory 002 ✓
   └ 4-4  substory 004 ✓  ← Gap: 4-3 missing
```

Shows gaps within each epic's stories

#### Orphan Stories
```
⚠️ 2-1  story 002 1 authentication        Epic 2 missing
```

Stories that reference non-existent parent epics

---

### 4. File Viewer

Click any file to view its content in a slide-out panel:

**Features**:
- **Markdown Rendering**: Full support for markdown syntax
- **Syntax Highlighting**: Code blocks are syntax-highlighted
- **Smooth Animation**: Panel slides in from the right
- **Easy Navigation**: Close with × button

**Supported Content**:
- Headings (H1-H6)
- Lists (ordered/unordered)
- Code blocks with syntax highlighting
- Tables
- Blockquotes
- Links and images
- Bold/italic text

---

### 5. Theme Toggle

Switch between light and dark themes:

**How to Use**:
1. Click the 🌙 (moon) or ☀️ (sun) icon in top-right
2. Theme changes instantly
3. Preference saved automatically
4. Works across all views

**Theme Features**:
- Professional color schemes
- Optimized for readability
- Smooth transition animations
- Persistent across sessions

---

## 🎮 Using the Dashboard

### Navigation

**Sidebar Views**:
- **📊 Overview**: Summary statistics and phase cards
- **🔄 Workflow**: Detailed BMAD workflow view
- **📁 All Files**: Flat list of all project files

**Top Bar**:
- **Breadcrumb**: Shows current view
- **Theme Toggle**: Switch light/dark mode
- **Refresh**: Re-scan project files
- **Select Project**: Choose different project

---

### Workflow

#### Step 1: Select Project
1. Click **"Select Project"** button
2. Navigate to project root folder
3. Click "Select Folder"
4. Dashboard scans all files

#### Step 2: Explore Phases
1. Click any phase card to expand
2. View files organized by phase
3. Check for missing files (gaps)
4. Click files to view content

#### Step 3: Navigate Epic Tree
1. Go to Development phase
2. See epics with story counts
3. Expand to view nested stories
4. Click to read implementation details

#### Step 4: Review Content
1. Click any file item
2. File viewer slides in from right
3. Read markdown-rendered content
4. Close when done (× button)

---

## 🖥️ Understanding the Interface

### Color Coding

**Phase Colors**:
- 🔵 **Blue** - Discovery phase
- 🟣 **Purple** - Planning phase
- 🟢 **Green** - Development phase
- 🟠 **Orange** - Testing phase

**Status Indicators**:
- ✅ **Green Badge** - Phase complete
- ⚠️ **Orange Badge** - Phase pending
- ❌ **Red Warning** - Missing files detected

---

### File Naming Conventions

The dashboard recognizes these patterns:

| Pattern | Type | Example |
|---------|------|---------|
| `epic-N.md` | Epic | `epic-1.md` |
| `epic_N.md` | Epic | `epic_003.md` |
| `story-N-M.md` | Story | `story-1-1.md` (Epic 1, Story 1) |
| `substory-N-M.md` | Story | `substory-3-2.md` (Epic 3, Story 2) |
| `story_N_M.md` | Story | `story_4_1.md` |
| `story-N.md` | Standalone | `story-5.md` (no epic) |

**Notes**:
- Works with both `-` and `_` separators
- Numbers can be padded (001, 01, 1)
- Case insensitive

---

### Scrolling

**Auto-Scrollbar**:
- Appears automatically when content exceeds panel height
- Max height: 500px per phase card
- Smooth scrolling enabled
- Custom styled scrollbar

---

## 🔧 Troubleshooting

### Dashboard won't load files

**Problem**: "Select Project" button is disabled  
**Solution**: You're using an unsupported browser. Switch to Chrome, Edge, or Opera.

---

### Files not showing up

**Problem**: Files exist but don't appear in dashboard  
**Checklist**:
1. ✅ Files are in `docs/` folder?
2. ✅ Files have `.md` extension?
3. ✅ File naming follows conventions?
4. ✅ Clicked Refresh button?

---

### Gap warnings appearing incorrectly

**Problem**: Dashboard shows gaps but files exist  
**Cause**: Filename doesn't match expected pattern  
**Solution**: Rename files to follow conventions (see File Naming Conventions)

---

### File viewer shows error

**Problem**: "Failed to load file" message  
**Possible Causes**:
1. File was moved or deleted
2. Permission issues
3. File is not a text file

**Solution**: Verify file exists and is readable

---

### Theme not saving

**Problem**: Theme resets to light on refresh  
**Cause**: Browser storage disabled  
**Solution**: Enable localStorage in browser settings

---

### Browser warning appears

**Problem**: Red banner saying "Browser Not Supported"  
**Cause**: Using Firefox, Safari, or other non-Chromium browser  
**Solution**: Open dashboard in Chrome, Edge, or Opera

---

## ❓ FAQ

### Can I use this dashboard offline?

Yes! The dashboard is a single HTML file that works completely offline. Only requirement is a supported browser.

---

### Does it work with other project structures?

The dashboard is specifically designed for BMAD projects. It expects:
- `docs/` folder at project root
- BMAD file naming conventions
- Markdown files

For custom projects, files may appear in "Other" section.

---

### Can I customize the theme colors?

Yes! Edit the CSS custom properties in the `<style>` section:
- Light theme: `:root { ... }`
- Dark theme: `[data-theme="dark"] { ... }`

---

### How do I report bugs or request features?

Contact the BMAD development team or create an issue in your project repository.

---

### Can I view non-markdown files?

The file viewer is optimized for markdown (.md) files. Other file types may not render correctly.

---

### Does it modify my project files?

**No!** The dashboard is read-only. It never modifies, deletes, or creates files. It only reads existing files.

---

### Why can't I see the docs folder?

When selecting a project, choose the **root folder** (e.g., `Custom-BMAD`), not the `docs` folder itself. The dashboard will automatically find the `docs` subfolder.

---

### How do I switch projects?

Click the **"Select Project"** button in the top-right and choose a different folder. The dashboard will re-scan immediately.

---

### Can I keep both dashboards?

Yes! Both `bmad-dashboard.html` (classic) and `bmad-dashboard-modern.html` can coexist. Use whichever you prefer.

---

## 🎓 Tips & Best Practices

### Tip 1: Use Refresh Regularly
Click Refresh after making changes to files to see updates immediately.

### Tip 2: Name Files Consistently
Follow the naming conventions strictly to ensure proper categorization and gap detection.

### Tip 3: Fill Gaps Promptly
When gaps are detected, either create the missing files or document why they're skipped.

### Tip 4: Leverage File Viewer
Use the file viewer for quick reference instead of opening files in external editors.

### Tip 5: Organize by Folders
Store epics in `docs/epics/` and stories in `docs/stories/` for better organization (though flat structure also works).

### Tip 6: Use Keyboard Shortcuts
- Press `Esc` to close the file viewer
- Click outside the file viewer panel to close it

---

## 📝 Feature Comparison

| Feature | Classic Dashboard | Modern Dashboard |
|---------|-------------------|------------------|
| Epic Tree | ✅ Basic | ✅ **Enhanced with gaps** |
| File Viewer | ❌ No | ✅ **Yes with markdown** |
| Theme Toggle | ❌ Dark only | ✅ **Light + Dark** |
| Gap Detection | ❌ No | ✅ **Yes** |
| Browser Check | ❌ No | ✅ **Yes** |
| Auto Scrollbar | ❌ No | ✅ **Yes** |
| Smart Sorting | ✅ Basic | ✅ **By date/number** |
| File Size | 84 KB | **44 KB (smaller!)** |

---

## 🎨 UI Elements

### Phase Cards
- **Header**: Phase icon, name, description
- **Stats**: File count, completion badge
- **Progress Bar**: Visual completion indicator
- **Content**: Expandable file list with scrollbar

### File Items
- **Icon**: File type indicator
- **Number Badge**: Epic/story number
- **Name**: Formatted display name
- **Check Mark**: Completion indicator
- **Hover Effect**: Visual feedback
- **Click**: Opens file viewer

### File Viewer Panel
- **Width**: 600px
- **Position**: Slides from right
- **Header**: Filename, path, close button
- **Content**: Scrollable markdown-rendered area
- **Loading**: Spinner while loading
- **Error**: Friendly error message if fails

---

## 📊 Technical Specifications

### File System Access
- **API**: File System Access API
- **Permissions**: Read-only
- **Scope**: Project folder and subfolders
- **Refresh**: Manual or automatic

### Markdown Rendering
- **Library**: Marked.js (latest)
- **Syntax**: GitHub Flavored Markdown
- **Code Highlighting**: Highlight.js
- **Themes**: Atom One Light/Dark

### Performance
- **File Scanning**: ~100ms for typical project
- **Rendering**: Instant for most files
- **Memory**: Lightweight, no file caching
- **Responsive**: Smooth at 60fps

---

## 🔒 Security & Privacy

### Data Safety
- **Local Only**: All processing happens in your browser
- **No Network**: No data sent to servers
- **No Tracking**: No analytics or telemetry
- **Read-Only**: Cannot modify your files

### Permissions
- **File System Access**: Only when you explicitly select folder
- **Local Storage**: Only saves theme preference
- **No Cookies**: No tracking cookies used

---

## 📚 Related Documentation

- **README.md**: Project overview
- **DASHBOARD-GUIDE.md**: Classic dashboard guide
- **global-bmad-rules.md**: BMAD Method™ complete methodology
- **QUICK-START.md**: Project quick start

---

## 🆘 Support

For issues, questions, or feature requests:

1. Check this guide's troubleshooting section
2. Verify browser compatibility
3. Review the FAQ
4. Contact BMAD support team

---

## 📝 Version History

### Version 1.0 (October 18, 2025)
- ✅ Initial release
- ✅ Phase-based organization
- ✅ Epic tree with gap detection
- ✅ File viewer with markdown rendering
- ✅ Light/dark theme toggle
- ✅ Browser compatibility check
- ✅ Auto-scrollbar support
- ✅ Smart sorting (date/number)
- ✅ Tree structure for epics/stories
- ✅ Orphan story detection
- ✅ Standalone story support

---

## 🎉 Conclusion

The BMAD Modern Dashboard provides a streamlined, intuitive interface for your BMAD projects with:

✅ **Visual Clarity**: Clean, modern design with excellent readability  
✅ **Intelligent Organization**: Phase-based and tree-structured views  
✅ **Gap Detection**: Never miss a missing epic or story  
✅ **Instant Preview**: Click-to-view file content  
✅ **Theme Flexibility**: Work comfortably in any lighting  
✅ **Performance**: Fast, lightweight, and responsive  

**Happy Building with BMAD! 🎯**

---

**Dashboard Version**: 1.0 Modern  
**Guide Version**: 1.0  
**Last Updated**: October 18, 2025  
**BMAD Method™** is a trademark of BMad Code, LLC
