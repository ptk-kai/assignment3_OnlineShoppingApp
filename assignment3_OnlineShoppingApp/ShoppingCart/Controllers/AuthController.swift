//
//  AuthController.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 11/5/2024.
//

import Foundation


class AuthController {

    // checks if the input for registration are valid
    static func validateRegistration(userModel: UserModel) -> Bool {
        guard userModel.email.count >= 5,
              userModel.password.count >= 5,
              userModel.username.count >= 5 
        else {
            return false
        }
        return true
    }
    
    // Checks the persistant storage if they exist and check if the passwords match
    static func validateLogin(UsersTable: String, email: String, password: String) -> Bool {
        guard email.count >= 5, password.count >= 5 else {
            return false
        }
        
        // checks if email exist
        guard StorageController.isUserExist(UsersTable: UsersTable, email: email) else {
            return false
        }
        
        // gets the user and password
        guard let user = StorageController.getUserByEmail(UsersTable: UsersTable, email: email) else {
            return false
        }
        
        // checks if password matches
        return user.password == password
    }
}
