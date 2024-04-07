//
//  LoginView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-04-07.
//

import SwiftUI

struct LoginView: View {
    @State private var isNextIconTapped = false
    @State private var isSignUpTapped = false
    @State private var password : String = ""
    @State private var email : String = ""

    
    var body: some View {
        NavigationView {
            ZStack{
                
                
                VStack{
                    Spacer()
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal,100)
                    Group{
                        HStack {
                            TextField("Email", text: $email)
                            Spacer()
                           
                        }
                        HStack {
                            SecureField("Password", text: $password)
                            Spacer()
                           
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top)
                    .padding(.horizontal)
                   
                    HStack{
                        Text("If you don't have an account")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .opacity(0.6)
                        Text("Sign up")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .onTapGesture {
                                self.isSignUpTapped = true
                            }

                    }
                    .padding(10)

                    NavigationLink(destination: HomeView(), isActive: $isNextIconTapped) {
                        EmptyView()
                    }
                    .hidden()
                    
                    NavigationLink(destination: SignupView(), isActive: $isSignUpTapped) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Spacer()
                    HStack{
                        Text("LOGIN")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                        Image("NextIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                        .onTapGesture {
                            self.isNextIconTapped = true
                        }
                    
                   
                }
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(Color.black)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)

    }
}



#Preview {
    LoginView()
}
