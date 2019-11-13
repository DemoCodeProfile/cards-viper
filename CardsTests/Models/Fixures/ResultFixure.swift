//
//  ResultFixure.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

@testable import Cards

class ResultFixure {
    static let resultSuccess: Result<CardNumber, ResponseError> = .success(CardNumberFixure.cardNumber)
    static let resultErrorNotFound: Result<CardNumber, ResponseError> = .failure(.notFound)
}
