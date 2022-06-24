//
//  DetailViewController.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import UIKit

protocol DetailDisplayLogic: AnyObject {
    func searchResponse(viewModel: ItemDomain)
}

class DetailViewController: UIViewController, Storyboarded {
    @IBOutlet weak var lblNameProduct: UILabel!
    
    var interactor: DetailBusinessLogic?
    var router: (DetailRoutingLogic & DetailDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        interactor?.selectItemMethod()
    }
    
    private func configure() {
        self.title = "Detalle"
    }
}


extension DetailViewController: DetailDisplayLogic {
    func searchResponse(viewModel: ItemDomain) {
        lblNameProduct.text = viewModel.title
    }
}
