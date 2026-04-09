//
//  LoginView.swift
//  MessengerClone
//
//  Created by seemakus on 4/9/26.
//

import SwiftUI

struct LoginView:  View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                VStack {
                    Image("spesh_talent_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    TextField("Enter your email",text: $email)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                    
                    
                    TextField("Enter your Pasword", text: $password)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                    
                }.padding()
                
                HStack {
                    Spacer()
                    Button("Forgot Passowrd?") {
                        print("Forgot Password")
                    }.padding()
                }.bold()
                
                Button("Login") {
                    print("Login Button Clicked")
                    
                }.frame(maxWidth: .infinity, minHeight: 30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    
                    Text("OR")
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    
                } .padding()
                
                HStack {
                    Image("Download-Facebook-data")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                    Text("Continue with Facebook")
                        .foregroundColor(.blue)
                    
                }.bold()
                
                Spacer()
                
                Rectangle()
                    .frame(height : 1)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.blue)
                    Button("Sign Up"){
                      print("Sign Up Pressed")
                   }
                }.padding()
                    .fontWeight(.bold)
         }
      }
    }
}
#Preview{
    LoginView(email: "", password: "")
}
