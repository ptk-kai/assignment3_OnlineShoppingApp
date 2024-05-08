//
//  WelcomePageView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 9/5/2024.
//

import SwiftUI

struct WelcomePageView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        ZStack {
            Color.mint.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome to our store!")
                    .font(.largeTitle)
                Spacer()
                
                Text("Logo")
                    .font(.largeTitle)
                
                Spacer()
                
                HStack {
                    NavigationLink(
                        destination: LogInView().environmentObject(AuthenticationModel()),
                        label: {
                            RoundCornerButtonView(title: "Log In")
                        })
                    
                    NavigationLink(
                        destination: SignUpView().environmentObject(AuthenticationModel()),
                        label: {
                            RoundCornerButtonView(title: "Sign Up")
                        })
                }
                
                Spacer()
                
                Text("Have great shopping time with us!")
                
                
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    NavigationView {
        WelcomePageView()
    }
}
