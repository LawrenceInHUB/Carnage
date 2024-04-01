//
//  CheckoutView.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-31.
//

import SwiftUI


struct CheckoutView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = ""
    @State private var cardNumber = ""
    @State private var exp = ""
    @State private var vcc = ""
    @State private var phone = ""
    @State private var showingAlert = false
    @State private var paymentCompleted = false
    @State private(set) var cartItems: [ProductModel] = []

    let totalPrice: Int
    
    var body: some View {
        VStack {
            VStack(alignment: .leading
            ){
                HStack{
                    Spacer()
                    Image("LogoBlack")
                    Spacer()
                }
                .padding(.bottom)
                Text("Delivery Details")
                HStack{
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                TextField("Address", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Phone", text: $phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding(.bottom,30)
                
                
                Text("Payment Details")
                TextField("Card Number", text: $cardNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                    TextField("Exp", text: $exp)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("CVV", text: $vcc)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }
            }
            
            HStack{
                Spacer()
            Text("Total Price: Rs. \(totalPrice)")
                .font(.headline)
                .padding()
        }
            
            Spacer()
            Button(action: {
                               
                MyCart.shared.clearCart()
                                // Show payment done alert
                                self.showingAlert = true
                                // Set paymentCompleted to true
                                self.paymentCompleted = true
                            }, label: {
                                VStack {
                                    Text("Pay Now")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(20)
                            })
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Payment done"), message: nil, dismissButton: .default(Text("OK")))
                            }
                            
                            // Navigation link to go back to HomeView upon payment completion
                            NavigationLink(
                                destination: HomeView(),
                                isActive: $paymentCompleted,
                                label: { EmptyView() }
                            )
                            .hidden() // Hide the link, it will navigate programmatically
        }
        .padding()
        //.navigationBarTitle("Checkout")
        .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Payment done ✅\n Thank you !"), message: nil, dismissButton: .default(Text("OK")))
                }
    }
}


#Preview {
    CheckoutView(totalPrice: 8900)
}
