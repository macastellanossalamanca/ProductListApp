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
    var searchWord: String
    
    init(router: RouterProtocol, searchWord: String) {
        self.router = router
        self.searchWord = searchWord
    }
    
    func start() {
        // Result VC creation
        let resultViewController = ResultViewController()
        let resultPresenter = ResultPresenter(searchText: searchWord)
        let resultInteractor = ResultInteractor()
        let networkService = NetworkService()
        
        resultInteractor.presenter = resultPresenter
        resultInteractor.networkService = networkService
        
        resultPresenter.interactor = resultInteractor
        resultPresenter.viewController = resultViewController
        resultPresenter.coordinatorDelegate = self
        
        resultViewController.presenter = resultPresenter
        resultPresenter.load()

        self.router.push(resultViewController, isAnimated: true, withCoordinator: self)
        os_log("ResultsCoordinator: start()", log: OSLog.navigation, type: .debug)
    }
   
    func dismiss() {
        // inform parent this coordinator is leaving
        router.pop(isAnimated: true)
        os_log("ResultsCoordinator: dismiss()", log: OSLog.navigation, type: .debug)
    }
}

extension ResultsCoordinator: ResultPresenterDelegateProtocol {
    func didSelectItem() {
        // move to item screen
        os_log("ResultsCoordinator: resultsDidSelectItem(): move to item screen, itemId=%{PUBLIC}@", log: OSLog.navigation, type: .debug)
    }
}
