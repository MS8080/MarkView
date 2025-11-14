//
//  InteractiveMarkdownView.swift
//  Scribe
//
//  Interactive Markdown view with clickable checkboxes
//

import SwiftUI
import MarkdownUI

struct InteractiveMarkdownView: View {
    let text: String
    @Binding var documentText: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                renderInteractiveMarkdown()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }

    @ViewBuilder
    private func renderInteractiveMarkdown() -> some View {
        let lines = text.components(separatedBy: .newlines)

        ForEach(Array(lines.enumerated()), id: \.offset) { lineNumber, line in
            if isCheckboxLine(line) {
                CheckboxLineView(
                    line: line,
                    lineNumber: lineNumber,
                    onToggle: {
                        toggleCheckbox(at: lineNumber)
                    }
                )
            } else {
                // Render non-checkbox lines with Markdown
                Markdown(line)
                    .markdownTheme(.gitHub)
            }
        }
    }

    private func isCheckboxLine(_ line: String) -> Bool {
        line.range(of: #"^(\s*[-*+]\s+\[)([ xX])(\])"#, options: .regularExpression) != nil
    }

    private func toggleCheckbox(at lineNumber: Int) {
        documentText = CheckboxHelper.toggleCheckboxAtLine(lineNumber, in: documentText)
    }
}

struct CheckboxLineView: View {
    let line: String
    let lineNumber: Int
    let onToggle: () -> Void

    @State private var isChecked: Bool

    init(line: String, lineNumber: Int, onToggle: @escaping () -> Void) {
        self.line = line
        self.lineNumber = lineNumber
        self.onToggle = onToggle

        // Determine initial checked state
        let checked = line.contains("[x]") || line.contains("[X]")
        _isChecked = State(initialValue: checked)
    }

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            // Interactive checkbox
            Button(action: {
                isChecked.toggle()
                onToggle()
            }) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .accentColor : .secondary)
                    .font(.system(size: 16))
            }
            .buttonStyle(.plain)

            // Render the checkbox text (without the checkbox syntax)
            if let textContent = extractCheckboxText(from: line) {
                Markdown(textContent)
                    .markdownTheme(.gitHub)
            }
        }
        .padding(.vertical, 2)
        .onChange(of: line) { newLine in
            // Update checked state if the line changes externally
            isChecked = newLine.contains("[x]") || newLine.contains("[X]")
        }
    }

    private func extractCheckboxText(from line: String) -> String? {
        // Remove the checkbox syntax and return just the text
        if let range = line.range(of: #"^(\s*[-*+]\s+\[[ xX]\]\s*)"#, options: .regularExpression) {
            var text = line
            text.removeSubrange(range)
            return text
        }
        return nil
    }
}
