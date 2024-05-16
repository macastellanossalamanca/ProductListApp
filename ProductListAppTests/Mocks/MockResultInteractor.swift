//
//  MockResultInteractor.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 16/05/24.
//

@testable import ProductListApp

class MockResulInteractor: ResultInteractorProtocol {
    
    var networkManager = MockNetworkManager()
    var didGetResults = false
    
    func getProducts(searchText: String) {
        networkManager.getSearchResults(q: searchText) { response in
            switch response {
            case .success(_):
                self.didGetResults = true
            case .failure(_):
                self.didGetResults = false
            }
        }
    }
}
