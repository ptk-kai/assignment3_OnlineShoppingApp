//
//  Cart.swift
//  ShoppingCart
//
//  Created by CN TEST on 11/5/2024.
//

import SwiftUI

struct Cart: View {
    @AppStorage("Invoices") var Invoices: String?
    @AppStorage("Carts") var Carts: String?
    @AppStorage("CurrentUser") var currentUser: String?
    
    @Binding var cartList: [CartModel]
    
    var body: some View {
        VStack {
            Text("My Cart")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            
            List {
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
                Text("$\(String(format: "%.2f", calcTotalCost()))")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(width: 350, alignment: .leading)
                    .padding(.leading, 60)
            }
            Button() {
                let transaction = InvoiceModel(transaction: cartList, total: calcTotalCost())
                Invoices = StorageController.InsertInvoice(InvoicesTable: Invoices!, transactions: transaction, email: currentUser!)
                cartList = []
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
            .disabled(cartList.count == 0)
            .offset(x: 80)
        }
    }
    
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
