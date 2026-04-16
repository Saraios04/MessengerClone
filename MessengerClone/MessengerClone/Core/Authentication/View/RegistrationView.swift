//
//  RegistrationView.swift
//  MessengerClone
//
//  Created by seemakus on 4/16/26.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       
        VStack(spacing: 12){
            Spacer()
            AppImageView(imageName: "spesh_talent_logo",imageWidth: 150, imageHeight: 150, contentMode: .fit)
            AuthTextField(title: "Enter your email",textInput: $email)
            AuthTextField(title: "Enter your full name", textInput: $fullName)
            AuthSecureField(title: "Enter your password", password: $password )
            AuthButton(title: "Sign Up") {
                print("Sign up")
            }
            
            Spacer()
            Divider()
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.blue)
                Button {
                   dismiss()
                } label: {
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    
            }.padding()
            }
        }
        
}


#Preview{
    RegistrationView()
}
