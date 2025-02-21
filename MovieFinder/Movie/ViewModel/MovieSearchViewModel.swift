//
//  MovieListViewModel.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 18/2/25.
//

import Foundation

protocol MovieSearchViewModelDelegate: AnyObject {
    func didFetchMovies(_ movies: [Movie])
    func didFailWithError(_ error: NetworkError)
}

class MovieSearchViewModel {
    
    weak var delegate: MovieSearchViewModelDelegate?
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getMovieList(movieSearchString: String) {
        Task {
            do {
                let movieResponse: MovieSearchResponse = try await networkService.fetchData(urlString: movieSearchString)
                
                if movieResponse.response == Constants.successfulResponse {
                    if let movies = movieResponse.search, !movies.isEmpty {
                        self.delegate?.didFetchMovies(movies)
                    } else {
                        self.delegate?.didFailWithError(.noResult)
                    }
                } else {
                    if let errorMessage = movieResponse.error {
                        self.delegate?.didFailWithError(.invalidInput(message: errorMessage))
                    }
                }
            } catch {
                self.delegate?.didFailWithError(.unknownError)
            }
        }
    }
}
