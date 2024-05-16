//
//  MockCoordinator.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

@testable import ProductListApp

class MockCoordinator: CoordinatorProtocol {
    private(set) var coordinatorStarted = false
    private(set) var coordinatorDismissed = false
    
    func start() {
        coordinatorStarted = true
    }
    
    func dismiss() {
        coordinatorDismissed = true
    }
}
