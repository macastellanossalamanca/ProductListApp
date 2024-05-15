//
//  Interactor.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import Foundation

protocol SearchInteractorProtocol: AnyObject {
//In search screen, we access to CoreData and Location services to
}

class SearchInteractor: SearchInteractorProtocol {
    weak var presenter: SearchPresenterProtocol?
}
