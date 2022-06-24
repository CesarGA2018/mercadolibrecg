//
//  HomePresenter.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
import UIKit

protocol HomePresentationLogic {
    func presentSearch(viewModel: SearchDmain) async throws
}

final class HomePresenter: HomePresentationLogic {
    // MARK: - Public

    var viewController: HomeDisplayLogic

    init(_ viewController: HomeDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentSearch(viewModel: SearchDmain) async throws {
        try await viewController.searchResponse(viewModel: viewModel)
    }
    // MARK: - HomePresentationLogic
}
