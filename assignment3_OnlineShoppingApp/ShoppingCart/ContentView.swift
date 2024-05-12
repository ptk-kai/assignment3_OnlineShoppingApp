//
//  ContentView.swift
//  ShoppingCart
//
//  Created by CN TEST on 11/5/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("CurrentUser") var currentUser: String?
    var body: some View {
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
