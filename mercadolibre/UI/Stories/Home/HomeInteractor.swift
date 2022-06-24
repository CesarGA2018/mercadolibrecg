//
//  HomeInteractor.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation

protocol HomeBusinessLogic {
    func search(_ q: String ) async throws
    func selectItemMethod(index: Int)
}

protocol HomeDataStore {
    var searchResult: SearchDmain { get }
    var selectItem: ItemDomain? { get }
}

final class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    let presenter: HomePresentationLogic
    let worker: HomeWorkingLogic
    var searchResult: SearchDmain = SearchDmain(siteID: "MLA", query: "", results: [])
    var selectItem: ItemDomain?
    
    init(presenter: HomePresentationLogic, worker: HomeWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func search(_ q: String) async throws {
        do {
            let result = try await worker.search(q: q)
            self.searchResult = result
            try await self.presenter.presentSearch(viewModel: self.searchResult)
        } catch {
            print(error)
        }
    }
    
    func selectItemMethod(index: Int) {
        guard !searchResult.results.isEmpty, index < searchResult.results.count else {
          return
        }
        selectItem = searchResult.results[index]
    }
}
