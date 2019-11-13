//
//  DIContainerService.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

protocol DIContainerProtocol {
    func register<T>(depedency: T.Type, implemenation: @escaping () -> T, name: String?)
    func resolve<T>(_ dependency: T.Type, name: String?) -> T
}

protocol DIContainerServiceProtocol {
    func registerServices()
    func resolve<T>(_ dependency: T.Type, name: String?) -> T
}
