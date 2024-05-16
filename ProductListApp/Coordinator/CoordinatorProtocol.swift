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

protocol SearchPresenterDelegateProtocol: AnyObject {
    func searchDidFinish(searchText: String, country: String)
}

protocol ResultPresenterDelegateProtocol: AnyObject {
    func didSelectItem()
}
