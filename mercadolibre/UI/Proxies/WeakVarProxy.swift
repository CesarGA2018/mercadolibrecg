//
//  WeakVarProxy.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation

final class WeakVarProxy<T: AnyObject> {
    private weak var instance: T?
    
    init (_ instance: T) {
        self.instance = instance
    }
}

extension WeakVarProxy: HomeDisplayLogic where T: HomeDisplayLogic {
    func searchResponse(viewModel: SearchDmain) async throws {
        do {
            try await instance?.searchResponse(viewModel: viewModel)
        } catch {
            print(error)
        }
    }
}

extension WeakVarProxy: DetailDisplayLogic where T: DetailDisplayLogic {
    func searchResponse(viewModel: ItemDomain) {
        instance?.searchResponse(viewModel: viewModel)
    }
}
