//
//  ContentView.swift
//  Scribe
//
//  Main view with split editor and preview panes
//

import SwiftUI
import MarkdownUI

struct ContentView: View {
    @Binding var document: MarkdownDocument
    @State private var showEditorPane = true

    var body: some View {
        VStack(spacing: 0) {
            // Toolbar with toggle control
            HStack {
                Spacer()
                Toggle(isOn: $showEditorPane) {
                    Text("Show Editor")
                }
                .toggleStyle(.switch)
                .padding()
            }
            .background(Color(NSColor.windowBackgroundColor))

            // Main content area
            if showEditorPane {
                // Split view: Editor on left, Preview on right
                HSplitView {
                    // Left pane: Markdown editor
                    EditorPane(text: $document.text)
                        .frame(minWidth: 300)

                    // Right pane: Rendered preview
                    PreviewPane(documentText: $document.text)
                        .frame(minWidth: 300)
                }
            } else {
                // Preview-only mode
                PreviewPane(documentText: $document.text)
            }
        }
    }
}

// MARK: - Editor Pane

struct EditorPane: View {
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            Text("Editor")
                .font(.headline)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(NSColor.controlBackgroundColor))

            // Text Editor
            TextEditor(text: $text)
                .font(.system(.body, design: .monospaced))
                .padding(8)
                .background(Color(NSColor.textBackgroundColor))
        }
    }
}

// MARK: - Preview Pane

struct PreviewPane: View {
    @Binding var documentText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            Text("Preview")
                .font(.headline)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(NSColor.controlBackgroundColor))

            // Interactive Markdown Preview with clickable checkboxes
            InteractiveMarkdownView(text: documentText, documentText: $documentText)
                .background(Color(NSColor.textBackgroundColor))
        }
    }
}

// MARK: - Preview Provider

#Preview {
    ContentView(document: .constant(MarkdownDocument(text: """
    # Welcome to Scribe

    This is a **Markdown** viewer and editor.

    ## Features

    - Live preview
    - Split view editing
    - Full Markdown support
    - Interactive checkboxes

    ## Todo List

    - [ ] Try editing text
    - [x] Click checkboxes to toggle
    - [ ] Test the preview

    ### Code Blocks

    ```swift
    func hello() {
        print("Hello, World!")
    }
    ```

    ### Tables

    | Feature | Status |
    |---------|--------|
    | Editor  | Done   |
    | Preview | Done   |
    | Tables  | Done   |
    """)))
}
