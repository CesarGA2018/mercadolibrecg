//
//  MakingUrl.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
func makeApiUrl(path: String) -> URL {
    return URL(string: "\(Enviroment.variable(.apiBaseURL))/\(path)")!
}
