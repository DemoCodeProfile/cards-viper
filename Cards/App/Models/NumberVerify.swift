//
//  NumberVerify.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

struct NumberVerify {
    let length: Int?
    let luhn: Bool?
}

extension NumberVerify: Codable {
    enum CodingKeys: String, CodingKey {
        case length
        case luhn
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        length = try values.decodeIfPresent(Int.self, forKey: .length)
        luhn = try values.decodeIfPresent(Bool.self, forKey: .luhn)
    }
}
