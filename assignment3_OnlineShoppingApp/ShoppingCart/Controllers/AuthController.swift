//
//  AuthController.swift
//  ShoppingCart
//
//  Created by CN TEST on 11/5/2024.
//

import Foundation


class AuthController {
    static func validateRegistration(userModel: UserModel) -> Bool {
        guard userModel.email.count >= 5,
              userModel.password.count >= 5,
              userModel.username.count >= 5 
        else {
            return false
        }
        return true
    }
    
    static func validateLogin(UsersTable: String, email: String, password: String) -> Bool {
        guard email.count >= 5, password.count >= 5 else {
            return false
        }
        
        guard StorageController.isUserExist(UsersTable: UsersTable, email: email) else {
            return false
        }
        
        guard let user = StorageController.getUserByEmail(UsersTable: UsersTable, email: email) else {
            return false
        }
        
        return user.password == password
    }
}
