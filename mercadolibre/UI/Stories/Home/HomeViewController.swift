//
//  HomeViewController.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func searchResponse(viewModel: SearchDmain) async throws
}

class HomeViewController: UIViewController, Storyboarded {
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var searchInput: UISearchBar!
    @IBOutlet weak var vwStarSearch: UIView!
    @IBOutlet weak var vwEmptySearch: UIView!
    @IBOutlet weak var vwResultSearch: UIView!
    @IBOutlet weak var tblSearch: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var vwLoadingIndicator: UIView!
    
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
    var searchResult: SearchDmain = SearchDmain(siteID: "MLA", query: "", results: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    private func configure() {
        self.title = "Inicio"
        self.backgroundView.backgroundColor = UIColor.white
        self.searchInput.delegate = self
        
        self.vwEmptySearch.isHidden = true
        self.vwResultSearch.isHidden = true
        self.vwStarSearch.isHidden = false
    }
    
    private func requestToSelectItem(by indexPath: Int) {
      interactor?.selectItemMethod(index: indexPath)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        print("end searching --> Close Keyboard")
        self.searchInput.endEditing(true)
        Task {
            do {
                try await interactor?.search(self.searchInput.text ?? "")
            } catch {
                print(error)
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.vwEmptySearch.isHidden = true
            self.vwResultSearch.isHidden = true
            self.vwStarSearch.isHidden = false
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResult.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemsel = self.searchResult.results[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = itemsel.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        requestToSelectItem(by: indexPath.row)
        router?.routeToDetail()
    }
}

extension HomeViewController: HomeDisplayLogic {
    func searchResponse(viewModel: SearchDmain) async throws {
        self.searchResult = viewModel
        if viewModel.results.count > 0 {
            self.vwEmptySearch.isHidden = true
            self.vwResultSearch.isHidden = false
            self.tblSearch.reloadData()
        } else {
            self.vwEmptySearch.isHidden = false
            self.vwResultSearch.isHidden = true
        }
    }
}
