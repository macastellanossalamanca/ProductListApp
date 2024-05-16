//
//  MockNetworkManager.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 16/05/24.
//

import Foundation
@testable import ProductListApp

class MockNetworkManager: NetworkManager {
    
    var countryCode: String = "CO"
    var searchSuccess = true
    var imageSuccess = true
    
    private(set) var product = [Product(id: "id1", title: "title1", price: 1, thumbnail: "url", thumbnailData: nil)]

    func getSearchResults(q: String, completion: @escaping (Result<[Product], APIError>) -> Void) {
        if searchSuccess {
            completion(.success(product))
        } else {
            completion(.failure(APIError.defaultError))
        }
    }
    
    func getImage(url: String, completion: @escaping (Result<Data, APIError>) -> Void) {
        if imageSuccess {
            completion(.success(Data()))
        } else {
            completion(.failure(APIError.defaultError))
        }
    }
    
    func getItem(withId id: String, completion: @escaping (Result<ProductDetail, APIError>) -> Void) {
    }
}
