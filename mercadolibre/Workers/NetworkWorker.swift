//
//  NetworkWorker.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation


protocol NetworkLogicGet {
    func callService(url: URL, queryItems: [String : String]?, method: NetworksMethods, headers:[String:String]?) async throws -> (Data, URLResponse)
}

protocol NetworkLogicPost {
    func callService(url: URL, dataIn: Data?, method: NetworksMethods, headers:[String:String]?) async throws -> (Data, URLResponse)
}

public final class NetworkWorker: NetworkLogicGet, NetworkLogicPost {
    public init() { }
    // Para llamar servicios GET con QueryParams
    public func callService(url: URL, queryItems: [String : String]?, method: NetworksMethods, headers:[String:String]? = nil) async throws -> (Data, URLResponse) {
        var serviceURL = URLComponents(url: url, resolvingAgainstBaseURL: true)
        serviceURL?.queryItems = NetworkWorker.buildQueryItems(params: queryItems ?? [:])
        
        guard let componentURL = serviceURL?.url else {
            throw NetworkErrors.invalidURL
        }
        
        var request = URLRequest(url: componentURL)
        request.httpMethod = method.rawValue
        if let heads = headers {
            for (value, label) in heads {
                request.addValue(value, forHTTPHeaderField: label)
            }
        }
        return try await callServiceGeneric(request: request)
    }
    
    // Para llamar servicios POST con Body
    public func callService(url: URL, dataIn: Data?, method: NetworksMethods, headers:[String:String]? = nil) async throws -> (Data, URLResponse) {
        let serviceURL = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard let componentURL = serviceURL?.url else {
            throw NetworkErrors.invalidURL
        }
        
        var request = URLRequest(url: componentURL)
        request.httpMethod = method.rawValue
        request.httpBody = dataIn
        if let heads = headers {
            for (label, value) in heads {
                request.addValue(value, forHTTPHeaderField: label)
            }
        }
        return try await callServiceGeneric(request: request)
        
    }
    
    private func callServiceGeneric(request:URLRequest) async throws -> (Data, URLResponse) {
        do {
            let (data,response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkErrors.badRequest
            }
            
            switch httpResponse.statusCode {
                case 200...299: return (data,response)
                case 401: throw NetworkErrors.unauthorized
                case 403: throw NetworkErrors.forbidden
                case 400...499: throw NetworkErrors.badRequest
                case 500...599: throw NetworkErrors.serverError
                default: throw NetworkErrors.noConnectivity
            }
            
        } catch {
            print(error)
            throw NetworkErrors.badRequest
        }
    }
    
    private static func buildQueryItems(params: [String:String]) -> [URLQueryItem] {
        let items = params.map({URLQueryItem(name: $0, value: $1)})
        return items
    }
}
