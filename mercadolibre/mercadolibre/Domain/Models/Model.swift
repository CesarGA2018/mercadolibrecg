//
//  Model.swift
//  Domain
//
//  Created by Cesar Guasca on 20/06/22.
//

import Foundation
public protocol Model: Codable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func toJSON() -> [String: Any]? {
        guard let data = self.toData() else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
