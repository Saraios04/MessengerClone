//
//  LoginView.swift
//  MessengerClone
//
//  Created by seemakus on 4/9/26.
//

import SwiftUI

struct LoginView:  View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.dismiss) private var dismiss
    @StateObject var loginVM  = LoginViewModel()
    
    var body: some View {
        let frameSize : CGFloat = horizontalSizeClass == .regular ? 50 : 30
        let imageFrameSize : CGFloat = horizontalSizeClass == .regular ? 200 : 150
        NavigationStack{
                VStack{
                    Spacer()
                    VStack {
                        VStack(spacing: 12) {
                            AppImageView(imageSource:.asset("spesh_talent_logo"),imageWidth: imageFrameSize, imageHeight: imageFrameSize,contentMode: .fit)
                            AuthTextField(title: "Enter your email", textInput: $loginVM.email, uiKeyBoard: .emailAddress)
                            AuthSecureField(
                                title: "Enter your password",
                                password: $loginVM.password)
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
                            Task {
                               await loginVM.login()
                            }
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

#Preview{
    LoginView()
}
