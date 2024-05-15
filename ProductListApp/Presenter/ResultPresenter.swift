//
//  ResultPresenter.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 14/05/24.
//

import UIKit
import os.log

protocol ResultPresenterProtocol: AnyObject {
    var products: [Product] { get set }
    func numberOfItems() -> Int
    func getProducts(searchText: String)
    func productsDidFail(error: Error)
}

class ResultPresenter: ResultPresenterProtocol {

    var products: [Product] = []
    var interactor: ResultInteractorProtocol?
    weak var viewController: ResultViewController?
    weak var coordinatorDelegate: ResultPresenterDelegateProtocol?
    
    init(searchText: String) {
        getProducts(searchText: searchText)
    }
    
    func numberOfItems() -> Int {
        return products.count
    }
    
    func getProducts(searchText: String) {
        interactor?.getProducts(searchText: searchText)
    }
    
    func didSelectItem() {
        os_log("ResultPresenter: submit(): search=%{PUBLC}@", log: OSLog.businessLogic, type: .debug)
        self.coordinatorDelegate?.didSelectItem()
    }
    
    func productsDidFail(error: Error) {
        viewController?.didNotFetchProducts()
    }
}
