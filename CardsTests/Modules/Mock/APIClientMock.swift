//
//  APIClientMock.swift
//  CardsTests
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import XCTest

@testable import Cards

class APIClientMock: APIClient {
    
    var result: Result<CardNumber, ResponseError>?
    
    func send<T>(_ request: T, completion: @escaping (Result<T.Response, ResponseError>) -> Void) where T : APIRequest {
        guard let result = result as? Result<T.Response, ResponseError> else {
            XCTFail("Didnot supply fixures result")
            return
        }
        completion(result)
    }
}
