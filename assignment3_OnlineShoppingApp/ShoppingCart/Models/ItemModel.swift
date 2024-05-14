//
//  ItemModel.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 11/5/2024.
//

import Foundation


// Model for the items that can be bought from shopper
struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var price: Double
}
