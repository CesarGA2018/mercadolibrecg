//
//  MakingAuthReq.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
func makeAuthToken() -> AuthViewModel {
    let viewModel = AuthViewModel(grantType: Enviroment.variable(.grantType), clientID: Enviroment.variable(.clientID), clientSecret: Enviroment.variable(.clientSecret), redirectURI: Enviroment.variable(.redirectURI), refreshToken: Enviroment.variable(.refreshToken))
    return viewModel
}
