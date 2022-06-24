//
//  HomeRouters.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import UIKit
protocol HomeRoutingLogic {
  func routeToDetail()
}

protocol HomeDataPassing {
  var dataStore: HomeDataStore { get }
}


final class HomeRouter: HomeRoutingLogic, HomeDataPassing {
    
    var viewController: HomeViewController
    var dataStore: HomeDataStore
    
    init(_ viewController: HomeViewController, dataStore: HomeDataStore){
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    
    func routeToDetail() {
        let controller = DetailViewController.instantiate()
        
        //  let networkWorker = NetworkWorker()
        let detailWorker = DetailWorker()
        let detailPresenter = DetailPresenter(WeakVarProxy(controller))
        let detailInteractor = DetailInteractor(presenter: detailPresenter, worker: detailWorker)
        let detailRouter = DetailRouter(controller, dataStore: detailInteractor)
        controller.interactor = detailInteractor
        controller.router = detailRouter
        
        guard var detailDataStore = controller.router?.dataStore else {
          return
        }
        
        passDataToPosts(destination: &detailDataStore)
        navigateToDetail(destination: controller)
    }
    
    // MARK: - Navigation

    private func navigateToDetail(destination: DetailViewController) {
      viewController.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - Passing data

    private func passDataToPosts(destination: inout DetailDataStore) {
        destination.item = dataStore.selectItem
    }
}
