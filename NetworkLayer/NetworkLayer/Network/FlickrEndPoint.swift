//
//  FlickrEndPoint.swift
//  NetworkLayer
//
//  Created by Григорий Виняр on 07.07.2021.
//

import Foundation

enum FlickrEndpoint: Endpoint {
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return ""
        }
    }
    
    var path: String {
        switch self {
        default:
            return ""
        }
    }
    
    var method: HTTPMethods {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }
    
    var headers: [String : String] {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
