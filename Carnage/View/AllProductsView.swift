//
//  AllProductsView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-29.
//

import SwiftUI

struct AllProductsView: View {
    @State var serachString : String = ""

    var body: some View {
        ScrollView {
            SearchView(searchString: $serachString)
                .padding(.horizontal)
            VStack(alignment: .leading, spacing: 20) {
                ForEach(0..<dummyProducts.count, id: \.self) { index in
                    if index % 2 == 0 {
                        HStack(spacing: 20) {
                            ProductItemView(product: dummyProducts[index])
                            if index + 1 < dummyProducts.count {
                                ProductItemView(product: dummyProducts[index + 1])
                            } else {
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}



struct ProductItemView: View {
    let product: Product1
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.width / 2 - 30)
                .background(Color.red)
                .cornerRadius(10)
            Text(product.name)
                .lineLimit(2)
                .fontWeight(.semibold)
            Text(product.price)
                .opacity(0.6)
        }
        
    }
}


struct Product1: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let imageName: String
}

let dummyProducts = [
    Product1(name: "Product 1", price: "Rs 100", imageName: "product1"),
    Product1(name: "Product 2", price: "Rs 200", imageName: "product2"),
    Product1(name: "Product 3", price: "Rs 300", imageName: "product3"),
    Product1(name: "Product 4", price: "Rs 400", imageName: "product4"),
    Product1(name: "Product 5", price: "Rs 500", imageName: "product5"),
    Product1(name: "Product 6", price: "Rs 600", imageName: "product6"),
]



#Preview {
    AllProductsView()
}
