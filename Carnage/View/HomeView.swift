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
        ZStack{
            VStack{
                HStack{
                    Image("LogoBlack")
                    Spacer()
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 30 ,height: 30)
                       
                }
                SearchView(searchString: $serachString)
                AdView()
                TendView()
                NewArrivalView()
                Spacer()
               
            }
            .padding()
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
                    TendItemView()
                    TendItemView()
                    TendItemView()
                    TendItemView()
                    TendItemView()
                    TendItemView()
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
                    TendItemView()
                    TendItemView()
                    TendItemView()
                    TendItemView()
                    TendItemView()
                    TendItemView()
                    Spacer()
                }
            }
           
        }
        .padding(.top)
    }
    
}

struct TendItemView : View {
    var body: some View{
        VStack{
            VStack{
                
            }
            .frame(width: 100, height: 130)
            .background(Color.gray)
            .cornerRadius(10)
            VStack(alignment: .leading){
                Text("Product Name deyg 3yg")
                    .lineLimit(2)
                    .fontWeight(.semibold)
                Text("Rs 3170")
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
