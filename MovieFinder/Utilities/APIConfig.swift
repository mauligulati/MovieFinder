//
//  APIConfig.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 18/2/25.
//

import Foundation

struct APIConfig {
    static let apiKey = "8d6aa4ca"
    static let baseURL = "https://www.omdbapi.com/"
    
    static func getSearchURL(for movie: String) -> String {
        return baseURL + "?s=" + movie + "&apikey=" + apiKey
    }
}
