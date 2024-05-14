//
//  ContentView.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 11/5/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("CurrentUser") var currentUser: String?
    var body: some View {
        // If the current user is no authenticated it will load the Authentication page
        // else it will go directly to the Shopping App.
        if currentUser == nil || currentUser?.count == 0 {
            Authentication()
        } else {
            ShoppingList()
        }
    }
}

#Preview {
    ContentView()
}
