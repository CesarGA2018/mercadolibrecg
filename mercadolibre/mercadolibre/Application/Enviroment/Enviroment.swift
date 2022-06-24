//
//  Enviroment.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
public final class Enviroment {
    public enum EnviromentVariables: String {
        case apiBaseURL = "API_BASE_URL"
        case site = "SITE"
        case grantType = "GRANTTYPE"
        case clientID = "CLIENTID"
        case clientSecret = "CLIENTSECRET"
        case redirectURI = "REDIRECTURL"
        case refreshToken = "REFRESHTOKEN"
    }
    
    public static func variable(_ key: EnviromentVariables) -> String {
        return Bundle.main.infoDictionary![key.rawValue] as! String
    }
}
