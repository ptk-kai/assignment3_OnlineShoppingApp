//
//  SignInView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Logo")
                    .font(.largeTitle)
                
                VStack {
                    TextInputView(text: $email, title: "Email", placeHolder: "Email@example.com")
                        .autocapitalization(.none)
                    
                    TextInputView(text: $password, title: "Password", placeHolder: "Enter your password", needToHide: true)
                        .autocapitalization(.none)
                }
                .padding()
                
                RoundCornerButtonView(title: "SIGN IN") {
                    Task {
                        try await authModel.signIn(email: email, password: password)
                    }
                }
                
                
                NavigationLink(
                    destination: SignUpView(),
                    label: {
                        HStack {
                            Text("Don't have an account?")
                            Text("Sign up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 15))
                    })
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    LogInView()
}
