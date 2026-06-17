//
//  RegistrationView.swift
//  MessengerClone
//
//  Created by seemakus on 4/16/26.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @StateObject var registrationVM = RegistrationViewModel()
    
    var body: some View {
       
        var imageFrameSize : CGFloat = horizontalSizeClass == .regular ? 200 : 150

            VStack(spacing: 12){
                Spacer()
                AppImageView(imageSource: .asset("spesh_talent_logo"),imageWidth: imageFrameSize, imageHeight: imageFrameSize, contentMode: .fit)
                AuthTextField(title: "Enter your email",textInput: $registrationVM.email)
                AuthTextField(title: "Enter your full name", textInput: $registrationVM.fullname)
                AuthSecureField(title: "Enter your password", password: $registrationVM.password )
                
                AuthButton(title: "Sign Up") {
                    Task {
                       await registrationVM.registration()
                    }
                    
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
