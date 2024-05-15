//
//  APIManager.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 14/05/24.
//

import Foundation
import Moya

enum APIError: Error {
    case parsingError, connectionError, defaultError
}

enum APIManager {
    private static let baseUrl = "https://api.mercadolibre.com/"
    private static let searchPath = "sites/MCO/search"
    private static let itemPath = "items/"

    case search(q: String)
    case item(id: String)
}

extension APIManager: TargetType {
    var baseURL: URL {
        guard let url = URL(string: APIManager.baseUrl) else { fatalError("Not valid URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .search: return APIManager.searchPath
        case .item(id: let id): return APIManager.itemPath + id
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search, .item: return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .search: return stubbedResponse(filename: "SearchResults")
        case .item: return stubbedResponse(filename: "Item")
        }
    }
    
    var task: Task {
        switch self {
        case .search(let q):
            return .requestParameters(parameters: ["q": q], encoding: URLEncoding.queryString)
        case .item: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    // MARK: Stubbed data
    private func stubbedResponse(filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        
        let bundle = Bundle.init(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
