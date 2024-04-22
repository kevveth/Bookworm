//
//  Book.swift
//  Bookworm
//
//  Created by Kenneth Oliver Rathbun on 4/22/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}

extension Book {
    static var phantomTollbooth: Book {
        .init(title: "The Phantom Tollbooth",
              author: "Norton Juster",
              genre: "Fantasy",
              review: "The Phantom Tollbooth is a whimsical adventure that starts with a bored boy named Milo. He stumbles upon a magical tollbooth and embarks on a journey through fantastical lands like Dictionopolis and Digitopolis. Through wordplay, puns, and quirky characters, Milo learns the importance of imagination, knowledge, and friendship. It's a fun and thought-provoking read for all ages!",
              rating: 5)
    }
    
    static var mockingbird: Book {
        .init(title: "To Kill a Mockingbird",
              author: "Harper Lee",
              genre: "Mystery",
              review: "A powerful story about racial injustice and the importance of compassion.",
              rating: 4)
    }
}
