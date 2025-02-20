//
//  NetworkError.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 18/2/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidRequest
    case invalidResponse
    case clientError(statusCode: Int)
    case serverError(statusCode: Int)
    case unknownError
    case noData
    case decodingError
    case noResult
    case invalidInput(message: String)
    
    var alertTitle: String {
        switch self {
        case .invalidURL:
            return Constants.AlertTitles.invalidURL
        case .invalidRequest:
            return Constants.AlertTitles.invalidRequest
        case .invalidResponse:
            return Constants.AlertTitles.invalidResponse
        case .clientError:
            return Constants.AlertTitles.clientError
        case .serverError:
            return Constants.AlertTitles.serverError
        case .unknownError:
            return Constants.AlertTitles.unknownError
        case .noData:
            return Constants.AlertTitles.noData
        case .decodingError:
            return Constants.AlertTitles.decodingError
        case .noResult:
            return Constants.AlertTitles.noResult
        case .invalidInput:
            return Constants.AlertTitles.invalidInput
        }
    }
    
    func handleError(error: NetworkError) -> String {
        var errorMessage = ""
        switch error {
        case .invalidURL:
            errorMessage = Constants.ErrorMessages.invalidURL
        case .invalidRequest:
            errorMessage = Constants.ErrorMessages.invalidRequest
        case .invalidResponse:
            errorMessage = Constants.ErrorMessages.invalidResponse
        case .clientError(let statusCode):
            errorMessage = "\(Constants.ErrorMessages.clientError) - \(statusCode)."
        case .serverError(let statusCode):
            errorMessage = "\(Constants.ErrorMessages.serverError) - \(statusCode)."
        case .unknownError:
            errorMessage = Constants.ErrorMessages.unknownError
        case .noData:
            errorMessage = Constants.ErrorMessages.noData
        case .decodingError:
            errorMessage = Constants.ErrorMessages.decodingError
        case .noResult:
            errorMessage = Constants.ErrorMessages.noResult
        case .invalidInput(let message):
            errorMessage = "\(message) - \(Constants.ErrorMessages.invalidInput)"
        }
        return errorMessage
    }
}

