//
//  SignupView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-04-07.
//

import SwiftUI

struct SignupView: View {
    @State private var isNextIconTapped = false
    @State private var password : String = ""
    @State private var email : String = ""
    @State private var name : String = ""
    @State private var telephone : String = ""
    @State private var confimPassword : String = ""
    @State private var isLoginTapped : Bool  =  false


    
    var body: some View {
        NavigationStack {
            ZStack{
                
                
                VStack{
                    Spacer()
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal,100)
                    Group{
                        HStack {
                            TextField("Full Name", text: $name)
                            Spacer()
                           
                        }
                        HStack {
                            TextField("Telephone", text: $telephone)
                                .keyboardType(.numberPad)
                            Spacer()
                            
                           
                        }
                        HStack {
                            TextField("Email", text: $email)
                            Spacer()
                           
                        }
                        HStack {
                            SecureField("Password", text: $password)
                            Spacer()
                           
                        }
                        HStack {
                            SecureField("Confirm Password", text: $confimPassword)
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
                        Text("If you have account already")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .opacity(0.6)
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .onTapGesture {
                                self.isLoginTapped = true
                            }

                    }
                    .padding(10)

                    NavigationLink(destination: LoginView(), isActive: $isNextIconTapped) {
                        EmptyView()
                    }
                    .hidden()
                    
                    
                    NavigationLink(destination: LoginView(), isActive: $isLoginTapped) {
                        EmptyView()
                    }
                    .hidden()
                    Spacer()
                    HStack{
                        Text("SIGN UP")
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
    SignupView()
}
