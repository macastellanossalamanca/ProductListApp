//
//  SearchCoordinator.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import UIKit
import os.log
import CoreLocation

class SearchCoordinator: CoordinatorProtocol {
    
    private let router: RouterProtocol

    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        // Search VC creation
        let searchViewController = SearchViewController()
        let searchPresenter = SearchPresenter()
        let searchInteractor = SearchInteractor()
        let locationManager = CLLocationManager()
        
        searchInteractor.presenter = searchPresenter
        
        searchPresenter.interactor = searchInteractor
        searchPresenter.viewController = searchViewController
        searchPresenter.coordinatorDelegate = self
        
        searchViewController.presenter = searchPresenter
        searchViewController.locationManager = locationManager
        
        router.push(searchViewController, isAnimated: false, withCoordinator: self)
        os_log("SearchCoordinator: start()", log: OSLog.navigation, type: .debug)
    }
    
    func dismiss() {
        os_log("SearchCoordinator: dismiss()", log: OSLog.default, type: .error)
    }
}

extension SearchCoordinator: SearchPresenterDelegateProtocol {
    func searchDidFinish(searchText: String, country: String) {
        os_log("SearchCoordinator: searchDidFinish(), Routing to Results", log: OSLog.navigation, type: .debug, searchText)
        let resultsCoordinator = ResultsCoordinator(router: self.router, searchWord: searchText, country: country)
        resultsCoordinator.start()
    }
}
