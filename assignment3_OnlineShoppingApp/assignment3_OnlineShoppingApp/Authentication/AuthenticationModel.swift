//
//  AuthenticationModel.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthenticationModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(email: String, password: String) async throws {
        print("Sign innn")
    }
    
    func signUp(email: String, password: String, name: String) async throws {
        print("Sign uppp")
    }
    
    func signOut() {
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        
    }
}
