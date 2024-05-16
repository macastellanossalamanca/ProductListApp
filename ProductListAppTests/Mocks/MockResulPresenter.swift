//
//  MockResulPresenter.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 16/05/24.
//

@testable import ProductListApp

final class MockResultPresenter: ResultPresenterProtocol {
    
    var products: [ProductListApp.Product] = []
    var didFetchedCalled = false
    var didLoad = false
    var didFailed = false
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func itemAt(index: Int) -> ProductListApp.Product? {
        return Product(id: "id", title: "title", price: 10000, thumbnail: "url")
    }
    
    func getProducts(searchText: String) {
        didLoad = true
    }
    
    func productsDidFail(error: Error) {
        didFailed = true
    }
    
    func productsDidFetch() {
        didFetchedCalled = true
    }
    
    func load() {
        getProducts(searchText: "")
    }
    
    
}
