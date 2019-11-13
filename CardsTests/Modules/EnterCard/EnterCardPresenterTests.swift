//
//  EnterCardPresenterTests.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import XCTest

@testable import Cards

class EnterCardPresenterTests: XCTestCase {
    
    private var presenter: EnterCardPresenter!
    private var interface: EnterCardViewMock!
    private var interactor: EnterCardInteractorInputMock!
    private var router: EnterCardWireframeMock!
    
    override func setUp() {
        interface = EnterCardViewMock()
        interactor = EnterCardInteractorInputMock()
        router = EnterCardWireframeMock()
        presenter = EnterCardPresenter(
            interface: interface,
            interactor: interactor,
            router: router
        )
    }
    
    func testValidCardNumberWithStartZeroAfterCheck() {
        presenter.check(number: CardNumberFixure.cardNumberWithZero)
        XCTAssertFalse(interface.isValidCardNumber ?? true, "Incorrect check with start zero")
    }
    
    func testValidCardNumberRangeSmallValueAfterCheck() {
        presenter.check(number: CardNumberFixure.cardNumberSmall)
        XCTAssertFalse(interface.isValidCardNumber ?? true, "Incorrect check range small")
    }
    
    func testValidCardNumberRangeLargeValueAfterCheck() {
        presenter.check(number: CardNumberFixure.cardNumberLarge)
        XCTAssertFalse(interface.isValidCardNumber ?? true, "Incorrect check range large")
    }
    
    func testValidCardNumberLuahValidAfterCheck() {
        presenter.check(number: CardNumberFixure.cardNumberValid)
        XCTAssertTrue(interface.isValidCardNumber ?? false, "Incorrect check luah valid card")
    }
    
    func testValidCardNumberLuahInvalidAfterCheck() {
        presenter.check(number: CardNumberFixure.cardNumberInvalid)
        XCTAssertFalse(interface.isValidCardNumber ?? true, "Incorrect check luah invalid card")
    }
    
    func testHiddenCradNumberIconAfterEnter() {
        presenter.enter(number: CardNumberFixure.cardNumberValid)
        XCTAssertTrue(interface.isHiddenCradNumberIcon ?? false, "Not hidden crad number icon")
    }
    
    func testHiddenInforamationButtonAfterEnter() {
        presenter.enter(number: CardNumberFixure.cardNumberValid)
        XCTAssertTrue(interface.isHiddenInforamationButton ?? false, "Not hidden inforamation button")
    }
    
    func testPaySystemAfterEnterCorrectVisa() {
        presenter.enter(number: CardNumberFixure.cardNumberValid)
        if let nameCardType = interface.nameCardType, !nameCardType.isEmpty {
            XCTAssertEqual(nameCardType, CardChecker.CardType.visa.stringValue(), "Incorrect detect card type")
        } else {
            XCTFail("Undetected type")
        }
    }
    // ... other type card
    
    func testPaySystemAfterEnterIncorrect() {
        presenter.enter(number: CardNumberFixure.cardNumberSmall)
        if let nameCardType = interface.nameCardType, nameCardType.isEmpty {
            XCTAssertEqual(nameCardType, "", "Incorrect detect card type")
        } else {
            XCTFail("Undetected type")
        }
    }
}
