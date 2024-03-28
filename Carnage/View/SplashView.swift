//
//  SplashView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .padding(.horizontal,100)
            VStack{
                Spacer()
                Image("NextIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .opacity(0.5)
            }
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    SplashView()
}
