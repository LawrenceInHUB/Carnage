//
//  SplashView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-24.
//

import SwiftUI

struct SplashView: View {
    @State private var isNextIconTapped = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal,100)
                
                VStack{
                    Spacer()
                    NavigationLink(destination: HomeView(), isActive: $isNextIconTapped) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Image("NextIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .opacity(0.5)
                        .onTapGesture {
                            self.isNextIconTapped = true
                        }
                }
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(Color.black)
        }
        //.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    SplashView()
}
