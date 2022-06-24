//
//  AuthDomain.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//
import Foundation
public protocol Auth {
    func authMethod() async throws -> AuthModel
}

public struct AuthViewModel: Model {
    let grantType, clientID, clientSecret: String
    let redirectURI: String
    let refreshToken: String

    
    public init(grantType: String, clientID: String, clientSecret: String, redirectURI: String, refreshToken:String) {
        self.grantType = grantType
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.redirectURI = redirectURI
        self.refreshToken = refreshToken
    }
    
    enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case clientID = "client_id"
        case clientSecret = "client_secret"
        case redirectURI = "redirect_uri"
        case refreshToken = "refresh_token"
    }
}
