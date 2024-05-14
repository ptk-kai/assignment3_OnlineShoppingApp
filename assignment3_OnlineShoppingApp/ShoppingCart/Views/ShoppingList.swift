//
//  ShoppingList.swift
//  ShoppingCart
//
//  Created by Tuan Kiet Phan on 11/5/2024.
//

import SwiftUI

struct ShoppingList: View {

    // Instatiate the presistant storage
    @AppStorage("CurrentUser") var currentUser: String?
    @AppStorage("Carts") var Carts: String?
    @AppStorage("Invoices") var Invoices: String?
    
    // have a empty cart
    @State var cartList: [CartModel] = []
    
    // possible background colors for the items to be purchased
    let colors: [Color] = [
        .red,
        .green,
        .blue,
        .yellow,
        .orange,
        .purple
    ]
    
    // list view
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // dummy data or inventory to purchase from
    var items: [ItemModel] = shopItems
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                HStack {
                    // Navigation to the cart view
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
                    
                    // Navigation to the Account where you can log out and see your transactions
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
                    // Shows all stock available
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
                // Creates persistant storage if it does not exist
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
