//
//  NetworkManager.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 18/2/25.
//

import Foundation

protocol NetworkService {
    func fetchData<T: Decodable>(urlString: String) async throws -> T
}

class NetworkManager: NetworkService {
    
    func fetchData<T:Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            let code = httpResponse.statusCode
            switch code {
            case 400...499:
                throw NetworkError.clientError(statusCode: code)
            case 500...599:
                throw NetworkError.serverError(statusCode: code)
            default:
                throw NetworkError.unknownError
            }
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError
        }
    }
}
