//
//  MockNavigationController.swift
//  ProductListAppTests
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

import UIKit

class MockNavigationController: UINavigationController {
    private(set) var pushedViewController: UIViewController?
    private(set) var popedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        popedViewController = super.popViewController(animated: animated)
        return popedViewController
    }
}
