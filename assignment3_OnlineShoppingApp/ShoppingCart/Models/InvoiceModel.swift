//
//  InvoiceModel.swift
//  ShoppingCart
//
//  Created by CN TEST on 12/5/2024.
//

import Foundation

struct InvoiceModel: Codable {
    var transaction: [CartModel]
    var datetime: Date = Date()
    var total: Double
}
