//
//  Constants.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 19/2/25.
//

import Foundation
import UIKit

struct Constants {
    struct AlertMovieSearch {
        static let title = "Missing Movie Title"
        static let message = "Please enter a movie title in the search field and try again."
        static let actionTitle = "OK"
    }
    
    struct CellIdentifiers {
        static let movieCell = "movieCell"
    }
    
    struct ImageNames {
        static let placeholder = "placeholder"
    }
    
    struct ViewLayerConstants {
        struct MoviePoster {
            static let cornerRadius: CGFloat = 10.0
            static let masksToBounds: Bool = true
            static let borderWidth: CGFloat = 2.0
            static let borderColor: CGColor = UIColor.black.cgColor
        }
    }
    
    struct AlertTitles {
        static let invalidURL = "Invalid URL"
        static let invalidRequest = "Invalid Request"
        static let invalidResponse = "Invalid Response"
        static let clientError = "Client Error"
        static let serverError = "Server Error"
        static let unknownError = "Unknown Error"
        static let noData = "No Data"
        static let decodingError = "Decoding Error"
        static let noResult = "No Movies"
        static let invalidInput = "Invalid Input"
    }
    
    struct ErrorMessages {
        static let invalidURL = "The URL is invalid."
        static let invalidRequest = "There was an issue with the request."
        static let invalidResponse = "The response from the server is invalid."
        static let clientError = "Client error occurred. Please try again."
        static let serverError = "Server error occurred. Please try again later."
        static let unknownError = "An unknown error occurred."
        static let noData = "No data was returned from the server."
        static let decodingError = "Failed to decode the data."
        static let noResult = "No movies are found with given serach text. Please try again with another search text."
        static let invalidInput = "Please try again"
    }
    
    static let successfulResponse = "True"
}
