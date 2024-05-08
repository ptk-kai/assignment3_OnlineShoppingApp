//
//  MainPageView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import SwiftUI

struct MainPageView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        Text("This is main page displaying products")
    }
}

#Preview {
    MainPageView()
        .environmentObject(AuthenticationModel())
}
