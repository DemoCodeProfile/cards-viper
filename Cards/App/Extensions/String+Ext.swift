//
//  String+Ext.swift
//  Cards
//
//  Copyright © 2019 Вадим. All rights reserved.
//

import Foundation

extension String {
    func translate() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
