//
//  SwiftDataViewer.swift
//  Bookworm
//
//  Created by Kenneth Oliver Rathbun on 4/22/24.
//

import Foundation
import SwiftData
import SwiftUI

// A generic view that displays content and optionally manages data models for previews using a PreviewContainer
struct SwiftDataViewer<Content: View>: View {
    // The content view to be displayed
    private let content: Content
    
    // An optional array of persistent models to be added to the preview container
    private let items: [any PersistentModel]?
    
    // The PreviewContainer instance used to manage data models
    private let preview: PreviewContainer
    
    // Initializes a SwiftDataViewer with the content view, optional data models, and a PreviewContainer
    init(preview: PreviewContainer, items: [any PersistentModel]? = nil, @ViewBuilder _ content: () -> Content) {
        self.preview = preview
        self.items = items
        self.content = content()
    }
    
    var body: some View {
        // Displays the content view
        content
        // Injects the model container from the preview container
            .modelContainer(preview.container)
        // Optionally adds the provided items to the container on appear
            .onAppear {
                if let items = items {
                    preview.add(items: items)
                }
            }
    }
}
