//
//  Account.swift
//  ShoppingCart
//
//  Created by Tuan Kiet Phan on 12/5/2024.
//

import SwiftUI

struct Account: View {
    // Get all presistant Jsons
    @AppStorage("Users") var allUsers: String?
    @AppStorage("CurrentUser") var currentUser: String?
    @AppStorage("Invoices") var Invoices: String?
    
    @State var user: UserModel?
    @State var invoiceHistory: [InvoiceModel] = []
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Text("Account")
                    .font(.system(size: 44, weight: .semibold, design: .rounded))
                    .frame(width: 320)
                    .padding(25)
                

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.8)
                        .frame(width: 350, height: 70)
                    VStack {
                        Text("Email:")
                            .foregroundColor(.white)
                            .font(.headline)
                        Text("\(user?.email ?? "No email address")")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.8)
                        .frame(width: 350, height: 70)
                    VStack {
                        Text("Username:")
                            .foregroundColor(.white)
                            .font(.headline)
                        Text("\(user?.username ?? "No username")")
                            .foregroundColor(.white)
                            .bold()
                    }
                }

                List {
                    // List all transactions
                    Section(header: Text("Transactions")) {
                        ForEach(invoiceHistory.indices, id: \.self) { index in
                            let invoice = invoiceHistory[index]
                            // on click of the Invoice will retiract to a detailed transaction an items of the invoice
                            NavigationLink(
                                destination: DetailedTransaction(transaction: invoice.transaction, datetime: invoice.datetime, total: invoice.total), //  redirect to the start menu
                                label: {
                                    Text("\(invoice.datetime.formatted(.dateTime)) - $\(String(format: "%.2f", invoice.total))")
                                })
                        }
                    }
                }
                                
                Spacer()
                
                Button {
                    // removes the current user from memory and persistant storage
                    currentUser = ""
                    isLoggedOut = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.red)
                            .opacity(0.8)
                            .frame(width: 350, height: 80)
                        Text("Log Out")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                
                
            }
            .onAppear {
                // gets user data 
                user = StorageController.getUserByEmail(UsersTable: allUsers!, email: currentUser!)
                // gets invoice data
                invoiceHistory = StorageController.getInvoiceByEmail(InvoiceTable: Invoices!, email: currentUser!)
            }
            .navigationDestination(isPresented: $isLoggedOut) {
                // if log out is click in redirects to the authentication page
                Authentication()
            }
            
        }
    }
}

#Preview {
    Account()
}
