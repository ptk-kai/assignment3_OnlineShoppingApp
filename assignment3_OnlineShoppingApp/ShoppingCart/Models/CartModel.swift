//
//  CartModel.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 12/5/2024.
//

import Foundation

// Model for Cart json
struct CartModel: Codable {
    var item: ItemModel
    var quantity: Int
}
