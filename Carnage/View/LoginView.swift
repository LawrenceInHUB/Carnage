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
    @State private var showAlert = false
    @State private var alertMessage = ""

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
                    
                    NavigationLink(destination: HomeView(), isActive: $isNextIconTapped) {
                                            EmptyView()
                                        }
                                        .hidden()
                                        
                                        NavigationLink(destination: SignupView(), isActive: $isSignUpTapped) {
                                            EmptyView()
                                        }
                                        .hidden()
                   
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
                        if self.email.lowercased() == "raveen@gmail.com" && self.password == "Raveen123" {
                            self.isNextIconTapped = true
                        } else {
                            self.showAlert = true
                            self.alertMessage = "Invalid email or password"
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(Color.black)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
