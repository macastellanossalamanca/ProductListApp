//
//  DetailCoordinator.swift
//  ProductListApp
//
//  Created by Sandra Salamanca on 13/05/24.
//

import UIKit
import os.log

//protocol ItemCoordinatorDelegate: AnyObject {
//    func itemCoordinatorDidFinish(itemCoordinator: ItemCoordinator)
//}

class DetailCoordinator: CoordinatorProtocol {
    
    private let router: Router
    private let itemId: String
//    weak var delegate: ItemCoordinatorDelegate?

    init(router: Router, itemId: String) {
        self.router = router
        self.itemId = itemId
    }
    
    func start() {
//        let model = ItemModelImplementation(itemId: self.itemId, networkManager: NetworkManagerImplementation())
//
//        let viewModel = ItemVMImplementation()
//        viewModel.coordinatorDelegate = self
//        viewModel.model = model
//
//        let itemVC = ItemVC(viewModel: viewModel)
//
//        self.router.push(itemVC, isAnimated: true, withCoordinator: self)
//        os_log("ItemCoordinator: start()", log: OSLog.navigation, type: .debug)
    }
    
    func dismiss() {
//        // inform parent this coordinator is leaving
//        self.delegate?.itemCoordinatorDidFinish(itemCoordinator: self)
//        os_log("ItemCoordinator: dismiss()", log: OSLog.navigation, type: .debug)
    }
}

//extension ItemCoordinator: ItemVMCoordinatorDelegate {
//    func itemDidFinish(viewModel: ItemVM) {
//        os_log("ItemCoordinator: itemDidFinish()", log: OSLog.navigation, type: .debug)
//        router.pop(isAnimated: true)
//    }
//}
