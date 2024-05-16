//
//  ResultInteractorTests.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 16/05/24.
//

import XCTest
@testable import ProductListApp

class ResultInteractorTests: XCTestCase {
    
    var networkManager: MockNetworkManager!
    let searchWord = "searchWord"
    var interactor: ResultInteractor!
    var presenter: MockResultPresenter!

    override func setUpWithError() throws {
        networkManager = MockNetworkManager()
        interactor = ResultInteractor()
        presenter = MockResultPresenter()
        interactor.networkService = networkManager
        interactor.presenter = presenter
    }

    override func tearDownWithError() throws {
        networkManager = nil
        interactor = nil
    }
    
    func testProductsFetched() {
        networkManager.searchSuccess = true
        
        interactor.getProducts(searchText: searchWord)
        
        XCTAssertTrue(presenter.didFetchedCalled)
    }
    
    func testProductsFailed() {
        networkManager.searchSuccess = false
        
        interactor.getProducts(searchText: searchWord)
        
        XCTAssertTrue(presenter.didFailed)
    }
}
