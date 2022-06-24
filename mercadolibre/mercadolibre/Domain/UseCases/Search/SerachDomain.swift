//
//  SerachDomain.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
public struct SearchDmain: Model {
    public let siteID: String
    public let query: String?
    public let results: [ItemDomain]
    
    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case query, results
    }
}
