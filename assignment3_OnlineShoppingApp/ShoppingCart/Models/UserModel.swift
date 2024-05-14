//
//  UserModel.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 11/5/2024.
//

import Foundation

// view model for login and registration
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


// user model for json tables for serialization and deserialization
struct UserModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    var username: String
    var email: String
    var password: String
}
