//
//  PreviewContainer.swift
//  Bookworm
//
//  Created by Kenneth Oliver Rathbun on 4/22/24.
//

import Foundation
import SwiftData

// A struct to manage data models for previews
struct PreviewContainer {
    // The ModelContainer instance used to interact with data models
    let container: ModelContainer!
    
    // Initializes a PreviewContainer with the given model types and storage configuration
    init(_ types: [any PersistentModel.Type], isStoredInMemoryOnly: Bool = true) {
        // Create a schema to define the structure of the data models
        let schema = Schema(types)
        
        // Create a configuration for the ModelContainer
        let config = ModelConfiguration(isStoredInMemoryOnly: isStoredInMemoryOnly)
        
        // Attempt to create the ModelContainer with the schema and configuration
        self.container = try! ModelContainer(for: schema, configurations: [config])
    }
    
    // Adds an array of items (conforming to PersistentModel) to the container
    func add(items: [any PersistentModel]) {
        // Asynchronously adds each item to the container's main context on the main thread
        Task { @MainActor in
            items.forEach { container.mainContext.insert($0) }
        }
    }
}
