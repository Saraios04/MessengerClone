//
//  AuthSecureFiled.swift
//  MessengerClone
//
//  Created by seemakus on 4/15/26.
//

import Foundation
import SwiftUI

struct AuthSecureField: View {
    let title: String
    @Binding var password: String
    
    
    var body: some View {
        SecureField(title, text: $password)
            .modifier(AuthFieldStyle())

    }
}

#Preview {
    @Previewable @State var pass = "paass"
    AuthSecureField(title: "Secure Field", password: $pass )
}
