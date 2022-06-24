//
//  ItemDomain.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
public struct ItemDomain: Model {
    public let id: String
    public let siteID: String
    public let title: String
    public let price: Double
    public let availableQuantity, soldQuantity: Int
    public let stopTime: String
    public let condition: String
    public let permalink: String
    public let thumbnail: String
    public let thumbnailID: String
    public let acceptsMercadopago: Bool
    public let catalogProductID: String?
    public let catalogListing: Bool?
    public let useThumbnailID: Bool
    public let orderBackend: Int

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, price
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case stopTime = "stop_time"
        case condition, permalink, thumbnail
        case thumbnailID = "thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case catalogProductID = "catalog_product_id"
        case catalogListing = "catalog_listing"
        case useThumbnailID = "use_thumbnail_id"
        case orderBackend = "order_backend"
    }
}
