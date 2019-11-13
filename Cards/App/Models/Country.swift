//
//  Country.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

struct Country : Codable {
    let numeric : String?
    let alpha2 : String?
    let name : String?
    let emoji : String?
    let currency : String?
    let latitude : Double?
    let longitude : Double?

    enum CodingKeys: String, CodingKey {
        case numeric
        case alpha2
        case name
        case emoji
        case currency
        case latitude
        case longitude
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        numeric = try values.decodeIfPresent(String.self, forKey: .numeric)
        alpha2 = try values.decodeIfPresent(String.self, forKey: .alpha2)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        emoji = try values.decodeIfPresent(String.self, forKey: .emoji)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
    }
    
    init(
        numeric : String?,
        alpha2 : String?,
        name : String?,
        emoji : String?,
        currency : String?,
        latitude : Double?,
        longitude : Double?
    ) {
        self.numeric = numeric
        self.alpha2 = alpha2
        self.name = name
        self.emoji = emoji
        self.currency = currency
        self.latitude = latitude
        self.longitude = longitude
    }
}
