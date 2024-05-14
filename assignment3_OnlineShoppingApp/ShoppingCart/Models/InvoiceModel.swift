//
//  InvoiceModel.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 12/5/2024.
//

import Foundation

// Model for Invoice Json
struct InvoiceModel: Codable {
    var transaction: [CartModel]
    var datetime: Date = Date()
    var total: Double
}
