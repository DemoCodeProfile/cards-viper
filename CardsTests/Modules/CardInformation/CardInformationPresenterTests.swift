//
//  CardInformationPresenterTests.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import XCTest

@testable import Cards

class CardInformationPresenterTests: XCTestCase {
    
    private var presenter: CardInformationPresenter!
    private var interactor: CardInformationInteractorMock!
    private var interface: CardInformationViewMock!
    private var router: CardInformationWireframeMock!
    
    override func setUp() {
        interactor = CardInformationInteractorMock()
        interface = CardInformationViewMock()
        router = CardInformationWireframeMock()
        presenter = CardInformationPresenter(
            interface: interface,
            interactor: interactor,
            router: router,
            cardNumber: ""
        )
    }
    
    func testReceivedCardInformationSuccess() {
        presenter.receivedCardInformation(.success(CardNumberFixure.cardNumber))
        
        XCTAssertEqual(interface.cardInformationDatas.count, 8, "Incorrect list count elements")
        XCTAssertEqual(interface.error, "", "Error not nil")
    }
    
    func testReceivedCardInformationError() {
        presenter.receivedCardInformation(.failure(ResponseError.notFound))
        
        XCTAssertEqual(interface.cardInformationDatas.count, 0, "Incorrect list count elements")
        XCTAssertEqual(interface.error, ResponseError.notFound.description, "Incorrect error description")
    }
    
    func testStartLoadingProgressSuccess() {
        presenter.receiveCardInformation()
        
        XCTAssertTrue(interface.isStartLoadingProcess, "Start loading process incorrect")
    }
}
