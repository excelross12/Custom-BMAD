# BMAD Dashboard - Complete Guide

**Version**: Final (v9 Enhanced)  
**Last Updated**: October 17, 2025  
**Status**: Production Ready ✅

---

## 🎯 Overview

The BMAD Dashboard is a sophisticated, browser-based project tracking and documentation viewer designed specifically for BMAD Method™ projects. It provides real-time visualization of your project's structure, files, and progress.

### Key Features

- **📂 Smart Project Loading**: Direct folder selection with File System Access API
- **🔄 Auto-Refresh**: Automatically detects and loads new/modified markdown files
- **📊 Three-Panel Layout**: Sidebar navigation, central content, and live preview
- **🌲 Enhanced Workflow Tree**: Hierarchical epic/story/substory visualization with grouping
- **📈 Analysis Files Integration**: Structured view of project documentation
- **🎨 Modern UI**: Dark theme with gradient accents and smooth animations
- **📍 Project Location Tracking**: Displays full directory path and last modified file
- **🔍 Live Preview**: Real-time markdown rendering with syntax highlighting

---

## 🚀 Quick Start

### 1. Open the Dashboard

```
Open: docs/bmad-dashboard.html in your browser
```

**Supported Browsers**:
- ✅ Chrome/Edge (Recommended)
- ✅ Brave
- ⚠️ Firefox (May have File System API limitations)
- ❌ Safari (File System API not supported)

### 2. Select Your Project

1. Click **"Select Project Folder"** button
2. Navigate to your BMAD project root directory
3. Select the folder (must contain a `docs/` directory)
4. Dashboard will automatically scan and display all files

### 3. Navigate Your Project

**Sidebar Menu**:
- **📊 Overview**: Project summary and statistics
- **🔄 Workflow**: Enhanced tree view of epics and stories
- **📋 PRD**: Product Requirements Document
- **📂 Others**: Additional markdown files

---

## 📁 Project Structure Requirements

For optimal dashboard functionality, organize your project as follows:

```
your-project/
├── docs/
│   ├── prd.md                          # Product Requirements Document
│   ├── architecture.md                 # Architecture specification
│   ├── brainstorming-session.md        # Initial brainstorming notes
│   ├── project-brief.md                # Project brief
│   ├── market-research.md              # Market research
│   ├── front-end-spec.md               # Frontend specification
│   ├── epics/
│   │   ├── epic-001-authentication.md
│   │   ├── epic-001-COMPLETE.md        # Grouped variants
│   │   ├── epic-002-user-profile.md
│   │   └── ...
│   └── stories/
│       ├── story-001-login.md
│       ├── story-001-register.md
│       ├── substory-001-validation.md  # Nested substories
│       └── ...
└── WARP.md                             # Project metadata (optional)
```

---

## 🌲 Enhanced Workflow Tree

### Epic Grouping

The dashboard intelligently groups multiple epic file variants under a single parent node:

```
▼ 📁 Epic 004 (3) ✓
  ├─ 📄 epic-004-main (Primary)
  ├─ 📄 epic-004-COMPLETE
  ├─ 📄 epic-004-analysis
  ├─ Stories (5)
  │  ├─ 📝 story-004-dashboard-ui
  │  ├─ 📝 story-004-data-visualization
  │  └─ ...
  └─ Substories (2)
     ├─ 📋 substory-004-chart-component
     └─ 📋 substory-004-table-component
```

### Features

- **Collapsible Nodes**: Click epic parent to expand/collapse children
- **Variant Grouping**: All `epic-XXX-*` files grouped together
- **Primary Marking**: First variant highlighted as primary
- **Story Nesting**: Stories and substories properly nested under epics
- **Visual Hierarchy**: Indentation and colored borders show relationships
- **Counters**: Shows number of variants, stories, and substories

### File Naming Conventions

For proper tree structure:

- **Epics**: `epic-XXX-description.md` (e.g., `epic-001-auth.md`)
- **Stories**: `story-XXX-description.md` (e.g., `story-001-login.md`)
- **Substories**: `substory-XXX-description.md` (e.g., `substory-001-validation.md`)

---

## 📊 Overview Panel

The Overview panel provides comprehensive project statistics:

### Project Information
- **Project Name**: Auto-detected from folder name
- **Total Files**: Count of all markdown files
- **Last Updated**: Most recently modified file with timestamp

### Workflow Summary
- **Epics**: Total number of unique epics
- **Stories**: Total number of stories
- **Completion Status**: Visual progress indicators

### Analysis Documents
- Quick links to all planning and architecture documents
- File sizes and last modified timestamps
- One-click access to any document

---

## 🔄 Auto-Refresh Feature

The dashboard automatically detects changes to your project files:

### How It Works

1. **5-Second Polling**: Checks for file changes every 5 seconds
2. **Smart Detection**: Only rescans if files are added/modified/deleted
3. **Seamless Updates**: Refreshes workflow tree and file cache automatically
4. **Visual Indicator**: "Auto-refresh enabled" status in sidebar

### File Tracking

- Tracks all `.md` files in `docs/` directory
- Monitors `epics/` and `stories/` subdirectories
- Updates last modified file information in real-time
- Maintains file content cache for quick access

---

## 📈 Analysis Files

Planning and architecture documents are organized in a dedicated section:

**Tracked Files**:
- `brainstorming-session.md`
- `project-brief.md`
- `prd.md`
- `market-research.md`
- `front-end-spec.md`
- `architecture.md`

**Features**:
- Collapsible section in workflow tree
- Quick access from sidebar
- Integrated into file preview system
- Included in auto-refresh monitoring

---

## 🎨 User Interface

### Layout

**Three-Panel Design**:
1. **Left Sidebar** (280px):
   - Project information
   - Navigation menu
   - Project details section
   - Auto-refresh status

2. **Middle Panel** (Variable):
   - Main content display
   - Markdown rendering
   - Section-specific views

3. **Right Panel** (Workflow Tree - 350px):
   - Enhanced epic/story tree
   - OR Preview panel (when viewing files)

### Color Scheme

| Element | Color | Purpose |
|---------|-------|---------|
| Background | `#0f1419` | Dark base |
| Primary Accent | `#667eea` | Blue gradient |
| Secondary Accent | `#764ba2` | Purple gradient |
| Epic | `#667eea` | Epic nodes |
| Story | `#764ba2` | Story nodes |
| Substory | `#9ca3af` | Substory nodes |
| Success | `#48bb78` | Completion badges |
| Warning | `#f6ad55` | Missing items |

---

## 🔍 Preview Panel

When viewing individual files, the right panel transforms into a live preview:

**Preview Features**:
- Real-time markdown rendering
- Syntax highlighting for code blocks
- File metadata display:
  - File name
  - File path
  - Last modified timestamp
  - File size
- Word and line count statistics
- Scrollable content view

---

## 📍 Project Details Section

Located at the bottom of the sidebar, displays:

### Project Directory
- Short project name
- Example: `my-bmad-project`

### Full Location
- Complete filesystem path
- Example: `C:\Users\...\my-bmad-project`

### Last Modified File
- File name with path
- Example: `story-004-dashboard.md (docs/stories/)`

### Last Update Time
- Absolute timestamp: `10/17/2025, 1:45:04 AM`
- Relative time: `5 minutes ago`

---

## 🔧 Technical Details

### Technologies Used

- **HTML5**: Semantic structure
- **CSS3**: Modern styling with gradients and animations
- **JavaScript (ES6+)**: Dashboard logic and file handling
- **File System Access API**: Direct folder access
- **Marked.js**: Markdown parsing and rendering
- **Highlight.js**: Syntax highlighting for code blocks

### Browser Requirements

- Modern browser with File System Access API support
- JavaScript enabled
- Minimum screen resolution: 1280x720

### Performance

- **Efficient Caching**: Files cached in memory after first load
- **Smart Scanning**: Only rescans when changes detected
- **Lazy Rendering**: Content rendered on-demand
- **Optimized DOM**: Minimal re-renders for better performance

---

## 🐛 Troubleshooting

### Dashboard Won't Load Files

**Issue**: "No files found" after selecting folder

**Solutions**:
1. Ensure folder contains a `docs/` subdirectory
2. Check that `.md` files exist in `docs/`, `docs/epics/`, or `docs/stories/`
3. Try refreshing the page and reselecting the folder
4. Verify browser supports File System Access API

### Auto-Refresh Not Working

**Issue**: New files not appearing automatically

**Solutions**:
1. Check "Auto-refresh enabled" status in sidebar
2. Manually click "Refresh Project" button
3. Verify files are being saved in correct directory
4. Check browser console for errors (F12)

### Epic Grouping Not Working

**Issue**: Epic variants not grouping properly

**Solutions**:
1. Verify epic files follow naming convention: `epic-XXX-*.md`
2. Ensure epic number is 3 digits with leading zeros (e.g., `001`, `004`)
3. Check that files are in `docs/epics/` directory
4. Refresh the project to rescan files

### Stories Not Nesting Under Epics

**Issue**: Stories appear flat, not nested

**Solutions**:
1. Verify story filenames match pattern: `story-XXX-*.md`
2. Ensure story number matches parent epic number
3. Check substory files use `substory-XXX-*.md` pattern
4. Refresh project to rebuild tree structure

---

## 💡 Best Practices

### File Organization

1. **Consistent Naming**: Use the standard naming conventions
2. **Numbered Epics**: Use sequential numbering (001, 002, 003...)
3. **Descriptive Names**: Include meaningful descriptions in filenames
4. **Logical Grouping**: Keep related stories under same epic number

### Dashboard Usage

1. **Regular Refreshes**: Let auto-refresh work, or manually refresh after bulk changes
2. **Browser Choice**: Use Chrome or Edge for best compatibility
3. **Window Size**: Use at least 1280px width for optimal layout
4. **File System Access**: Keep dashboard in `docs/` folder of project

### Project Maintenance

1. **Update WARP.md**: Keep metadata current for accurate tracking
2. **Clean File Names**: Remove old/duplicate versions of epics
3. **Archive Completed**: Move completed epics to archive folder if needed
4. **Documentation**: Keep planning docs up to date

---

## 🚀 Advanced Features

### WARP.md Integration

If present, the dashboard reads metadata from `WARP.md`:

```yaml
project:
  name: "My BMAD Project"
  total_epics: 5
  total_stories: 23
```

This enables:
- Accurate completion tracking
- Missing epic detection
- Expected vs. actual file counts

### Custom Styling

Dashboard supports custom CSS overrides via browser extensions or local modifications:

```css
/* Example: Change primary color */
:root {
  --primary-color: #your-color;
}
```

### Export Functionality

While not built-in, you can:
1. Use browser's "Save Page As" to export current view
2. Print to PDF for documentation
3. Use browser DevTools to export file cache

---

## 📚 Related Documentation

- **README.md**: Project overview and setup
- **QUICK-START.md**: Rapid onboarding guide
- **SETUP-GUIDE.md**: Detailed installation instructions
- **QUICK-REFERENCE.md**: Command and feature cheat sheet
- **global-bmad-rules.md**: BMAD Method™ complete methodology

---

## 🆘 Support

For issues, questions, or feature requests:

1. Check this guide's troubleshooting section
2. Review the project README
3. Check GitHub Issues for similar problems
4. Create a new issue with details

---

## 📝 Version History

**v9 (Current - Enhanced Workflow Tree)**:
- ✅ Epic variant grouping
- ✅ Story/substory hierarchy
- ✅ Collapsible epic nodes
- ✅ Auto-refresh functionality
- ✅ Project location tracking
- ✅ Enhanced preview panel

**Previous Versions**:
- v8: Three-panel layout with preview
- v7: Enhanced analysis files
- v6: Improved overview panel
- v5: Initial workflow tree
- v1-v4: Development iterations

---

## 🎉 Conclusion

The BMAD Dashboard provides a comprehensive, real-time view of your BMAD Method™ project with:

✅ **Intelligent Organization**: Hierarchical epic/story structure  
✅ **Live Updates**: Auto-refresh keeps everything current  
✅ **Rich Visualization**: Modern UI with clear visual hierarchy  
✅ **Complete Documentation**: All project files in one place  
✅ **Easy Navigation**: Intuitive three-panel layout  

**Happy Building with BMAD! 🚀**

---

**Dashboard Version**: Final (v9 Enhanced)  
**Guide Version**: 1.0  
**Last Updated**: October 17, 2025
