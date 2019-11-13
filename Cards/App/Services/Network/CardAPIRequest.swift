//
//  CardAPIRequest.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

class CardAPIRequest: APIRequest {
    typealias Response = CardNumber
    
    var resourceName: String
    
    var queryItem: [URLQueryItem] = []
    
    init(resourceName: String) {
        self.resourceName = resourceName
    }
}
