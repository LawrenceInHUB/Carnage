//
//  SingleProductView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-30.
//

import SwiftUI

struct SingleProductView: View {
    let product: ProductModel
    @State private var isAddedToCart = false
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 60, height: 300)
                .background(Color.red)
                .cornerRadius(10)
            Text(product.title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 10)
            Text("Rs.\(product.price)")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)
            Button(action: {
                self.addToCart()
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text("Product Details"), displayMode: .inline)
    }
    
    private func addToCart() {
        // Add product to cart
        MyCart.shared.add(product: product)
        isAddedToCart = true
    }
}


#Preview{
    
    let sampleProduct = ProductModel(id: "1", title: "Sample Product", des: "Sample description", category: "Sample category", sex: .Men, price: 99, image: "sample_image", size: .m, v: 1)

        return    SingleProductView(product: sampleProduct)
}
