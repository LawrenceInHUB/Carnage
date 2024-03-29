//
//  ProductModel.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-30.
//

import Foundation
import Alamofire

struct ProductModel:  Identifiable , Codable {
    let id, title, des, category: String
    let sex: Gender
    let price: Int
    let image: String
    let size: Size
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, des, category, sex, price, image, size
        case v = "__v"
    }
}

enum Gender: String, Codable {
    case men = "Men"
    case women = "Women"
    case unisex = "Unisex"
}

enum Size: String, Codable {
    case l = "L"
    case m = "M"
    case s = "S"
    case xl = "XL"
}

typealias Product = [ProductModel]

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
