//
//  MakeSearch.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
func makeRemoteSearch(httpClient: NetworkLogicGet) -> GetRemote {
    let remoteSearch = GetRemote(url: makeApiUrl(path: "sites/\(Enviroment.variable(.site))/search"), params: nil, headers: nil)
    return remoteSearch
}
