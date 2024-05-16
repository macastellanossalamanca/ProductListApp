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
