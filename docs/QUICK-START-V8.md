# 🚀 BMAD Dashboard v8 - Quick Start Guide

## ⚡ Get Started in 3 Steps

### Step 1: Open Dashboard
```
Open: C:\Users\Mr. R\Desktop\Custom-BMAD-Repo\docs\bmad-dashboard-v8.html
```

### Step 2: Select Project
```
Click: 📁 Select Project button (top right)
Choose: Your project folder
Wait: Dashboard scans all files
```

### Step 3: Explore
```
Click sections to navigate:
🔄 Workflow     - View epics and stories
📊 Overview     - See project statistics
📈 Analysis     - Browse analysis files
📋 PRD          - Read full PRD
📂 Others       - View misc files
```

---

## 📊 Understanding the Interface

### Header (Top)
```
🎯 BMAD v8 Dashboard
📊 Current Section Title          🟢 Active  📁 Select Project
Project: Custom-BMAD-Repo
```

### Left Sidebar (Navigation)
```
🎯 BMAD v8
✅ Ready
📁 Custom-BMAD-Repo

🔄 Workflow      (7)   ← Epic + Story count
📊 Overview
📈 Analysis      (4)   ← Analysis file count
📋 PRD
📂 Others        (2)   ← Untracked file count
```

### Main Panel (Center)
- Shows content of selected file
- Markdown rendered beautifully
- Code syntax highlighted
- Click files from left panel to view

### Preview Panel (Right)
```
📄 File Info
filename.md
docs/path/filename.md

STATS
Lines: 245      Words: 1,823
Read Time: 9m   Headings: 12

📊 Complexity
🟡 Moderate
████░░░░░░ (45%)

⚡ Actions
[📋 Copy] [⬇️ Download]
```

---

## 🎯 How to Use Each Section

### 🔄 Workflow Section
```
📁 Epic 001 ✓
  📝 story-001-001 ✓
  📝 story-001-002 ✓
📁 Epic 002 ⚠️ MISSING
📁 Epic 003 ✓
  📝 story-003-001 ✓
```

**Click any epic or story to:**
- View file content
- See metadata (lines, words, etc.)
- Read complexity level
- Copy or download content

### 📊 Overview Section
```
📊 Project Overview

5 Epics                  20 Stories
Expected: 5              Expected: 20

Epic Progress      100%  ████████████
Story Progress      75%  █████████░░░

Analysis Files: 4
Other Files: 2
```

**Shows:**
- Total epics and stories
- Progress bars (if metadata set)
- Expected vs actual counts
- Quick statistics

### 📈 Analysis Section
```
📈 Analysis Files (4)

📄 brainstorming-session
  10/16/2025 14:23:45 • 5.2 KB

📄 project-brief
  10/15/2025 09:12:30 • 8.7 KB

📄 market-research
  10/14/2025 16:45:22 • 12.3 KB

📄 front-end-spec
  10/13/2025 11:03:15 • 15.8 KB
```

**Click any file to:**
- Read the document
- See file stats
- Copy content
- Download file

### 📋 PRD Section
Shows your complete Product Requirements Document
- Full markdown rendering
- Code syntax highlighting
- Easy to read and navigate

### 📂 Others Section
```
Sort:
[🕐 Updated] [A-Z Name]

📄 custom-doc-001 ✓
📄 notes-and-ideas ✓
📄 reference-material ✓
```

**Features:**
- Sort by most recent or alphabetical
- Click to view files
- See all untracked markdown files

---

## 📍 Understanding Counts

### 🔄 Workflow Badge
```
Shows: Total Epics + Total Stories
Example: (7) = 3 epics + 4 stories
```

### 📈 Analysis Badge
```
Shows: Number of analysis files
Example: (4) = 4 analysis markdown files
```

### 📂 Others Badge
```
Shows: Number of untracked files
Example: (2) = 2 misc markdown files in docs/
```

---

## 🟢 Understanding Complexity Indicator

Files are rated for complexity:

| Icon | Level | Metric | Meaning |
|------|-------|--------|---------|
| 🟢 | Simple | < 200 | Quick read, basic content |
| 🟡 | Moderate | 200-500 | Average read, some detail |
| 🟠 | Complex | 500-1000 | Long read, lots of content |
| 🔴 | Very Complex | > 1000 | Very long, dense content |

**What counts?**
- Lines in file
- Number of words
- Heading count
- Overall content size

---

## 📈 Understanding Progress Bars

Visible in Overview section when metadata set:

```
Epic Progress    100%  ████████████
Story Progress    75%  █████████░░░
```

**Calculation:**
- Epic Progress = (Actual Epics / Expected Epics) × 100%
- Story Progress = (Actual Stories / Expected Stories) × 100%

**Where does metadata come from?**
Dashboard reads from WARP.md:
```
total_epics: 5
total_stories: 20
```

---

## 🔍 How to Find Things

### Search (Future Feature)
Currently unavailable in v8
*Coming in v9*

### Manual Navigation
1. **Use Workflow section** - Browse epics/stories hierarchically
2. **Use Analysis section** - Find analysis documents
3. **Use Others section** - Find misc files
4. **Sort by Updated** - Find most recent files first

### Sort Others by:
- **🕐 Updated** - Newest files first (default)
- **A-Z Name** - Alphabetical order

---

## 💡 Useful Actions

### Copy File Content
```
1. Click any file to view
2. See preview panel on right
3. Click [📋 Copy] button
4. Content copied to clipboard
```

### Download File
```
1. Click any file to view
2. See preview panel on right
3. Click [⬇️ Download] button
4. File downloads to your device
```

### View File Metadata
```
Every file shows:
- File name
- Full path
- Line count
- Word count
- Reading time
- Heading count
- Complexity level
```

---

## 🆘 Troubleshooting

### Dashboard won't load files
**Solution:**
1. Make sure project folder has `docs/` subdirectory
2. Try clicking "📁 Select Project" again
3. Refresh browser (F5)
4. Check browser console for errors

### Counts showing 0
**Solution:**
1. Wait for dashboard to finish scanning (may take a few seconds)
2. Try refreshing browser
3. Verify files exist in correct folders:
   - `docs/epics/` for epics
   - `docs/stories/` for stories
   - `docs/` for analysis files

### Project path not showing
**Solution:**
1. Project path should appear after selection
2. Check sidebar - should show project name
3. Check header - should show "Project: [name]"
4. If not showing, try selecting project again

### Can't see file content
**Solution:**
1. Click any file from the workflow panel
2. Content should appear in center panel
3. If not showing, try refreshing
4. Check file exists and contains text

---

## 📝 File Organization Best Practices

For best dashboard experience, organize your project like this:

```
Custom-BMAD-Repo/
├── WARP.md                         ← Set total_epics & total_stories
├── docs/
│   ├── prd.md
│   ├── architecture.md
│   ├── front-end-spec.md
│   ├── project-brief.md
│   ├── brainstorming-session.md
│   ├── market-research.md
│   ├── epics/
│   │   ├── epic-001-example.md
│   │   ├── epic-002-example.md
│   │   └── ...
│   ├── stories/
│   │   ├── story-001-001.md
│   │   ├── story-001-002.md
│   │   ├── story-002-001.md
│   │   └── ...
│   └── (other .md files)
```

---

## 🎓 Tips & Tricks

### Tip 1: Use Metadata
Add to WARP.md to enable progress tracking:
```markdown
total_epics: 5
total_stories: 20
```

### Tip 2: Name Files Consistently
- Epics: `epic-XXX-description.md`
- Stories: `story-XXX-YYY.md`

### Tip 3: Read Overview First
Get a quick summary of project status before diving into details

### Tip 4: Sort by Recent
Helps you find files you just modified

### Tip 5: Check Complexity
Plan reading time based on file complexity indicator

### Tip 6: Download for Sharing
Use download button to quickly share files

### Tip 7: Copy for Pasting
Use copy button to quickly grab content for use elsewhere

---

## ⚙️ System Requirements

### Browser Support
- **Recommended**: Google Chrome or Edge
- **Supported**: Firefox, Safari
- **Note**: Uses modern File System API

### Operating System
- Windows 10/11 ✓
- macOS ✓
- Linux ✓

### No Installation Needed
- Just open the HTML file in browser
- Works completely in-browser
- No server required

---

## 🎯 V8 Features at a Glance

✅ **Fixed Issues**
- Workflow count now accurate
- Others file count now correct
- Project path display added
- Analysis file count working

✨ **New Features**
- Metadata-based progress tracking
- Complexity indicators
- Progress bars
- Smart empty states
- Enhanced file preview
- Better file organization

🚀 **Production Ready**
- No known bugs
- Robust error handling
- Smooth performance
- Professional UI

---

## 📞 Need Help?

1. **Check this guide** - Most answers here
2. **Read v8 Summary** - Comprehensive docs
3. **Check file organization** - Ensure correct structure
4. **Try refreshing** - Fixes most issues
5. **Check browser console** - Look for error messages

---

## 🎉 You're Ready!

Start using BMAD Dashboard v8 now:

1. Open: `bmad-dashboard-v8.html`
2. Click: "📁 Select Project"
3. Choose: Your project folder
4. Explore!

**Enjoy managing your project with BMAD Dashboard v8! 🚀**

---

**Version**: 8.0  
**Last Updated**: 2025-10-16  
**Status**: ✅ Production Ready
