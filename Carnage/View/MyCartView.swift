//
//  MyCartView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-30.
//

import SwiftUI

struct MyCartView: View {
    @StateObject private var myCart = MyCart.shared

    var totalPrice: Int {
        myCart.cartItems.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(myCart.cartItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text("Price: Rs. \(item.price)")
                                    .foregroundColor(.gray)
                                Text("Size: \(item.size.rawValue)")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            DeleteButton(action: {
                                myCart.remove(product: item)
                            })
                        }
                    }
                }
                .navigationBarTitle("My Cart")

                Text("Total Price: Rs. \(totalPrice)")
                    .font(.headline)
                    .padding()
                VStack{
                    NavigationLink(destination: CheckoutView(totalPrice: totalPrice)) {
                        Text("Proceed to Checkout")
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(40)
                            .padding(.horizontal,30)
                            .font(.system(size: 16 , weight: .semibold))
                    }
                    .frame(height: 60)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
            }
        }
    }
}

struct DeleteButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "trash")
                .foregroundColor(.red)
                .frame(width: 40, height: 40)
        }
        .buttonStyle(PlainButtonStyle())
    }
}




class MyCart: ObservableObject {
    static let shared = MyCart()
    private init() {}

    @Published private(set) var cartItems: [ProductModel] = []

    func add(product: ProductModel) {
        cartItems.append(product)
    }

    func remove(product: ProductModel) {
        if let index = cartItems.firstIndex(where: { $0.id == product.id }) {
            cartItems.remove(at: index)
        }
    }

    func clearCart() {
        cartItems.removeAll()
    }
}


#Preview{
    
    let sampleProduct = ProductModel(id: "1", title: "Sample Product", des: "Sample description", category: "Sample category", sex: .Men, price: 99, image: "sample_image", size: .m, v: 1)
    return MyCartView()
}
