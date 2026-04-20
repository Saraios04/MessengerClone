//
//  File.swift
//  MessengerClone
//
//  Created by seemakus on 4/15/26.
//


import SwiftUI

struct AuthTextField : View {
    let title: String
    @Binding var textInput : String
    var uiKeyBoard: UIKeyboardType = .default
    
    var body: some View {
        TextField(title, text: $textInput)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .modifier(AuthFieldStyle())
    }
    
}

#Preview {
    @Previewable @State var textInput = "" 
    AuthTextField(title: "example text", textInput: $textInput)
}
