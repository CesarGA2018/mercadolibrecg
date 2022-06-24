//
//  Helper.swift
//  mercadolibreTests
//
//  Created by Cesar Guasca on 24/06/22.
//

import Foundation
import mercadolibre

public enum EnviromentVariables: String {
    case site = "MLA"
    case grantType = "refresh_token"
    case clientID = "3715782785242398"
    case clientSecret = "1Hrd3hdHlcDDBME5cv0mxSWJ2r158BiK"
    case redirectURI = "https://www.google.com"
    case refreshToken = "TG-62b33b61dc53d10013c441df-199880813"
}


func makeAuthToken() -> AuthViewModel {
    let viewModel = AuthViewModel(grantType: EnviromentVariables.grantType.rawValue, clientID: EnviromentVariables.clientID.rawValue, clientSecret: EnviromentVariables.clientSecret.rawValue, redirectURI: EnviromentVariables.redirectURI.rawValue, refreshToken: EnviromentVariables.refreshToken.rawValue)
    return viewModel
}


func makeUrl() -> URL {
    return URL(string: "https://api.mercadolibre.com/oauth/token")!
}


func makeValidData() -> Data {
    return Data("{\"name\":\"any_name\"}".utf8)
}


func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}
