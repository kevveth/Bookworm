//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Kenneth Oliver Rathbun on 4/19/24.
//

import SwiftUI

@main
struct BookwormApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
