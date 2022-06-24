//
//  DetailPresenter.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
protocol DetailPresentationLogic {
  func presentItemDetail(_ response: ItemDomain)
}

final class DetailPresenter: DetailPresentationLogic {
    
    var viewController: DetailDisplayLogic
    init(_ viewController: DetailDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentItemDetail(_ response: ItemDomain) {
        viewController.searchResponse(viewModel: response)
    }
}
