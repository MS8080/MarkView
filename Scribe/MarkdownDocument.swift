//
//  MarkdownDocument.swift
//  Scribe
//
//  Document type for Markdown files
//

import SwiftUI
import UniformTypeIdentifiers

// Define the Markdown UTType
extension UTType {
    static var markdown: UTType {
        UTType(importedAs: "net.daringfireball.markdown")
    }
}

struct MarkdownDocument: FileDocument {
    var text: String

    // Define which file types this document can handle
    static var readableContentTypes: [UTType] {
        [.markdown, .plainText]
    }

    // Initialize with empty text for new documents
    init(text: String = "") {
        self.text = text
    }

    // Read from file
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }

    // Write to file
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
