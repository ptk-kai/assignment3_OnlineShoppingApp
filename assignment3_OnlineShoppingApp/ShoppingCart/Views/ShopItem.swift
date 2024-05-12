//
//  ShopItem.swift
//  ShoppingCart
//
//  Created by CN TEST on 11/5/2024.
//

import SwiftUI

struct ShopItem: View {
    var imageName: String
    var title: String
    var price: Double
    var color: Color
    @Binding var cartList: [CartModel]
    @State var hasClicked = false
    
    var body: some View {
        NavigationStack {
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
                    NavigationLink(
                        destination: QuantitySelection(imageName: imageName, title: title, price: price, color: color, cartList: $cartList),
                        label: {
                            Text("$\(String(format: "%.2f",price))")
                                .foregroundColor(.white)
                                .frame(width: 100, height: 40)
                                .background(color)
                        })

//                    Button() {
//                        hasClicked = true
//                    } label: {
//                        Text("$\(String(format: "%.2f",price))")
//                            .foregroundColor(.white)
//                            .frame(width: 100, height: 40)
//                            .background(color)
//                    }
                }
            }
//            .navigationDestination(isPresented: $hasClicked) {
//                QuantitySelection(imageName: imageName, title: title, price: price, color: color, cartList: $cartList)
//            }
        }
    }
}

//#Preview {
//    ShopItem(imageName: "avocado", title: "Avacado", price: 4.00, color: Color.green)
//}
