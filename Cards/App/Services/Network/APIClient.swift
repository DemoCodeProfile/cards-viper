//
//  APIClient.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

typealias ResultCallback<Value> = (Result<Value, ResponseError>) -> Void

protocol APIClient {
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>)
}

enum ResponseError: Error {
    case authenticationError
    case notFound
    case badRequest
    case outdated
    case failed(String)
    case noNetworkConnection
}

extension ResponseError {
    var description: String {
        switch self {
        case .authenticationError:
            return "Authentication Error".translate()
        case .notFound:
            return "Not Found".translate()
        case .badRequest:
            return "Bad Request".translate()
        case .outdated:
            return "Серевер недоступен".translate()
        case .failed(let error):
            return error
        case .noNetworkConnection:
            return "No network connection".translate()
        }
    }
}
