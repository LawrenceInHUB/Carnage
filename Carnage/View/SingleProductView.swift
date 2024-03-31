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
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 60, height: 400)
                .background(Color.gray)
                .cornerRadius(10)
            Text(product.title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 10)
            HStack{
            VStack(alignment : .leading){
                HStack{
                    Text("Size ")
                    Text(product.size.rawValue)
                }
                
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.top, 10)
                Text(product.des)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                Text("Rs.\(product.price).00")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .opacity(0.7)
                    .padding(.top, 5)
            }
            .padding()
                Spacer()
            
        }
            Spacer()
            Button(action: {
                self.addToCart()
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
            }
          
        }
        .padding()
        .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("Added to cart successfully"), dismissButton: .default(Text("OK")))
            }
        //.navigationBarTitle(Text("Product Details"), displayMode: .inline)
    }
    
    private func addToCart() {
        // Add product to cart
        MyCart.shared.add(product: product)
        isAddedToCart = true
        showAlert = true // Set showAlert to true to trigger the alert
    }
}


#Preview{
    
    let sampleProduct = ProductModel(id: "1", title: "Sample Product", des: "Sample description", category: "Sample category", sex: .Men, price: 99, image: "sample_image", size: .m, v: 1)

        return    SingleProductView(product: sampleProduct)
}
