//
//  DetailedTransaction.swift
//  ShoppingCart
//
//  Created by Mark Gutierrez on 12/5/2024.
//

import SwiftUI

struct DetailedTransaction: View {
    @State var transaction: [CartModel]
    @State var datetime: Date
    @State var total: Double
    
    var body: some View {
        VStack {
            // Lists out all items in an invoice
            Text("Transaction: \(datetime.formatted(.dateTime)) - $\(String(format: "%.2f", total))")
            List {
                ForEach(transaction.indices, id: \.self) { index in
                    let item = transaction[index].item
                    let quantity = transaction[index].quantity
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
                }
            }
        }
    }
}

//#Preview {
//    DetailedTransaction()
//}
