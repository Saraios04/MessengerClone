//
//  AuthButton.swift
//  MessengerClone
//
//  Created by seemakus on 4/15/26.
//

import Foundation
import SwiftUI

struct AuthButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action){
            Text(title)
                .foregroundColor(Color.white)
                .modifier(AuthFieldStyle(backgroundColor : Color.blue))
                
        }
    }
}

#Preview {
    AuthButton(title: "Title"){
        print("title pressed")
    }
}
