//
//  AuthenticationModel.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

protocol AuthenticationForm {
    var isFormValid: Bool {
        get
    }
}

@MainActor
class AuthenticationModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            await fetchUser()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func signUp(email: String, password: String, name: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            let user = User(id: result.user.uid, name: name, email: email) // get user object
            let encoder = try Firestore.Encoder().encode(user) // encoder
            try await Firestore.firestore().collection("users").document(user.id).setData(encoder) // upload and save to Firebase backend
            
            await fetchUser() //fetch data
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            // sign out user and then clear user's data, go back to home screen
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        guard let fetching = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {
            return
        }
        
        self.currentUser = try? fetching.data(as: User.self)
        
        print("current user: \(String(describing: self.currentUser))")
    }
}
