//
//  ResultInteractor.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 15/05/24.
//

import os.log
import UIKit

protocol ResultInteractorProtocol: AnyObject {
//In search screen, we access to CoreData and Location services to
    func getProducts(searchText: String)
}

class ResultInteractor: ResultInteractorProtocol {
    weak var presenter: ResultPresenterProtocol?
    var networkService: NetworkManager?
    
    func getProducts(searchText: String) {
        networkService?.getSearchResults(q: searchText) { response in
            switch response {
            case .failure(let err):
                os_log("ResultInteractor: getProducts(): Network manager failed getting products", log: OSLog.network, type: .debug)
                self.presenter?.productsDidFail(error: err)
            case .success(let result):
                os_log("ResultInteractor: getProducts(): Network manager finished fetching products", log: OSLog.network, type: .debug)
                // save the items
                self.presenter?.products = result

                // load thumbnails
                let group = DispatchGroup()
                self.loadThumbnails(group: group)

                // wait for every thumbnail
                group.notify(queue: .main) {
                    os_log("ResultInteractor: getProducts(): Finished loading thumbnails", log: OSLog.network, type: .debug)
                }
                self.presenter?.productsDidFetch()
            }
        }
    }
    
    private func loadThumbnails(group: DispatchGroup) {
        for i in 0 ..< (presenter?.numberOfItems() ?? 0) {
            group.enter()
            networkService?.getImage(url: presenter?.products[i].thumbnail ?? "") { response in
                switch response {
                case .failure:
                    os_log("ResultInteractor: loadThumbnails(): Unable to download thumbnail", log: OSLog.network, type: .error)
                case .success(let image):
                    self.presenter?.products[i].thumbnailData = image
                }
                group.leave()
            }
        }
    }
}
