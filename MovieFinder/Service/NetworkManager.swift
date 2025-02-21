//
//  NetworkManager.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 18/2/25.
//

import Foundation

protocol NetworkService {
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class NetworkManager: NetworkService {
    
    func fetchData<T:Decodable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.invalidRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                let code = response.statusCode
                switch code {
                case 400...499:
                    completion(.failure(.clientError(statusCode: response.statusCode)))
                case 500...599:
                    completion(.failure(.serverError(statusCode: response.statusCode)))
                default:
                    completion(.failure(.unknownError))
                }
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
