//
//  DependencyInjection.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

class DependencyInjection {
    static let instance = DependencyInjection()
    let container: DIContainerServiceProtocol = DIContainerService()
}
