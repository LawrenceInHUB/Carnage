//
//  HomeView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-29.
//

import SwiftUI

struct HomeView: View {
    @State var serachString : String = ""
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Image("LogoBlack")
                    Spacer()
                    NavigationLink(destination: MyCartView()) {
                        
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 30 ,height: 30)
                    }
                }
                SearchView(searchString: $serachString)
                AdView()
                TendView()
                NewArrivalView()
                Spacer()
               
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct AdView : View {
    var body: some View{
        VStack(spacing: 5
        ){
            HStack{
                Text("SHOP THE LATEST DROP")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()

            }
            HStack{
                Text("One tap to browse all Latest Releases + Restocks")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .opacity(0.7)
                    .fontWeight(.semibold)
                Spacer()

            }
            NavigationLink(destination: AllProductsView()) {

                HStack{
                    Text("Shop Now")
                        .padding(.vertical, 7)
                        .padding(.horizontal, 15)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .cornerRadius(20)
                        .padding(.top,10)
                }
                Spacer()

            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(15)
        .padding(.vertical)
    }
}

struct TendView : View {
    var body: some View{
        VStack{
            HStack{
                Text("Trending ⚡️")
                
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
               
            }
            ScrollView(.horizontal ,  showsIndicators: false){
                HStack{
                    TendItemView(imageName: "1", productName: "Varsity Crop", price: "4500")
                    TendItemView(imageName: "2", productName: "Classic Tee", price: "3000")
                    TendItemView(imageName: "3", productName: "Runner Short", price: "2500")
                    TendItemView(imageName: "4", productName: "Supersize Tee", price: "4750")
                    TendItemView(imageName: "6", productName: "Gym Short", price: "2750")

                    Spacer()
                }
            }
           
        }
    }
}


struct NewArrivalView : View {
    var body: some View{
        VStack{
            HStack{
                Text("New Arrivals")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
               
            }
            ScrollView(.horizontal ,  showsIndicators: false){
                HStack{
                    TendItemView(imageName: "5", productName: "Gym Short", price: "2750")
                    TendItemView(imageName: "7", productName: "Long Tee", price: "3200")
                    TendItemView(imageName: "9", productName: "Fusion Crop", price: "3350")
                    TendItemView(imageName: "10", productName: "Varsity Crop", price: "4500")
                    TendItemView(imageName: "8", productName: "UNISEX Tee", price: "4250")
                    TendItemView(imageName: "13", productName: "Fusion Crop", price: "3350")
                    Spacer()
                }
            }
           
        }
        .padding(.top)
    }
    
}

struct TendItemView : View {
    @State var imageName: String
    @State var productName: String
    @State var price: String

    var body: some View{
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            VStack(alignment: .leading) {
                Text(productName)
                    .lineLimit(1)
                    .fontWeight(.semibold)
                Text("Rs \(price)")
                    .opacity(0.6)
            }
        }
        .frame(width: 100)
    }
}


struct SearchView: View {
    @Binding var searchString: String

    var body: some View {
        HStack {
            TextField("Find your best clothes", text: $searchString)
            Spacer()
            Image(systemName: "magnifyingglass")
                .opacity(0.5)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        .padding(.top)
    }
}

#Preview {
    HomeView()
}
