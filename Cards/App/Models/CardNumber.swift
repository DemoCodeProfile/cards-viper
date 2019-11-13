//
//  CardNumber.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

struct CardNumber {
    let number : NumberVerify?
    let scheme : String?
    let type : String?
    let brand : String?
    let prepaid : Bool?
    let country : Country?
    let bank : Bank?
}

extension CardNumber: Codable {
    enum CodingKeys: String, CodingKey {
        case number
        case scheme
        case type
        case brand
        case prepaid
        case country
        case bank
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        number = try values.decodeIfPresent(NumberVerify.self, forKey: .number)
        scheme = try values.decodeIfPresent(String.self, forKey: .scheme)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        brand = try values.decodeIfPresent(String.self, forKey: .brand)
        prepaid = try values.decodeIfPresent(Bool.self, forKey: .prepaid)
        country = try values.decodeIfPresent(Country.self, forKey: .country)
        bank = try values.decodeIfPresent(Bank.self, forKey: .bank)
    }
}

extension CardNumber: Equatable {
    static func == (lhs: CardNumber, rhs: CardNumber) -> Bool {
        return lhs.brand == rhs.brand && lhs.prepaid == rhs.prepaid && lhs.scheme == rhs.scheme && lhs.type == rhs.type
    }
}
