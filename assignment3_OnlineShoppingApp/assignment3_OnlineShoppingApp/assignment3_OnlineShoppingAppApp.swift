//
//  assignment3_OnlineShoppingAppApp.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 30/4/2024.
//

import SwiftUI
import Firebase

@main
struct assignment3_OnlineShoppingAppApp: App {
    @StateObject var authModel = AuthenticationModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authModel)
        }
    }
}
