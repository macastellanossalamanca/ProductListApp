//
//  ResultCoordinator.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import UIKit
import os.log

protocol ResultsCoordinatorDelegate: AnyObject {
    func resultsCoordinatorDidFinish(resultsCoordinator: ResultsCoordinator)
}

class ResultsCoordinator: CoordinatorProtocol {
    
    private let router: RouterProtocol
    weak var delegate: CoordinatorDelegateProtocol?
    
    init(router: RouterProtocol, searchWord: String) {
        self.router = router
        print(searchWord)
    }
    
    func start() {
//        let model = ResultsListImplementation(searchWord: self.searchWord, networkManager: NetworkManagerImplementation())
//
//        let viewModel = ResultsVMImplementation()
//        viewModel.coordinatorDelegate = self
//        viewModel.model = model
//
//        let resultsVC = ResultsVC(viewModel: viewModel)
//
//        self.router.push(resultsVC, isAnimated: true, withCoordinator: self)
        os_log("ResultsCoordinator: start()", log: OSLog.navigation, type: .debug)
    }
   
    func dismiss() {
//        // inform parent this coordinator is leaving
//        delegate?.resultsCoordinatorDidFinish(resultsCoordinator: self)
//        os_log("ResultsCoordinator: dismiss()", log: OSLog.navigation, type: .debug)
    }
}

//extension ResultsCoordinator: ResultsVMCoordinatorDelegate {
//    func resultsDidSelectItem(viewModel: ResultsVM, item: ResultItem) {
//        // move to item screen
//        os_log("ResultsCoordinator: resultsDidSelectItem(): move to item screen, itemId=%{PUBLIC}@", log: OSLog.navigation, type: .debug, item.id)
//
//        let itemCoordinator = ItemCoordinator(router: self.router, itemId: item.id)
//        itemCoordinator.delegate = self
//        itemCoordinator.start()
//    }
//
//    func resultsStopSearching(viewModel: ResultsVM) {
//        // go back to the previous screen
//        os_log("ResultsCoordinator: resultsStopSearching()", log: OSLog.navigation, type: .debug)
//        router.pop(isAnimated: true)
//    }
//}

//extension ResultsCoordinator: ItemCoordinatorDelegate {
//    func itemCoordinatorDidFinish(itemCoordinator: ItemCoordinator) {
//        // nothing to be done when child coordinator ends
//    }
//}
