//
//  AuthFieldStyle.Swift
//  MessengerClone
//
//  Created by seemakus on 4/15/26.
//

import Foundation
import SwiftUI

struct AuthFieldStyle: ViewModifier {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    var backgroundColor : Color = Color.gray.opacity(0.1)
      func body(content: Content) -> some View {
          
          var maxHeight : CGFloat = horizontalSizeClass == .regular ? 56 : 40
        content
              .padding()
              .frame(height: maxHeight)
              .frame(maxWidth: 400)
              .background(backgroundColor)
              .cornerRadius(10)
              .padding(.horizontal, 15)
    }

    
}
