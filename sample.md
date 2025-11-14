# Welcome to Scribe

Scribe is a powerful Markdown editor and viewer for macOS.

## Features

- **Live Preview**: See your Markdown rendered in real-time as you type
- **Split View**: Edit on the left, preview on the right
- **Full Markdown Support**: Headers, lists, tables, code blocks, and more
- **Toggle View**: Switch between split-view and preview-only mode
- **Interactive Checkboxes**: Click checkboxes in the preview to toggle them

## Todo List Example

Try clicking the checkboxes below in the preview pane:

- [ ] Learn Markdown syntax
- [x] Open Scribe application
- [ ] Create a new document
- [ ] Edit some text
- [x] Try the interactive checkboxes
- [ ] Save your work
- [ ] Share with others

## Markdown Examples

### Text Formatting

You can use *italic text*, **bold text**, ***bold and italic***, and `inline code`.

### Lists

Unordered list:
- Item one
- Item two
  - Nested item
  - Another nested item
- Item three

Ordered list:
1. First item
2. Second item
3. Third item

### Code Blocks

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, Scribe!")
            .padding()
    }
}
```

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print(fibonacci(10))
```

### Tables

| Feature | Status | Priority |
|---------|--------|----------|
| Editor | Done | High |
| Preview | Done | High |
| Tables | Done | Medium |
| Export | Planned | Low |

### Links and Images

[Visit the MarkdownUI repository](https://github.com/gonzalezreal/MarkdownUI)

### Blockquotes

> This is a blockquote.
> It can span multiple lines.
>
> And even multiple paragraphs.

### Horizontal Rules

---

## Getting Started

1. Open a Markdown file (.md, .markdown, or .mdown)
2. Edit the content in the left pane
3. Watch the preview update in real-time on the right
4. Toggle the "Show Editor" switch to hide the editor pane
5. Save your work with Cmd+S

## Tips

- Use the monospaced font in the editor for better readability
- The preview uses the GitHub Markdown theme
- All standard Markdown syntax is supported
- Files are automatically associated with Scribe

Enjoy writing with Scribe!
