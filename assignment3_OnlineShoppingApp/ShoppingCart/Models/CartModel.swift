//
//  CartModel.swift
//  ShoppingCart
//
//  Created by CN TEST on 12/5/2024.
//

import Foundation

struct CartModel: Codable {
    var item: ItemModel
    var quantity: Int
}
