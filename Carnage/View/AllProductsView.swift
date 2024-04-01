//
//  AllProductsView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-29.
//

import SwiftUI

struct AllProductsView: View {
    @State var searchString = ""
    @State var maxPrice = ""
    @State var selectedSize = ""
    @StateObject var productViewModel = ProductViewModel()

    var filteredProducts: [ProductModel] {
        if searchString.isEmpty && maxPrice.isEmpty && selectedSize.isEmpty {
            return productViewModel.clothingItems
        } else {
            var filtered = productViewModel.clothingItems
            
            if !searchString.isEmpty {
                filtered = filtered.filter {
                    $0.title.localizedCaseInsensitiveContains(searchString)
                }
            }
            
            if let maxPriceValue = Int(maxPrice), maxPriceValue > 0 {
                filtered = filtered.filter { $0.price <= maxPriceValue }
            }
            
            if !selectedSize.isEmpty {
                filtered = filtered.filter { $0.size.rawValue == selectedSize }
            }
            
            return filtered
        }
    }
    
    var body: some View {
            NavigationStack {
                ScrollView {
                    SearchView(searchString: $searchString)
                        .padding(.horizontal)
                    HStack{
                        SizeFilter(selectedSize: $selectedSize)
                        PriceFilter(maxPrice: $maxPrice)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(0..<filteredProducts.count, id: \.self) { index in
                            if index % 2 == 0 {
                                HStack(spacing: 20) {
                                    NavigationLink(destination: SingleProductView(product: filteredProducts[index])) {
                                        ProductItemView(product: filteredProducts[index])
                                    }
                                    if index + 1 < filteredProducts.count {
                                        NavigationLink(destination: SingleProductView(product: filteredProducts[index + 1])) {
                                            ProductItemView(product: filteredProducts[index + 1])
                                        }
                                    } else {
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .onAppear {
                        productViewModel.fetchData()
                    }
                }
            }
        }
    }

struct ProductItemView: View {
    let product: ProductModel
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 200)
                .background(Color.red)
                .cornerRadius(10)
            Text(product.title)
                .lineLimit(2)
                .fontWeight(.semibold)
                .foregroundColor(.black)

            Text("Rs.\(product.price)")
                .opacity(0.6)
                .foregroundColor(.black)
                .fontWeight(.medium)


        }
    }
}

struct SizeFilter: View {
    @Binding var selectedSize: String
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(["S", "M", "L"], id: \.self) { size in
                Button(action: {
                    if selectedSize == size {
                        selectedSize = ""
                    } else {
                        selectedSize = size
                    }
                }) {
                    Text(size)
                        .foregroundColor(selectedSize == size ? .white : .black)
                        .padding(8)
                        .frame(width: 36, height: 36)
                        .background(selectedSize == size ? Color.black : Color.white)
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .padding(.top)
    }
}

struct PriceFilter : View {
    @Binding var maxPrice: String
    
    var body: some View {
        HStack {
            TextField("Max Price", text: $maxPrice)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        .padding(.top)
        .frame(width: 120)
    }
}




#Preview {
    AllProductsView()
}
