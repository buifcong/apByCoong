//
//  Model.swift
//  Reavol_copy
//
//  Created by bùi thành công on 04/08/2022.
//

import Foundation

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    var dictionary: [String:Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
    subscript(key: String) -> Any?{
        return dictionary[key]
    }
}

struct Book: Codable {
    var id: String
    var name: String
    var author: String
    var createAt: String
    var price: Float
    
}
