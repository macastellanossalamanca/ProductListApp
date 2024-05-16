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
    func itemAt(index: Int) -> Product?
    func getProducts(searchText: String)
    func productsDidFail(error: Error)
    func productsDidFetch()
    func load()
}

class ResultPresenter: ResultPresenterProtocol {

    var products: [Product] = [] {
        didSet {
            productsDidFetch()
        }
    }
    
    var searchText: String
    var interactor: ResultInteractorProtocol?
    weak var viewController: ResultViewController?
    weak var coordinatorDelegate: ResultPresenterDelegateProtocol?
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    func numberOfItems() -> Int {
        return products.count
    }
    
    func itemAt(index: Int) -> Product? {
        if index >= 0 && index < products.count {
            return products[index]
        }
        return nil
    }
    
    func load() {
        getProducts(searchText: searchText)
    }
    
    func getProducts(searchText: String) {
        interactor?.getProducts(searchText: searchText)
    }
    
    func didSelectItem() {
        os_log("ResultPresenter: submit(): search=%{PUBLC}@", log: OSLog.businessLogic, type: .debug)
        self.coordinatorDelegate?.didSelectItem()
    }
    
    func productsDidFetch() {
        viewController?.didFetchProducts()
    }
    
    func productsDidFail(error: Error) {
        viewController?.didNotFetchProducts()
    }
}
