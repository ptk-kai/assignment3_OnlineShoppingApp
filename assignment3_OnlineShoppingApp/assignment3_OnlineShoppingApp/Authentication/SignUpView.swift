//
//  SignUpView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var password2 = ""
    @State private var name = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Logo")
                    .font(.largeTitle)
                
                VStack {
                    TextInputView(text: $name, title: "Name", placeHolder: "Enter your name")

                    TextInputView(text: $email, title: "Email", placeHolder: "Email@example.com")
                        .autocapitalization(.none)
                    
                    TextInputView(text: $password, title: "Password", placeHolder: "Enter your password", needToHide: true)
                        .autocapitalization(.none)
                    
                    TextInputView(text: $password2, title: "Confirm your password", placeHolder: "Enter your password again", needToHide: true)
                        .autocapitalization(.none)
                }
                .padding()
                
                RoundCornerButtonView(title: "SIGN UP") {
                    Task {
                        try await authModel.signUp(email: email, password: password, name: name)
                    }
                }
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 15))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    SignUpView()
}
