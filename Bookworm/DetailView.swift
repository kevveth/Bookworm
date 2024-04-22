//
//  DetailView.swift
//  Bookworm
//
//  Created by Kenneth Oliver Rathbun on 4/21/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.title)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
                
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    // This allows the preview to work with SwiftData
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example =  Book(title: "Shoe Dog", author: "Phil Knight", genre: "Thriller", review: "Great book!", rating: 5)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create a preview: \(error.localizedDescription)")
    }
}
