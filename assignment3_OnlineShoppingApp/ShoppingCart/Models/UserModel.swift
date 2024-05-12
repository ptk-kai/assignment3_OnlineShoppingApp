//
//  UserModel.swift
//  ShoppingCart
//
//  Created by CN TEST on 11/5/2024.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func clear() {
        username = ""
        email = ""
        password = ""
    }
    
}

struct UserModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    var username: String
    var email: String
    var password: String
}
