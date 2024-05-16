//
//  MockPresenter.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

@testable import ProductListApp

class MockPresenter: SearchPresenterProtocol {
    var country: String?
    
    func searchProducts(searchText: String) {
        
    }
    
    func updateLocation(country: String) {
        self.country = country
    }
}
