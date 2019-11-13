//
//  CardInformationInteractorMock.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

@testable import Cards

class CardInformationInteractorMock: CardInformationInteractorInputProtocol {
    var presenter: CardInformationInteractorOutputProtocol?
    var numberCard: String?
    
    func receiveCardInformation(number card: String?) {
        numberCard = card
    }
}
