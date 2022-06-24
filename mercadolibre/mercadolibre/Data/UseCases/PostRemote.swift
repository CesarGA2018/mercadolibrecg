//
//  Auth.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
public final class PostRemote {
    public let url: URL
    public let body: Data?
    public let headers: [String:String]?
    
    init(url: URL, body: Data?, headers: [String:String]?) {
        self.url = url
        self.body = body
        self.headers = headers
    }
}
