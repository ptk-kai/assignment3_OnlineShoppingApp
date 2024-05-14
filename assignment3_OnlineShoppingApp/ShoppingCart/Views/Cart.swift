//
//  Cart.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 11/5/2024.
//

import SwiftUI

struct Cart: View {
    // gets the presistant memory jsons
    @AppStorage("Invoices") var Invoices: String?
    @AppStorage("Carts") var Carts: String?
    @AppStorage("CurrentUser") var currentUser: String?
    
    // get the parent component of the cart list
    @Binding var cartList: [CartModel]
    
    var body: some View {
        VStack {
            Text("My Cart")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            
            List {
                // Lists all of the purchased items in the cart list
                ForEach(cartList.indices, id: \.self) { index in
                    let item = cartList[index].item
                    let quantity = cartList[index].quantity
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 40,height: 40)
                        VStack(spacing: 5) {
                            Text(item.title)
                            Text("\(quantity) * ($\(String(format: "%.2f", item.price))) = $\(String(format: "%.2f",item.price * Double(quantity)))")
                                .foregroundColor(.gray)
                        }
                    }
                }.onDelete {
                    // has the ability to delete
                    indexSet in cartList.remove(atOffsets: indexSet)
                    Carts = StorageController.updateCartTable(CartTable: Carts!, UserCart: cartList, email: currentUser!)
                }
            }
        }
        Spacer()
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.green)
                .opacity(0.8)
                .frame(width: 350, height: 120)
            VStack {
                Text("Total Price")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .frame(width: 350, alignment: .leading)
                    .padding(.leading, 60)
                // total price of the cart
                Text("$\(String(format: "%.2f", calcTotalCost()))")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(width: 350, alignment: .leading)
                    .padding(.leading, 60)
            }
            Button() {
                // creates a transaction when clicking pay now
                let transaction = InvoiceModel(transaction: cartList, total: calcTotalCost())
                // saves the cart into the Invoice Json persistant storage
                Invoices = StorageController.InsertInvoice(InvoicesTable: Invoices!, transactions: transaction, email: currentUser!)
                // reverts the cart list to empty 
                cartList = []
                // reverts the persistant storage of the cart to empty as well
                Carts = StorageController.updateCartTable(CartTable: Carts!, UserCart: cartList, email: currentUser!)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder()
                        .frame(width: 120, height: 50)
                        .foregroundColor(.white)
                    Text("Pay Now >")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            // only allow a invoice to be made when there are items in the cart
            .disabled(cartList.count == 0)
            .offset(x: 80)
        }
    }
    
    // Calculates the total cost of the cart
    func calcTotalCost() -> Double {
        var totalCost = 0.0
        for itemData in cartList {
            let item = itemData.item
            let quantity = itemData.quantity
            totalCost += item.price * Double(quantity)
        }
        return totalCost
    }
}

//#Preview {
//    Cart(cartList: [
//        [ItemModel(imageName: "avocado", title: "Avocado", price: 4.00), 2],
//        [ItemModel(imageName: "banana", title: "Banana", price: 2.50), 3]
//    ])
//}
