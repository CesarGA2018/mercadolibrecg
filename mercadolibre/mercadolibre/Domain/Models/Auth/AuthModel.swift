//
//  AuthModel.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
public struct AuthModel: Model {
    public let accessToken, tokenType: String
    public let expiresIn: Int
    public let scope: String
    public let userID: Int
    public let refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case scope
        case userID = "user_id"
        case refreshToken = "refresh_token"
    }
}
