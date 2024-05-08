//
//  TextInputView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import SwiftUI

struct TextInputView: View {
    @Binding var text: String
    let title: String
    let placeHolder: String
    var needToHide = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            if needToHide {
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 15))
            } else {
                TextField(placeHolder, text: $text)
                    .font(.system(size: 15))
            }
            
            Divider()
        }
    }
}

#Preview {
    TextInputView(text: .constant(""), title: "Title", placeHolder: "Placeholder")
}
