//
//  Bank.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

struct Bank {
    let name : String?
    let url : String?
    let phone : String?
    let city : String?
}

extension Bank: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case url
        case phone
        case city
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        city = try values.decodeIfPresent(String.self, forKey: .city)
    }
}
