# Scribe Setup Instructions

This guide will help you set up the Scribe Markdown editor and viewer application.

## Option 1: Create Xcode Project (Recommended)

### Step 1: Create New Xcode Project

1. Open Xcode
2. Select "Create a new Xcode project"
3. Choose macOS → App
4. Configure the project:
   - Product Name: `Scribe`
   - Interface: `SwiftUI`
   - Language: `Swift`
   - Use the directory: `/Users/ms/Documents/GitHub/Scribe`
   - **Important**: Uncheck "Create Git repository" (already exists)

### Step 2: Replace Generated Files

The Swift source files have already been created in the `Scribe/` directory:
- `ScribeApp.swift` - Main app entry point
- `MarkdownDocument.swift` - Document type with file handling
- `ContentView.swift` - Main UI with editor and preview
- `Info.plist` - Document type declarations

When Xcode creates the project, it will generate similar files. You can either:
- Delete the generated files and use the existing ones in the `Scribe/` folder, or
- Keep the generated files and manually update them with the content from our files

### Step 3: Add MarkdownUI Package Dependency

1. In Xcode, select your project in the navigator
2. Select the Scribe target
3. Go to "Package Dependencies" tab
4. Click the "+" button
5. Enter the repository URL: `https://github.com/gonzalezreal/MarkdownUI`
6. Click "Add Package"
7. Select "MarkdownUI" library and click "Add Package"

### Step 4: Configure Document Types

The `Info.plist` file already includes the necessary document type declarations for:
- `.md` files
- `.markdown` files
- `.mdown` files

If Xcode created its own Info.plist, you may need to merge the document type declarations.

### Step 5: Build and Run

1. Select a Mac target (My Mac)
2. Press Cmd+R to build and run
3. Test by opening or creating a Markdown file

## Option 2: Manual Project Configuration

If you prefer to configure manually or the automatic setup doesn't work:

### Create project.pbxproj

A minimal Xcode project file needs to be created. You can use the following command to generate it:

```bash
# This will be provided in a separate script
./create_xcode_project.sh
```

## Features

The completed application includes:

- Document-based app architecture
- Opens .md, .markdown, and .mdown files
- Side-by-side editor and preview (HSplitView)
- Live preview updates as you type
- Full Markdown rendering (headers, tables, code blocks, lists)
- Toggle between split-view and preview-only mode
- MarkdownUI library integration for robust rendering

## Troubleshooting

### Package Dependency Issues

If MarkdownUI doesn't import correctly:
1. Ensure you're connected to the internet
2. Try Product → Clean Build Folder (Cmd+Shift+K)
3. Restart Xcode

### Build Errors

If you see "Cannot find 'Markdown' in scope":
- Verify MarkdownUI package is added to target dependencies
- Check that `import MarkdownUI` is present in ContentView.swift

### Document Types Not Working

If the app doesn't open .md files:
- Check Info.plist has the correct UTType declarations
- Verify CFBundleDocumentTypes array is properly configured
- Clean and rebuild the project

## Testing

Create a test Markdown file:

```bash
cat > test.md << 'EOF'
# Test Document

This is a **test** of the Scribe application.

## Features

- Bullet points
- **Bold text**
- *Italic text*

## Code

```swift
func hello() {
    print("Hello, Scribe!")
}
```

## Table

| Column 1 | Column 2 |
|----------|----------|
| Data 1   | Data 2   |
EOF
```

Then open it with Scribe to test all features.

## Next Steps

Once the app is running:
1. Test opening existing Markdown files
2. Test creating new documents
3. Verify live preview updates
4. Test the split-view toggle
5. Verify save functionality

## Resources

- [MarkdownUI Documentation](https://github.com/gonzalezreal/MarkdownUI)
- [SwiftUI Document-based Apps](https://developer.apple.com/documentation/swiftui/building-a-document-based-app-with-swiftui)
- [Uniform Type Identifiers](https://developer.apple.com/documentation/uniformtypeidentifiers)
