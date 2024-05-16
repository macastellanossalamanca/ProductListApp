//
//  MockCoordinator.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

@testable import ProductListApp

class MockCoordinator: CoordinatorProtocol {
    private(set) var coorindatorStarted = false
    private(set) var coorindatorDismissed = false
    
    func start() {
        coorindatorStarted = true
    }
    
    func dismiss() {
        coorindatorDismissed = true
    }
}
