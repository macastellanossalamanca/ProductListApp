//
//  AppCoordinator.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//
import UIKit
import os.log

class AppCoordinator: CoordinatorProtocol {
    
    private let window: UIWindow
    private let router: RouterProtocol
    
    init(window: UIWindow) {
        self.window = window
        let navigationController = UINavigationController()
        self.router = Router(navigationController: navigationController)
        self.window.rootViewController = navigationController
    }
    
    func start() {
        os_log("AppCoordinator: start()", log: OSLog.navigation, type: .debug)
        let searchCoordinator = SearchCoordinator(router: self.router)
        searchCoordinator.start()
    }

    func dismiss() {
        os_log("AppCoordinator: dismiss(): App coordinator shouldn't be dissmised", log: OSLog.navigation, type: .error)
        fatalError("Initial coordinator can't be dismised")
    }
}
