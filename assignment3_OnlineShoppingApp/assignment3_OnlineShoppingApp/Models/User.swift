//
//  UserData.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let email: String
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, name: "Kai", email: "test@uts.edu.au")
}
