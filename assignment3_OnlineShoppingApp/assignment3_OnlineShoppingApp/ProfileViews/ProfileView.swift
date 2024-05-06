//
//  ProfileView.swift
//  assignment3_OnlineShoppingApp
//
//  Created by Tuan Kiet Phan on 7/5/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
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
                        Text(User.MOCK_USER.name)
                            .fontWeight(.semibold)
                            .padding(.top, 5)
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .accentColor(.gray)
                    }
                }
                
            }
            
            Section("General") {
                
            }
            
            Section("Account") {
                Button {
                    print("Sign out...")
                } label: {
                    Text("Sign Out")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
