//
//  RoundCornerButtonView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import SwiftUI

struct RoundCornerButtonView: View {
    @State var title: String
    var clicked: (()->())?
    
    var body: some View {
        Button {
            clicked?()
        } label: {
            Text(title)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
        .background(Color(.green))
        .cornerRadius(15)
        .padding(20)
    }
}

#Preview {
    RoundCornerButtonView(title: "Button")
}
