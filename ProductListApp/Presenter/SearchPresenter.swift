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
}

class SearchPresenter: SearchPresenterProtocol {
    
    var interactor: SearchInteractorProtocol?
    weak var viewController: SearchViewController?
    weak var coordinatorDelegate: SearchPresenterDelegateProtocol?
    
    func searchProducts(searchText: String) {
        os_log("SearchPresenter: submit(): search=%{PUBLC}@", log: OSLog.businessLogic, type: .debug, searchText)
        self.coordinatorDelegate?.searchDidFinish(searchText: searchText)
    }
}
