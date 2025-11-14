# Quick Start Guide

Get Scribe up and running in 5 minutes!

## Step 1: Open the Project

```bash
cd /Users/ms/Documents/GitHub/Scribe
open Scribe.xcodeproj
```

## Step 2: Wait for Dependencies

When Xcode opens, it will automatically:
- Resolve the MarkdownUI package dependency
- Download the required Swift packages
- Index the project files

This usually takes 30-60 seconds.

## Step 3: Build and Run

1. In Xcode, ensure "Scribe" scheme is selected
2. Select "My Mac" as the run destination
3. Press `Cmd+R` or click the Play button
4. The app will build and launch

## Step 4: Test the App

### Create a New Document
- File → New (Cmd+N)
- Start typing Markdown in the left pane
- See it rendered in real-time on the right

### Open Sample File
- File → Open (Cmd+O)
- Navigate to: `/Users/ms/Documents/GitHub/Scribe/sample.md`
- Test the live preview and editing features

### Toggle View Mode
- Click the "Show Editor" toggle in the toolbar
- Switch between split-view and preview-only mode

## Features to Try

### Live Preview
Type in the editor:
```markdown
# Hello Scribe

This is **bold** and this is *italic*.
```

Watch it render instantly on the right!

### Interactive Checkboxes
Type this in the editor:
```markdown
- [ ] First task
- [x] Completed task
- [ ] Another task
```

Then click the checkboxes in the preview pane to toggle them. The editor text updates automatically!

### Code Blocks
```markdown
```swift
func greet() {
    print("Hello, World!")
}
` ` `
```

### Tables
```markdown
| Feature | Status |
|---------|--------|
| Editor  | Done   |
| Preview | Done   |
```

### Lists
```markdown
- Item 1
- Item 2
  - Nested item
  - Another nested item
```

## Keyboard Shortcuts

- `Cmd+N` - New document
- `Cmd+O` - Open document
- `Cmd+S` - Save document
- `Cmd+W` - Close window
- `Cmd+Q` - Quit app

## Troubleshooting

### "Cannot find 'Markdown' in scope"
- Wait for package resolution to complete
- Product → Clean Build Folder (Cmd+Shift+K)
- Restart Xcode

### Package resolution failed
- Check internet connection
- Xcode → Preferences → Accounts (verify signed in)
- File → Swift Packages → Reset Package Caches

### Build errors
- Ensure macOS deployment target is 13.0 or later
- Check that Xcode version is 15.0 or later
- Verify Swift version is 5.9 or later

## Next Steps

Once everything works:

1. **Customize**: Modify the UI in `Scribe/ContentView.swift`
2. **Theme**: Change the Markdown theme (currently using `.gitHub`)
3. **Icon**: Add your own app icon to `Assets.xcassets/AppIcon.appiconset`
4. **Bundle ID**: Update `PRODUCT_BUNDLE_IDENTIFIER` in project settings

## Support

- Check `SETUP.md` for detailed setup instructions
- Check `README.md` for project overview and features
- Run `./verify_setup.sh` to verify project setup

---

Happy Markdown editing with Scribe!
