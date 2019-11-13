//
//  DIContainer.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

class DIContainer: DIContainerProtocol {
    private let container = Container()
    
    func register<T>(
        depedency: T.Type,
        implemenation: @escaping () -> T,
        name: String? = nil
    ) {
        container.register(depedency, name: name, {  implemenation() })
    }
    
    func resolve<T>(_ dependency: T.Type, name: String? = nil) -> T {
      guard let implementation = container.resolve(dependency, name: name) else {
        fatalError("Not found")
      }
      return implementation
    }
}

class DIContainerService: DIContainerServiceProtocol {
    private let container = DIContainer()
    
    func registerServices() {
        container.register(
            depedency: APIClient.self,
            implemenation: {
                return CardAPIClient()
        },
            name: "CardAPIClient"
        )
    }
    
    func resolve<T>(_ dependency: T.Type, name: String? = nil) -> T {
        return container.resolve(dependency, name: name)
    }
}
