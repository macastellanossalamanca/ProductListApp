//
//  SearchCoordinatorTest.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

import XCTest
@testable import ProductListApp

class SearchCoordinatorTest: XCTestCase {
    
    var searchCoordinator: SearchCoordinator!
    var mockRouter: MockRouter!

    override func setUpWithError() throws {
        mockRouter = MockRouter()
        searchCoordinator = SearchCoordinator(router: mockRouter)
    }

    override func tearDownWithError() throws {
        mockRouter = nil
        searchCoordinator = nil
    }
    
    func testStart() {
        searchCoordinator.start()
        
        // should add push first VC
        XCTAssertEqual(mockRouter.childCoordinators, 1)
        XCTAssertEqual(mockRouter.viewControllers.count, 1)
    }
    
    func testPresenterDidFinish() {
        searchCoordinator.start()
        
        searchCoordinator.searchDidFinish(searchText: "searchText", country: "Colombia")
        
        // next coordinator should be pushed
        XCTAssertEqual(mockRouter.childCoordinators, 2)
        XCTAssertEqual(mockRouter.viewControllers.count, 2)
    }
}
