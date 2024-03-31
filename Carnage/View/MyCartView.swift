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
            NavigationView {
                VStack {
                    List {
                        ForEach(myCart.cartItems) { item in
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text("Price: Rs. \(item.price)")
                                    .foregroundColor(.gray)
                                Text("Size: \(item.size.rawValue)")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .navigationBarTitle("My Cart")
                    
                    Text("Total Price: Rs. \(totalPrice)")
                        .font(.headline)
                        .padding()
                    
                    NavigationLink(destination: CheckoutView(totalPrice: totalPrice)) {
                        Text("Proceed to Checkout")
                            .font(.headline)
                            .padding()
                    }
                    
                    Spacer()
                }
            }
        }
    }


class MyCart: ObservableObject {
    static let shared = MyCart()
    private init() {}
    
    @Published private(set) var cartItems: [ProductModel] = []
    
    func add(product: ProductModel) {
        cartItems.append(product)
    }
    
    func clearCart() {
            cartItems.removeAll()
        }

}

#Preview{
    
    let sampleProduct = ProductModel(id: "1", title: "Sample Product", des: "Sample description", category: "Sample category", sex: .Men, price: 99, image: "sample_image", size: .m, v: 1)
    return MyCartView()
}
