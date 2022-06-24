//
//  DetailInteractor.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation


protocol DetailBusinessLogic {
    func selectItemMethod()
}

protocol DetailDataStore {
  var item: ItemDomain? { get set }
}

final class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    let presenter: DetailPresentationLogic
    let worker: DetailWorkingLogic
    var item: ItemDomain?
    
    init(presenter: DetailPresentationLogic, worker: DetailWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func selectItemMethod() {
        if let itemNN = item {
            presenter.presentItemDetail(item ?? itemNN)
        }
    }
}
