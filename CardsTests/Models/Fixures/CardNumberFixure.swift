//
//  CardNumberFixure.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

@testable import Cards

class CardNumberFixure {
    static let cardNumber = CardNumber(
        number: NumberVerify(length: 16, luhn: true),
        scheme: "visa",
        type: "debit",
        brand: "Visa/Dankort",
        prepaid: false,
        country: Country(
            numeric: "208",
            alpha2: "208",
            name: "Denmark",
            emoji: "🇩🇰",
            currency: "DKK",
            latitude: 56,
            longitude: 10
        ),
        bank: Bank(
            name: "Jyske Bank",
            url: "www.jyskebank.dk",
            phone: "www.jyskebank.dk",
            city: "Hjørring"
        )
    )
    static let cardNumberValid: String = "4929804463622139"
    static let cardNumberInvalid: String = "4929804463622138"
    static let cardNumberWithZero: String = "0929804463622139"
    static let cardNumberSmall: String = "4929"
    static let cardNumberLarge: String = "49298044636221390929804463622139"
}
