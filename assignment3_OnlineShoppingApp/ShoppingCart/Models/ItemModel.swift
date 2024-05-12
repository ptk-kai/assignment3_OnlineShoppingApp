//
//  ItemModel.swift
//  ShoppingCart
//
//  Created by CN TEST on 11/5/2024.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var price: Double
}
