//
//  Endpoint.swift
//  NetworkLayer
//
//  Created by Григорий Виняр on 07.07.2021.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol Endpoint {
    
    var scheme: String { get }
    
    var baseURL: String { get }
    
    var path: String { get }
    
    var method: HTTPMethods { get }
    
    var parameters: [URLQueryItem] { get }
    
    var headers: [String : String] { get }
}
