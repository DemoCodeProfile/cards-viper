//
//  APIRequest.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

protocol APIRequest {
    associatedtype Response: Decodable

    var resourceName: String { get }
    
    var queryItem: [URLQueryItem] { get }
}
