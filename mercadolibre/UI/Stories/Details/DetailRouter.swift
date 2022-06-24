//
//  DetailRouter.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation

protocol DetailRoutingLogic { }

protocol DetailDataPassing {
  var dataStore: DetailDataStore? { get }
}

final class DetailRouter: DetailRoutingLogic, DetailDataPassing {
    var viewController: DetailViewController
    var dataStore: DetailDataStore?
    
    init(_ viewController: DetailViewController, dataStore: DetailDataStore){
        self.viewController = viewController
        self.dataStore = dataStore
    }
}
