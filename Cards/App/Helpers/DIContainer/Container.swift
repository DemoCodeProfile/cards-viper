//
//  Container.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

class Container {
    private var dependencies: [KeyService: Any] = [:]
}

protocol Resolver {
    func resolve<Service>(_ type: Service.Type, name: String?) -> Service?
}

protocol Register {
    func register<Service>(_ type: Service.Type, name: String?, _ service: @escaping () -> Any)
}

extension Container: Register {
    func register<Service>(_ type: Service.Type, name: String? = nil, _ service: @escaping () -> Any) {
        dependencies[KeyService(id: String(describing: type), name: name)] = service()
    }
}

extension Container: Resolver {
    func resolve<Service>(_ type: Service.Type, name: String? = nil) -> Service? {
        return dependencies.first { $0.key.id == String(describing: type) && $0.key.name == name }?.value as? Service
    }
}

class KeyService: Hashable {
    var id: String
    var name: String?
    
    init(id: String, name: String? = nil) {
        self.id = id
        self.name = name
    }
    
    public func hash(into hasher: inout Hasher) {
        name?.hash(into: &hasher)
        id.hash(into: &hasher)
    }
    
    static func == (lhs: KeyService, rhs: KeyService) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
