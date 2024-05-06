//
//  assignment3_OnlineShoppingAppApp.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 30/4/2024.
//

import SwiftUI

@main
struct assignment3_OnlineShoppingAppApp: App {
    @StateObject var authModel = AuthenticationModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authModel)
        }
    }
}
