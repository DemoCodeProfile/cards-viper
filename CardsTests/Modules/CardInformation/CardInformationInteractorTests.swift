//
//  CardInformationInteracorTests.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import XCTest

@testable import Cards

class CardInformationInteractorTests: XCTestCase {
    
    var interactor: CardInformationInteractor!
    var presenter: CardInformationInteractorOutputMock!
    var apiClient: APIClientMock!
    
    override func setUp() {
        apiClient = APIClientMock()
        presenter = CardInformationInteractorOutputMock()
        interactor = CardInformationInteractor(apiClient: apiClient)
        interactor.presenter = presenter
    }
    
    func testReceiveCardInformationSuccess() {
        apiClient.result = ResultFixure.resultSuccess
        interactor.receiveCardInformation(number: CardNumberFixure.cardNumberValid)
        
        XCTAssertNotNil(presenter.result, "Result to presenter nil")
        if let result = try? presenter.result?.get(), let resultSuccess = try? ResultFixure.resultSuccess.get() {
            XCTAssertEqual(result, resultSuccess, "Not equal results")
        } else {
            XCTFail("Error when receive success result")
        }
    }
    
    func testReceiveCardInformationError() {
        apiClient.result = ResultFixure.resultErrorNotFound
        interactor.receiveCardInformation(number: CardNumberFixure.cardNumberValid)
        
        XCTAssertNotNil(presenter.result, "Result to presenter nil")
        let result = try? presenter.result?.get()
        XCTAssertNil(result, "Not nil result when receive card information")
        let error = presenter.result?.error()
        XCTAssertNotNil(error, "Error not found")
        XCTAssertEqual(error?.description, ResultFixure.resultErrorNotFound.error()?.description, "Incorrect error")
    }
}
