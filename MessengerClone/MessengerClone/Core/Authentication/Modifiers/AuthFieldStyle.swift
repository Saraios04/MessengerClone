//
//  AuthFieldStyle.Swift
//  MessengerClone
//
//  Created by seemakus on 4/15/26.
//

import Foundation
import SwiftUI

struct AuthFieldStyle: ViewModifier {
    var backgroundColor : Color = Color.gray.opacity(0.1)
      func body(content: Content) -> some View {
        content
              .padding()
              .frame(height: 40)
              .frame(maxWidth: .infinity)
              .background(backgroundColor)
              .cornerRadius(10)
              .padding(.horizontal, 15)
    }

    
}
