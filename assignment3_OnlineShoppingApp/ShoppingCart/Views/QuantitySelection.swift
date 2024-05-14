//
//  QuantitySelection.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 11/5/2024.
//

import SwiftUI

struct QuantitySelection: View {
    var imageName: String
    var title: String
    var price: Double
    var color: Color
    
    // same memory state from parent component
    @Binding var cartList: [CartModel]
    @State var quantity: Int = 0

    // persistant storage
    @AppStorage("Carts") var Carts: String?
    @AppStorage("CurrentUser") var currentUser: String?
    
    // getting the back state so the when a submit of quantity is complete it return back to the previous page
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(color)
                    .opacity(0.25)
                    .frame(width: 170, height:230)
                VStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: 80, height: 80)
                    Text(title)
                    Button() {
                        
                    } label: {
                        Text("$\(String(format: "%.2f",price))")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(color)
                    }
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .frame(width: 170, height:140)
                VStack {
                    // limit the quantity from 0 to 50
                    Stepper(value: $quantity, in: 0...50) {
                        Text("\(quantity)")
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white))
                    }.frame(width: 140, height:50)
                    
                    Button() {
                        // On submit adds the item to the cart json
                        cartList.append(CartModel(item: ItemModel(imageName: imageName, title: title, price: price), quantity: quantity))
                        Carts = StorageController.updateCartTable(CartTable: Carts!, UserCart: cartList, email: currentUser!)
                        
                        // returns to the previous page which is the shopping list
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Total: $\(String(format: "%.2f",(price * Double(quantity))))")
                            .foregroundColor(.white)
                            .frame(width: 140, height: 40)
                            .background(Color.green)
                    // disallow purchase of 0 items
                    }.disabled(quantity == 0)
                }
            }
        }
    }
}

//#Preview {
//    QuantitySelection(imageName: "avocado", title: "Avacado", price: 4.00, color: Color.green)
//}
