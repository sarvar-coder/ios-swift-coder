//
//  Decimal+Ext.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 28/10/24.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        NSDecimalNumber(decimal:self).doubleValue
    }
}
