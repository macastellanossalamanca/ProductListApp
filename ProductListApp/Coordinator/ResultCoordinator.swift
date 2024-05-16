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
    var searchWord: String
    var country: String
    
    init(router: RouterProtocol, searchWord: String, country: String) {
        self.router = router
        self.searchWord = searchWord
        self.country = country
    }
    
    func start() {
        // Result VC creation
        let resultViewController = ResultViewController()
        let resultPresenter = ResultPresenter(searchText: searchWord)
        let resultInteractor = ResultInteractor()
        let networkService = NetworkService()
        
        networkService.countryCode = CountryCode.countryCodes[country] ?? ""
        resultInteractor.presenter = resultPresenter
        resultInteractor.networkService = networkService
        
        resultPresenter.interactor = resultInteractor
        resultPresenter.viewController = resultViewController
        resultPresenter.coordinatorDelegate = self
        
        resultViewController.presenter = resultPresenter

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
