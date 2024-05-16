//
//  RouterTest.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

import XCTest
@testable import ProductListApp

class RouterTest: XCTestCase {
    
    var router: Router!
    var mockNavigationController: MockNavigationController!
    
    override func setUpWithError() throws {
        mockNavigationController = MockNavigationController()
        router = Router(navigationController: mockNavigationController)
    }

    override func tearDownWithError() throws {
        mockNavigationController = nil
        router = nil
    }

    func testInitialState() {
        // navigation controller assigned
        XCTAssertEqual(router.navigationController, mockNavigationController, "Navigation controller should be assigned on init")
        
        // coordinators should be empty
        XCTAssertEqual(router.childCoordinators, 0, "Coordinators should be empty on startup")
    }
    
    func testPush() {
        let mockCoordinator = MockCoordinator()
        let viewController = UIViewController()
        
        router.push(viewController, isAnimated: false, withCoordinator: mockCoordinator)
        
        // should add coordinator to internal array and push the vc to the navigation controller
        XCTAssertEqual(router.childCoordinators, 1, "Coordinator should be added")
        XCTAssertEqual(mockNavigationController.pushedViewController, viewController, "View controller should be pushed to the navigation controller")
    }
    
    func testPopEmpty() {
        router.pop(isAnimated: false)
        XCTAssertEqual(router.childCoordinators, 0)
    }
    
    func testPop() {
        let mockCoordinator1 = MockCoordinator()
        let rootViewController = UIViewController()
        let mockCoordinator2 = MockCoordinator()
        let viewController = UIViewController()
        router.push(rootViewController, isAnimated: false, withCoordinator: mockCoordinator1)
        router.push(viewController, isAnimated: false, withCoordinator: mockCoordinator2)
        
        router.pop(isAnimated: false)
        
        // should remove coordinator and pop from navigation controller
        XCTAssertEqual(router.childCoordinators, 1, "Coordinator should be removed")
        XCTAssertEqual(mockNavigationController.children.count, 1)
        XCTAssertEqual(mockNavigationController.popedViewController, viewController, "View controller should be poped to the navigation controller")
    }
}
