//
//  ReceiptClass.swift
//  ReceiptScannerApp
//
//  Created by Pavel on 11/12/22.
//

import Foundation

class Receipt : Identifiable{
    var cost : Double = 0.0
    var currency : String = ""
    let id = UUID()
    init(cost: Double, currency: String) {
        self.cost = cost
        self.currency = currency
    }
}
