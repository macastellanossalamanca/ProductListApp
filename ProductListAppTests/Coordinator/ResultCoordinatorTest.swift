//
//  ResultCoordinatorTest.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

import XCTest
@testable import ProductListApp

class ResultsCoordinatorTest: XCTestCase {

    var resultsCoordinator: ResultsCoordinator!
    var mockRouter: MockRouter!
    let searchWord = "SearchWord"
    let country = "Argentina"
    
    override func setUpWithError() throws {
        mockRouter = MockRouter()
        resultsCoordinator = ResultsCoordinator(router: mockRouter, searchWord: searchWord, country: country)
    }

    override func tearDownWithError() throws {
        mockRouter = nil
        resultsCoordinator = nil
    }
    
    func testStart() {
        resultsCoordinator.start()
        
        XCTAssertEqual(mockRouter.childCoordinators, 1, "Coordinator should be added to router")
        XCTAssertEqual(mockRouter.viewControllers.count, 1, "Coordinator should be added to router")
    }
}
