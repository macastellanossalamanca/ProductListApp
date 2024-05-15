//
//  Router.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import UIKit
import os.log

class Router: NSObject, RouterProtocol {
    let navigationController: UINavigationController
    private var coordinators: [CoordinatorProtocol]
    var childCoordinators: Int { coordinators.count }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.coordinators = []
    }

    func push(_ vc: UIViewController, isAnimated: Bool, withCoordinator coordinator: CoordinatorProtocol) {
        navigationController.pushViewController(vc, animated: isAnimated)
        coordinators.append(coordinator)
    }

    func pop(isAnimated: Bool) {
        if childCoordinators == 1 {
            fatalError("The root view controller can't be removed")
        }
        
        navigationController.popViewController(animated: isAnimated)
        if let lastCoordinator = coordinators.last {
            lastCoordinator.dismiss()
            coordinators.removeLast()
        }
        os_log("Router: pop(): manual coordinator dismiss", log: OSLog.default, type: .debug)
    }
}

extension Router: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // if the last vc is still in the navigation controller stack it means i'm adding a new vc
        if navigationController.viewControllers.contains(fromVC) {
            return
        }

        if let lastCoordinator = coordinators.last {
            lastCoordinator.dismiss()
            coordinators.removeLast()
        }
        os_log("Router: navigationController(): automatic coordinator dismiss", log: OSLog.navigation, type: .debug)
    }
}
