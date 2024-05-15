//
//  ProductModel.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import Foundation

struct ProductsList: Decodable {
    let results: [Product]
}

struct Product: Decodable {
    let id: String
    let title: String
    let price: Float
    let thumbnail: String
    var thumbnailData: Data?
}

struct ProductDetail: Decodable {
    let id: String
    let title: String
    let price: Float
    let condition: String
    let quantity: Int
}
