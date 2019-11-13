//
//  Result+Ext.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

extension Result {
    func error() -> Failure? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
