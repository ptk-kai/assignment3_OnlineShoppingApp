//
//  StorageController.swift
//  ShoppingCart
//
//  Created by CN TEST on 11/5/2024.
//

import Foundation

class StorageController {
    
    // Saves user into the user json
    static func SaveUser(UsersTable: String, newUser: UserModel) -> String {
        
        do {
            // Convert JSON string to data
            let jsonData = UsersTable.data(using: .utf8)!
            
            // Decode JSON data into a dictionary of type [String: UserModel]
            let jsonDecoder = JSONDecoder()
            var usersDictionary = try jsonDecoder.decode([String: UserModel].self, from: jsonData)
            usersDictionary["\(newUser.email.lowercased())"] = newUser
            
            let jsonEncoder = JSONEncoder()
            let jsonString = try jsonEncoder.encode(usersDictionary)
            return String(data: jsonString, encoding: .utf8) ?? UsersTable
            
        } catch {
            print("Error: \(error)")
        }
        
        return UsersTable
    }
    
    // checks if user exists
    static func isUserExist(UsersTable: String, email: String) -> Bool {

        do {
            // Convert JSON string to data
            let jsonData = UsersTable.data(using: .utf8)!
            
            // Decode JSON data into a dictionary of type [String: UserModel]
            let jsonDecoder = JSONDecoder()
            let usersDictionary = try jsonDecoder.decode([String: UserModel].self, from: jsonData)
            
            if (usersDictionary.contains(where: { $0.key == "\(email.lowercased())"})) {
                return true
            }
            
        } catch {
            print("Error: \(error)")
            return false
        }
        return false
    }
    
    // gets object from the provided email
    static func getUserByEmail(UsersTable: String, email: String) -> UserModel? {

        do {
            // Convert JSON string to data
            let jsonData = UsersTable.data(using: .utf8)!
            
            // Decode JSON data into a dictionary of type [String: UserModel]
            let jsonDecoder = JSONDecoder()
            let usersDictionary = try jsonDecoder.decode([String: UserModel].self, from: jsonData)
            
            let user = usersDictionary["\(email.lowercased())"]
            
            return user
            
        } catch {
            print("Error: \(error)")
        }
        return nil
    }
    
    // updates the cart json for the specific email provided
    static func updateCartTable(CartTable: String, UserCart: [CartModel], email: String) -> String {
        do {
            // Convert JSON string to data
            let jsonData = CartTable.data(using: .utf8)!
            
            // Decode JSON data into a dictionary of type [String: UserModel]
            let jsonDecoder = JSONDecoder()
            var cartDictionary = try jsonDecoder.decode([String: [CartModel]].self, from: jsonData)
            cartDictionary["\(email.lowercased())"] = UserCart
            
            let jsonEncoder = JSONEncoder()
            let jsonString = try jsonEncoder.encode(cartDictionary)
            return String(data: jsonString, encoding: .utf8) ?? CartTable
            
        } catch {
            print("Error: \(error)")
        }
        
        return CartTable
    }
    
    // retrieves the cart object for the specific email provided
    static func getCartByEmail(CartTable: String, email: String) -> [CartModel] {
        do {
            // Convert JSON string to data
            let jsonData = CartTable.data(using: .utf8)!
            
            // Decode JSON data into a dictionary of type [String: UserModel]
            let jsonDecoder = JSONDecoder()
            let cartDictionary = try jsonDecoder.decode([String: [CartModel]].self, from: jsonData)

            return cartDictionary[email] ?? []
            
        } catch {
            print("Error: \(error)")
        }
        
        return []
    }
    
    // inserts invoice to the invoice json for the specific email provided
    static func InsertInvoice(InvoicesTable: String, transactions: InvoiceModel, email: String) -> String {
        
        do {
            // Convert JSON string to data
            let jsonData = InvoicesTable.data(using: .utf8)!
            
            // Decode JSON data into a dictionary of type [String: UserModel]
            let jsonDecoder = JSONDecoder()
            var invoicesDictionary = try jsonDecoder.decode([String: [InvoiceModel]].self, from: jsonData)
            if invoicesDictionary["\(email.lowercased())"] == nil {
                invoicesDictionary["\(email.lowercased())"] = []
            }
            invoicesDictionary["\(email.lowercased())"]?.append(transactions)
            
            let jsonEncoder = JSONEncoder()
            let jsonString = try jsonEncoder.encode(invoicesDictionary)
            return String(data: jsonString, encoding: .utf8) ?? InvoicesTable
            
        } catch {
            print("Error: \(error)")
        }
        
        return InvoicesTable
    }
    
    // retrives list of invoices for the email provided
    static func getInvoiceByEmail(InvoiceTable: String, email: String) -> [InvoiceModel] {
        do {
            // Convert JSON string to data
            let jsonData = InvoiceTable.data(using: .utf8)!
            
            // Decode JSON data into a dictionary of type [String: UserModel]
            let jsonDecoder = JSONDecoder()
            let invoiceDictionary = try jsonDecoder.decode([String: [InvoiceModel]].self, from: jsonData)

            return invoiceDictionary[email] ?? []
            
        } catch {
            print("Error: \(error)")
        }
        
        return []
    }


}


