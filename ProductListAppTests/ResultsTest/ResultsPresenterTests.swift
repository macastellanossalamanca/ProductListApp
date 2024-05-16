//
//  ResultsPresenterTests.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 16/05/24.
//

import XCTest
@testable import ProductListApp

class ResultsPresenterTest: XCTestCase {
    
    var interactor: MockResulInteractor!
    var presenter: ResultPresenter!
    var networkManager: MockNetworkManager!
    let results = [
        Product(id: "1", title: "Title1", price: 1, thumbnail: "url1", thumbnailData: nil),
        Product(id: "2", title: "Title2", price: 2, thumbnail: "url2", thumbnailData: nil),
        Product(id: "3", title: "Title3", price: 3, thumbnail: "url3", thumbnailData: nil),
        Product(id: "4", title: "Title4", price: 4, thumbnail: "url4", thumbnailData: nil),
        Product(id: "5", title: "Title5", price: 5, thumbnail: "url5", thumbnailData: nil),
    ]

    override func setUpWithError() throws {
        interactor = MockResulInteractor()
        networkManager = MockNetworkManager()
        presenter = ResultPresenter(searchText: "")
        
        interactor.networkManager = networkManager
        presenter.interactor = interactor
    }

    override func tearDownWithError() throws {
        interactor = nil
        interactor = nil
        networkManager = nil
    }

    func testGetProductsSuccess() {
        networkManager.searchSuccess = true
        presenter.getProducts(searchText: "")

        XCTAssertTrue(interactor.didGetResults)
    }
    
    func testGetProductsFail() {
        networkManager.searchSuccess = false
        presenter.getProducts(searchText: "")

        XCTAssertFalse(interactor.didGetResults)
    }
}
