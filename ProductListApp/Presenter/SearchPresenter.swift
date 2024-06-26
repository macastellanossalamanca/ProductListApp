//
//  Presenter.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import UIKit
import os.log

protocol SearchPresenterProtocol: AnyObject {
    func searchProducts(searchText: String)
    func updateLocation(country: String)
}

class SearchPresenter: SearchPresenterProtocol {
    
    var interactor: SearchInteractorProtocol?
    weak var viewController: SearchViewController?
    weak var coordinatorDelegate: SearchPresenterDelegateProtocol?
    var country: String?
    
    func searchProducts(searchText: String) {
        os_log("SearchPresenter: submit(): search=%{PUBLC}@", log: OSLog.businessLogic, type: .debug, searchText)
        self.coordinatorDelegate?.searchDidFinish(searchText: searchText, country: country ?? "")
    }
    
    func updateLocation(country: String) {
        self.country = country
    }
}
