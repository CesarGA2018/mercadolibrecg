//
//  Search.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
public final class GetRemote {
    public let url: URL
    public let params: [String:String]?
    public let headers: [String:String]?
    
    init(url: URL, params: [String:String]?, headers: [String:String]?) {
        self.url = url
        self.params = params
        self.headers = headers
    }
}
