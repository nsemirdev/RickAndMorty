//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Emir Alkal on 19.02.2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    enum NetworkError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(_ request: RMRequest, _ type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let req = self.request(from: request) else {
            completion(.failure(NetworkError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: req) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(error ?? NetworkError.failedToGetData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(type.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        return request
    }
}
