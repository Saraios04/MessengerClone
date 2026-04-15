//
//  LoginView.swift
//  MessengerClone
//
//  Created by seemakus on 4/9/26.
//

import SwiftUI

struct LoginView:  View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                VStack {
                    Image("spesh_talent_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()
                    
                    AuthTextField(title: "Enter your email", textInput: $email, uiKeyBoard: .emailAddress)
                    AuthSecureField(
                        title: "Enter your password",
                        password: $password
                    )
                    
                }
                
                HStack {
                    Spacer()
                    Button {
                        print("ForgotPassword Button Pressed")
                    } label : {
                        Text("Forgot Password?")
                            .padding()
                            .fontWeight(.semibold)
                    }
                }
                
                AuthButton(title: "Login",
                action: {
                    print("Login Pressed")
                })
                              
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
                
                Divider()
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.blue)
                    
                    NavigationLink {
                        Text("Sign Up")
                    } label : {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    
                }.padding()
         }
      }
    }
}
#Preview{
    LoginView()
}
