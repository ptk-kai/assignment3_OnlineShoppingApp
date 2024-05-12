//
//  ShoppingList.swift
//  ShoppingCart
//
//  Created by CN TEST on 11/5/2024.
//

import SwiftUI

struct ShoppingList: View {
    @AppStorage("CurrentUser") var currentUser: String?
    @AppStorage("Carts") var Carts: String?
    @AppStorage("Invoices") var Invoices: String?
    
    @State var cartList: [CartModel] = []
    
    let colors: [Color] = [
        .red,
        .green,
        .blue,
        .yellow,
        .orange,
        .purple
    ]
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var items: [ItemModel] = shopItems
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                HStack {
                    NavigationLink(
                        destination: Cart(cartList: $cartList),
                        label: {
                            HStack{
                                Image(systemName: "cart.fill")
                                Text("\(cartList.count)")
                            }
                        })

                    Spacer()
                    
                    Text("The Shopper").bold().font(.title)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Account(),
                        label: {
                            HStack{
                                Image(systemName: "person.crop.circle")

                            }
                        })
                    
                    
                }.padding()
                VStack {
                    Text("Hello, \(currentUser ?? "User")")
                        .frame(width: 320)
                        .foregroundColor(.gray)
                    Spacer().frame(height: 75)
                }.padding(20)
                
                ScrollView() {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(shopItems.indices, id: \.self) { index in
                            let randomColor = colors.randomElement() ?? .clear
                            let item = shopItems[index]
                            ShopItem(imageName: item.imageName, title: item.title, price: item.price, color: randomColor, cartList: $cartList)
                        }
                    }
                }.padding(15)
                
                
            }
            .onAppear {
                if Carts == nil {
                    Carts = "{}"
                } else {
                    cartList = StorageController.getCartByEmail(CartTable: Carts!, email: currentUser!)
                }
                
                if Invoices == nil {
                    Invoices = "{}"
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ShoppingList()
}
