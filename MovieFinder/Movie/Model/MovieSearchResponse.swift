//
//  Movie.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 18/2/25.
//

import Foundation

struct MovieSearchResponse: Codable {
    let response: String
    let error: String?
    let search: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case search = "Search"
        case error = "Error"
    }
}

struct Movie: Codable {
    let title: String?
    let year: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
}
