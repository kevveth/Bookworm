//
//  ContentView.swift
//  Bookworm
//
//  Created by Kenneth Oliver Rathbun on 4/19/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
        }
    }
}

private extension [Book] {
    static var examples: [Book] = [
        Book.phantomTollbooth,
        Book.mockingbird
    ]
}

#Preview("Bookworm with Data") {
    SwiftDataViewer(preview: PreviewContainer([Book.self]), items: [Book].examples) {
        ContentView()
    }
}

#Preview("Bookworm Empty") {
    SwiftDataViewer(preview: PreviewContainer([Book.self])) {
        ContentView()
    }
}


