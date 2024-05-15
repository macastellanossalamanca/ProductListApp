//
//  NetworkService.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 14/05/24.
//

import Moya
import AlamofireImage
import Alamofire
import os.log

protocol NetworkManager: AnyObject {
    func getSearchResults(q: String, completion: @escaping (Result<[Product], APIError>) -> Void)
    func getImage(url: String, completion: @escaping (Result<Data, APIError>) -> Void)
    func getItem(withId id: String, completion: @escaping (Result<ProductDetail, APIError>) -> Void)
}

class NetworkService: NetworkManager {
    // Instantiates Moya Network Provider, which works with AlamoFire underneath
    private var provider = MoyaProvider<APIManager>()
    
    init(provider: MoyaProvider<APIManager> = MoyaProvider<APIManager>()) {
        self.provider = provider
    }
    
    func getSearchResults(q: String, completion: @escaping (Result<[Product], APIError>) -> Void) {
        provider.request(.search(q: q)) { result in
            switch result {
            case let .failure(error):
                os_log("NetworkService: getSearchResults(): %{PUBLIC}@", log: OSLog.network, type: .error, error as CVarArg)
                completion(.failure(.connectionError))
            case let .success(response):
                do {
                    os_log("NetworkService: Succesful getSearchResults(): %{PUBLIC}@", log: OSLog.network, type: .debug)
                    let results = try JSONDecoder().decode(ProductsList.self, from: response.data)
                    completion(.success(results.results))
                } catch let error {
                    os_log("NetworkService: getSearchResults(): %{PUBLIC}@", log: OSLog.network, type: .error, error as CVarArg)
                    completion(.failure(.parsingError))
                }
            }
        }
    }

    func getImage(url: String, completion: @escaping (Result<Data, APIError>) -> Void) {
        AF.request(url).responseImage { response in
            if let data = response.data {
                os_log("NetworkService: Succesful getImage(): %{PUBLIC}@", log: OSLog.network, type: .debug)
                completion(.success(data))
            } else {
                if let error = response.error {
                    os_log("NetworkService: getImage(): %{PUBLIC}@", log: OSLog.network, type: .error, error as CVarArg)
                }
                completion(.failure(.connectionError))
            }
        }
    }
    
    func getItem(withId id: String, completion: @escaping (Result<ProductDetail, APIError>) -> Void) {
        provider.request(.item(id: id)) { result in
            switch result {
            case let .failure(error):
                os_log("NetworkService: getItem(): %{PUBLIC}@", log: OSLog.network, type: .error, error as CVarArg)
                completion(.failure(.connectionError))
            case let .success(response):
                do {
                    os_log("NetworkService: Successful getItem(): %{PUBLIC}@", log: OSLog.network, type: .debug)
                    let item = try JSONDecoder().decode(ProductDetail.self, from: response.data)
                    completion(.success(item))
                } catch {
                    os_log("NetworkService: getItem(): %{PUBLIC}@", log: OSLog.network, type: .error, error as CVarArg)
                    completion(.failure(.parsingError))
                }
            }
        }
    }
}
