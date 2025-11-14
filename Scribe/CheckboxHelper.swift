//
//  CheckboxHelper.swift
//  Scribe
//
//  Helper for managing interactive checkboxes in Markdown
//

import Foundation

struct CheckboxItem: Identifiable {
    let id = UUID()
    let lineNumber: Int
    let range: Range<String.Index>
    let isChecked: Bool
    let fullLine: String
}

class CheckboxHelper {
    /// Finds all checkbox items in the given markdown text
    static func findCheckboxes(in text: String) -> [CheckboxItem] {
        var checkboxes: [CheckboxItem] = []
        let lines = text.components(separatedBy: .newlines)

        var currentIndex = text.startIndex

        for (lineNumber, line) in lines.enumerated() {
            // Match patterns like "- [ ]" or "- [x]" or "- [X]"
            if let match = line.range(of: #"^(\s*[-*+]\s+\[)([ xX])(\])"#, options: .regularExpression) {
                let checkboxContent = String(line[match])
                let isChecked = checkboxContent.contains("[x]") || checkboxContent.contains("[X]")

                // Calculate the range in the full text
                let lineStartIndex = currentIndex
                let lineEndIndex = text.index(currentIndex, offsetBy: line.count, limitedBy: text.endIndex) ?? text.endIndex

                if let checkboxRange = text.range(of: #"\[[ xX]\]"#, options: .regularExpression, range: lineStartIndex..<lineEndIndex) {
                    checkboxes.append(CheckboxItem(
                        lineNumber: lineNumber,
                        range: checkboxRange,
                        isChecked: isChecked,
                        fullLine: line
                    ))
                }
            }

            // Move to next line (including newline character)
            if let nextIndex = text.index(currentIndex, offsetBy: line.count + 1, limitedBy: text.endIndex) {
                currentIndex = nextIndex
            } else {
                break
            }
        }

        return checkboxes
    }

    /// Toggles a checkbox at the specified range in the text
    static func toggleCheckbox(in text: String, at range: Range<String.Index>) -> String {
        var mutableText = text
        let checkboxContent = String(text[range])

        let newContent: String
        if checkboxContent.contains("x") || checkboxContent.contains("X") {
            newContent = "[ ]"
        } else {
            newContent = "[x]"
        }

        mutableText.replaceSubrange(range, with: newContent)
        return mutableText
    }

    /// Toggles a checkbox at the specified line number
    static func toggleCheckboxAtLine(_ lineNumber: Int, in text: String) -> String {
        let checkboxes = findCheckboxes(in: text)

        if let checkbox = checkboxes.first(where: { $0.lineNumber == lineNumber }) {
            return toggleCheckbox(in: text, at: checkbox.range)
        }

        return text
    }
}
