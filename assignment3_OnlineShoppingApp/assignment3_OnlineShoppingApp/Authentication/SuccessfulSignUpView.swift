//
//  SuccessfulSignUpView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 9/5/2024.
//

import SwiftUI

struct SuccessfulSignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign up success!")

                NavigationLink(
                    destination: LogInView(),
                    label: {
                        RoundCornerButtonView(title: "Go to Sign In") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    SuccessfulSignUpView()
}
