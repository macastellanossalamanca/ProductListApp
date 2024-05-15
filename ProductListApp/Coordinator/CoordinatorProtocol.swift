//
//  CoordinatorProtocol.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    func start()
    func dismiss()
}

protocol CoordinatorDelegateProtocol: AnyObject {
    func childCoordinatorDidFinish(coordinator: CoordinatorProtocol)
}

protocol SearchPresenterDelegateProtocol: AnyObject {
    func searchDidFinish(searchText: String)
}

protocol ResultPresenterDelegateProtocol: AnyObject {
    func didSelectItem()
}
