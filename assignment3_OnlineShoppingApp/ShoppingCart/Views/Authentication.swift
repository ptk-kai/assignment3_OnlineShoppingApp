//
//  Authentication.swift
//  ShoppingCart
//
//  Created by Tuan Kiet Phan on 11/5/2024.
//

import SwiftUI

struct Authentication: View {
    // Instatiate variables
    @StateObject private var viewModel = UserViewModel()
    @State var isLoginPage = true
    @State var alert = ""

    // Persistant Storage
    @AppStorage("Users") var allUsers: String?
    @AppStorage("CurrentUser") var currentUser: String?
    
    // Used to redirect to the Shopping page when this is true
    @State private var isAuthenticated = false
    
    // Unauthenticated pages in one Login/Registration
    var body: some View {
        NavigationStack {
            VStack {
                Text("The Shopper")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                Spacer()

                Text(isLoginPage ? "Login" : "Register")
                    .font(.title)
                    .padding(.bottom, 20)
                
                Text("\(alert)")
                    .foregroundColor(.red)
                    .padding(.bottom, 20)

                if !isLoginPage {
                    TextField("Username", text: $viewModel.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                        .padding(.horizontal, 20)
                }
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .padding(.horizontal, 20)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .padding(.horizontal, 20)
                
                Button(action: {
                    handleAuthButton()
                }) {
                    Text(isLoginPage ? "Login" : "Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 20)
                
                HStack {
                    Text(isLoginPage ? "Don't have an account?" : "Already have an account?")
                        .foregroundColor(.blue)
                        .padding(.trailing, 5)
                    
                    Text(isLoginPage ? "Sign up" : "Login")
                        .underline()
                        .foregroundColor(.blue)
                        .onTapGesture {
                            isLoginPage.toggle()
                            viewModel.clear()
                        }
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .onAppear {
                // Instantiate a Json string for persistant storage
                if allUsers == nil {
                    allUsers = "{}"
                }
            }
            .navigationDestination(isPresented: $isAuthenticated) {
                ShoppingList()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func handleAuthButton() {
        // Form submit handling
        if isLoginPage {
            // if it the login page
            guard let allUsersTable = allUsers else { return }
            
            // use auth controller to check if it is valid login credentials
            if AuthController.validateLogin(UsersTable: allUsersTable, email: viewModel.email.lowercased(), password: viewModel.password) {
                alert = "Successful Login"
                currentUser = viewModel.email.lowercased()
                isAuthenticated = true
            } else {
                // show alert
                alert = "Invalid Login Credentials"
            }
        } else {
            let newUser = UserModel(
                username: viewModel.username.lowercased(),
                email: viewModel.email.lowercased(),
                password: viewModel.password
            )
            
            // check if the user inputs are valid
            guard AuthController.validateRegistration(userModel: newUser) else {
                alert = "Invalid User Input"
                return
            }
            
            guard let allUsersTable = allUsers else { return }
            
            // check if user already exists
            guard !StorageController.isUserExist(UsersTable: allUsersTable, email: newUser.email.lowercased()) else {
                alert = "User Already Exists"
                return
            }
            
            // saves the user into the persistant storage
            allUsers = StorageController.SaveUser(UsersTable: allUsersTable, newUser: newUser)
            viewModel.clear() //  erase the form
            isLoginPage.toggle() // change it to the login page
        }
    }
}

#Preview {
    Authentication()
}
