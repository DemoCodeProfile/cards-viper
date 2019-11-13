//
//  EnterCardWireframeMock.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

@testable import Cards

class EnterCardWireframeMock: EnterCardWireframeProtocol {
    
    var cardNumber: String?
    
    func showCardInformationScreen(number card: String?) {
        cardNumber = card
    }
}
