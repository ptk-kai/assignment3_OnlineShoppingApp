//
//  ContentView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 30/4/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        Group {
            if authModel.userSession != nil {
                ProfileView()
            } else {
                LogInView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthenticationModel())
}
