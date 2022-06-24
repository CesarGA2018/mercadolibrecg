//
//  AppHelper.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import UIKit

struct AppHelper {
    static func createInitialController() -> NavigationController {
        let controller = HomeViewController.instantiate()
        let networkWorker = makeUrlSessionFactory()
        let homeWorker = HomeWorker(networkWorked: networkWorker, autRemote: makeAuth(httpClient: networkWorker, viewModel: makeAuthToken()), searchRemote: makeRemoteSearch(httpClient: networkWorker))
        let homePresenter = HomePresenter(WeakVarProxy(controller))
        let homeInteractor = HomeInteractor(presenter: homePresenter, worker: homeWorker)
        let homeRouter = HomeRouter(controller, dataStore: homeInteractor)
        controller.interactor = homeInteractor
        controller.router = homeRouter
        
        let nav = NavigationController(rootViewController: controller)
        return nav
    }
}
