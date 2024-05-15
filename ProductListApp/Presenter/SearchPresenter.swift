//
//  Presenter.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import UIKit
import OSLog

protocol SearchPresenterProtocol: AnyObject {
    func searchProducts(searchText: String)
}

class SearchPresenter: SearchPresenterProtocol {
    
    var interactor: SearchInteractorProtocol?
    var router: RouterProtocol?
    weak var viewController: SearchViewController?
    weak var coordinatorDelegate: SearchPresenterDelegateProtocol?
    
    func searchProducts(searchText: String) {
        os_log("SearchPresenter: submit(): search=%{PUBLC}@", log: OSLog.buisnessLogic, type: .debug, searchText)
        self.coordinatorDelegate?.searchDidFinish(searchText: searchText)
    }
}
