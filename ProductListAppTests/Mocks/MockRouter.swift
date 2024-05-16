//
//  MockRouter.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

import Foundation
import UIKit
@testable import ProductListApp

class MockRouter: RouterProtocol {
    private(set) var coordinators = [CoordinatorProtocol]()
    private(set) var viewControllers = [UIViewController]()
    
    var childCoordinators: Int { coordinators.count }
    
    func push(_ vc: UIViewController, isAnimated: Bool, withCoordinator coordinator: CoordinatorProtocol) {
        viewControllers.append(vc)
        coordinators.append(coordinator)
    }
    
    func pop(isAnimated: Bool) {
        viewControllers.removeLast()
        coordinators.removeLast()
    }
}
