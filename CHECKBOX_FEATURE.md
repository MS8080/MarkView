# Interactive Checkbox Feature

Scribe includes interactive checkbox support, allowing you to click checkboxes in the preview pane to toggle their state.

## How It Works

### Creating Checkboxes

Use standard Markdown checkbox syntax in your document:

```markdown
- [ ] Unchecked item
- [x] Checked item
```

### Toggling Checkboxes

In the preview pane, checkboxes appear as clickable UI elements. Simply click any checkbox to toggle it between checked and unchecked states.

When you click a checkbox:
1. The checkbox visual state changes immediately
2. The underlying Markdown text is updated automatically
3. Changes are synced to the editor pane
4. The document is marked as modified (auto-save will save changes)

## Syntax Support

Scribe recognizes these checkbox patterns:

```markdown
- [ ] Unchecked (space)
- [x] Checked (lowercase x)
- [X] Checked (uppercase X)
```

All standard Markdown list markers work:
```markdown
- [ ] Using hyphen
* [ ] Using asterisk
+ [ ] Using plus sign
```

## Use Cases

### Todo Lists

```markdown
## My Tasks

- [ ] Review pull requests
- [ ] Update documentation
- [x] Fix bug in login page
- [ ] Deploy to production
```

### Project Planning

```markdown
## Project Checklist

### Phase 1: Planning
- [x] Define requirements
- [x] Create wireframes
- [ ] Get stakeholder approval

### Phase 2: Development
- [ ] Set up project structure
- [ ] Implement core features
- [ ] Write tests
```

### Meeting Notes

```markdown
## Meeting Action Items

- [x] @john Send meeting notes
- [ ] @sarah Review design mockups
- [ ] @mike Update timeline
```

## Technical Details

### Implementation

The interactive checkbox feature uses:
- `CheckboxHelper.swift`: Parses Markdown to find checkbox items
- `InteractiveMarkdownView.swift`: Renders checkboxes with SwiftUI controls
- SwiftUI bindings to keep editor and preview in sync

### Line-by-Line Updates

Checkboxes are toggled by:
1. Identifying the line number of the clicked checkbox
2. Finding the checkbox syntax in that line
3. Replacing `[ ]` with `[x]` or vice versa
4. Updating the document's text property

### Performance

The checkbox parser runs efficiently on document changes and only processes lines containing checkbox syntax, making it suitable for large documents with many checkboxes.

## Limitations

Currently, the feature has these limitations:

1. Checkboxes must be at the start of list items
2. Nested checkboxes are supported but each line is processed independently
3. Checkboxes inside code blocks or other special markdown blocks may not be interactive

## Future Enhancements

Potential improvements for future versions:

- Checkbox statistics (e.g., "3 of 10 tasks completed")
- Filter view to show only unchecked items
- Keyboard shortcuts for toggling checkboxes
- Custom checkbox styles and themes
- Progress indicators for checkbox groups
