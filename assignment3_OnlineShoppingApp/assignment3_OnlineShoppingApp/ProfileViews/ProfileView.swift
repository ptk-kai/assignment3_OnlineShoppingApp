//
//  ProfileView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        NavigationStack {
            if let user = authModel.currentUser {
                List {
                    Section {
                        HStack {
                            Text("Ava")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.name)
                                    .fontWeight(.semibold)
                                    .padding(.top, 5)
                                Text(user.email)
                                    .font(.footnote)
                                    .accentColor(.gray)
                            }
                        }
                        
                    }
                    
                    Section("General") {
                        
                    }
                    
                    Section("Account") {
                        Button {
                            authModel.signOut()
                        } label: {
                            RoundCornerButtonView(title: "SIGN OUT")
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView {
        ProfileView()
            .environmentObject(AuthenticationModel())
    }
    
}
