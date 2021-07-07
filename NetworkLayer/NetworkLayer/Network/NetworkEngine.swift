//
//  NetworkEngine.swift
//  NetworkLayer
//
//  Created by Григорий Виняр on 07.07.2021.
//

import Foundation

protocol NetworkEngineProtocol {
    static func request<T: Codable>(endpoint: Endpoint, object: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkEngine: NetworkEngineProtocol {
    
    static func request<T: Codable>(endpoint: Endpoint, object: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = components.percentEncodedQuery?.data(using: .utf8)
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard response != nil, let data = data else { return }
            
            if let object = try? JSONDecoder().decode(object, from: data) {
                
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            } else {
                let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode this object"])
                completion(.failure(error))
            }
            
        }
        dataTask.resume()
    }
}
