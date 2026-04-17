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
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some View {
        let frameSize : CGFloat = horizontalSizeClass == .regular ? 50 : 30
        let imageFrameSize : CGFloat = horizontalSizeClass == .regular ? 200 : 150
        NavigationStack{
            ScrollView {
                VStack{
                    Spacer()
                    VStack {
                        VStack(spacing: 12) {
                            AppImageView(imageSource:.asset("spesh_talent_logo"),imageWidth: imageFrameSize, imageHeight: imageFrameSize,contentMode: .fit)
                            AuthTextField(title: "Enter your email", textInput: $email, uiKeyBoard: .emailAddress)
                            AuthSecureField(
                                title: "Enter your password",
                                password: $password)
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
                                .frame(maxWidth: 400)
                                .foregroundColor(.gray)
                            
                            Text("OR")
                            
                            Rectangle()
                                .frame(height: 1)
                                .frame(maxWidth: 400)
                                .foregroundColor(.gray)
                            
                        } .padding()
                        
                        HStack {
                            Image("Download-Facebook-data")
                                .resizable()
                                .scaledToFit()
                                .frame(width: frameSize,height: frameSize)
                            Text("Continue with Facebook")
                                .foregroundColor(.blue)
                            
                        }.bold()
                        
                    }.frame(maxWidth: 420)
                    
                    Spacer()
                    
                    Divider()
                    
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.blue)
                        
                        NavigationLink {
                            RegistrationView()
                                .navigationBarBackButtonHidden(true)
                        } label : {
                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                        
                    }.padding()
                }
            }
      }
    }
}
#Preview{
    LoginView()
}
