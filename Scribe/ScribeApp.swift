//
//  ScribeApp.swift
//  Scribe
//
//  A document-based Markdown viewer and editor for macOS
//

import SwiftUI

@main
struct ScribeApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MarkdownDocument()) { file in
            ContentView(document: file.$document)
        }
        .commands {
            // Add custom commands here if needed
            CommandGroup(replacing: .help) {
                Button("Scribe Help") {
                    // Open help documentation
                }
            }
        }
    }
}
