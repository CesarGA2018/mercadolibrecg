//
//  NetworkErrors.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation

public enum NetworkErrors: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
    case invalidURL
    case couldNotDecodeData
}
