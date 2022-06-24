//
//  MakingAuth.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
func makeAuth(httpClient: NetworkLogicPost, viewModel: AuthViewModel) -> PostRemote {
    let remoteAuth = PostRemote(url: makeApiUrl(path: "oauth/token"), body: viewModel.toData(), headers: ["content-type":"application/json"])
    return remoteAuth
}
