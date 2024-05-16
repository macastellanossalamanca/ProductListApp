//
//  NetworkManagerTests.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 16/05/24.
//

import XCTest
import Moya
@testable import ProductListApp

class NetworkManagerImplementationTest: XCTestCase {
    
    var networkManager: NetworkService!
    
    override func setUpWithError() throws {
        networkManager = NetworkService(provider: MoyaProvider<APIManager>(stubClosure: MoyaProvider.immediatelyStub))
    }
    
    override func tearDownWithError() throws {
        networkManager = nil
    }
    
    func testSearchResults() {
        let promise = expectation(description: "completition handler")
        
        var done = false
        var results: [Product]?
        
        networkManager.getSearchResults(q: "id1") { response in
            switch response {
                case .failure(_): break
                case .success(let searchResults): results = searchResults
            }
            done = true
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 5)
        XCTAssertTrue(done)
        XCTAssertNotNil(results)
    }
}
