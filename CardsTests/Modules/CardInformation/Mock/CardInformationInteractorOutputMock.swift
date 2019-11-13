//
//  CardInformationInteractorOutputMock.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

@testable import Cards

class CardInformationInteractorOutputMock: CardInformationInteractorOutputProtocol {
    
    var result: Result<CardNumber, ResponseError>?
    
    func receivedCardInformation(_ result: Result<CardNumber, ResponseError>) {
        self.result = result
    }
}
