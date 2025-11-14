# Scribe

A beautiful, native macOS Markdown editor and viewer built with SwiftUI.

![macOS](https://img.shields.io/badge/macOS-SwiftUI-blue)
![Swift](https://img.shields.io/badge/Swift-5.9+-orange)

## Overview

Scribe is a document-based macOS application that provides a seamless Markdown editing experience with live preview. Built entirely with SwiftUI and powered by [MarkdownUI](https://github.com/gonzalezreal/MarkdownUI), it offers robust rendering of all Markdown elements including tables, code blocks, and more.

## Features

- **Live Preview**: Real-time rendering as you type
- **Split View**: Side-by-side editor and preview panes
- **Interactive Checkboxes**: Click checkboxes in preview to toggle them
- **Full Markdown Support**: Headers, lists, tables, code blocks, links, images, and more
- **Toggle Views**: Switch between split-view and preview-only mode
- **Document-based**: Native macOS document handling with auto-save
- **File Associations**: Opens .md, .markdown, and .mdown files
- **Fast Rendering**: Powered by MarkdownUI library

## Screenshots

```
┌─────────────────────────────────────────────────────────┐
│  Scribe                                          [x]   │
├─────────────────────────────────────────────────────────┤
│                              Show Editor: [X]           │
├────────────────────┬────────────────────────────────────┤
│   Editor           │   Preview                          │
├────────────────────┼────────────────────────────────────┤
│                    │                                    │
│  # Welcome         │   Welcome                          │
│                    │   ═════════                        │
│  This is a test    │   This is a test                   │
│  of **Scribe**   │   of Scribe                      │
│                    │                                    │
│  ## Features       │   Features                         │
│                    │   ─────────                        │
│  - Live preview    │   • Live preview                   │
│  - Split view      │   • Split view                     │
│                    │                                    │
└────────────────────┴────────────────────────────────────┘
```

## Installation

See [SETUP.md](SETUP.md) for detailed installation instructions.

### Quick Start

1. Open Xcode
2. Create a new macOS App project named "Scribe"
3. Add the MarkdownUI package dependency: `https://github.com/gonzalezreal/MarkdownUI`
4. Replace the generated files with the source files in `Scribe/` directory
5. Build and run (Cmd+R)

## Usage

### Opening Files

- Launch Scribe and choose "Open" from the File menu
- Or right-click any .md file and select "Open With → Scribe"
- Drag and drop Markdown files onto the Scribe icon

### Creating New Documents

- File → New (Cmd+N)
- Start typing your Markdown content
- Save with Cmd+S

### Editing

- Type your Markdown in the left editor pane
- See live preview in the right pane
- Use the "Show Editor" toggle to switch to preview-only mode

### Interactive Checkboxes

Scribe supports interactive todo lists:

```markdown
- [ ] Unchecked item
- [x] Checked item
```

In the preview pane, you can click the checkboxes to toggle them between checked and unchecked. The changes are automatically reflected in the editor and saved to your document.

### Keyboard Shortcuts

- Cmd+N: New document
- Cmd+O: Open document
- Cmd+S: Save document
- Cmd+W: Close window
- Cmd+Q: Quit application

## Project Structure

```
Scribe/
├── Scribe/
│   ├── ScribeApp.swift          # Main app entry point
│   ├── MarkdownDocument.swift     # Document type definition
│   ├── ContentView.swift          # Main UI (split view)
│   └── Info.plist                 # Document type declarations
├── Scribe.xcodeproj/
│   └── project.pbxproj            # Xcode project file
├── sample.md                       # Sample Markdown file for testing
├── SETUP.md                        # Detailed setup instructions
└── README.md                       # This file
```

## Technical Details

### Architecture

- **SwiftUI DocumentGroup**: Provides document-based app infrastructure
- **FileDocument Protocol**: Handles reading/writing Markdown files
- **HSplitView**: Creates resizable split pane layout
- **@Binding**: Enables live preview updates
- **MarkdownUI Library**: Renders Markdown with full syntax support

### Supported File Types

- `.md` - Markdown
- `.markdown` - Markdown (alternative extension)
- `.mdown` - Markdown (alternative extension)

### UTType

The app uses the standard Markdown UTType: `net.daringfireball.markdown`

## Dependencies

- [MarkdownUI](https://github.com/gonzalezreal/MarkdownUI) - Powerful Markdown rendering for SwiftUI

## Requirements

- macOS 13.0 or later
- Xcode 15.0 or later
- Swift 5.9 or later

## Contributing

This is a personal project, but suggestions and improvements are welcome!

## License

This project is available for personal and educational use.

## Acknowledgments

- [MarkdownUI](https://github.com/gonzalezreal/MarkdownUI) by Guille Gonzalez for excellent Markdown rendering
- Apple's SwiftUI documentation and examples
- The Markdown specification by John Gruber

## Support

For issues or questions:
1. Check the [SETUP.md](SETUP.md) troubleshooting section
2. Review the MarkdownUI documentation
3. Consult Apple's SwiftUI documentation

---

Made with SwiftUI
