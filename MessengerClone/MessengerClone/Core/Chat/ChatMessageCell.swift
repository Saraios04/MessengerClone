//
//  ChatBubble.swift
//  MessengerClone
//
//  Created by seemakus on 5/13/26.
//

import SwiftUI

struct ChatMessageCell: View {
    
     var isFromCurrentUser: Bool
     var body: some View {
         if isFromCurrentUser {
             HStack {
             Spacer()
             Text("This message is from a Current User")
                 .padding()
                 .foregroundColor(Color.white)
                 .background(Color.blue)
                 .clipShape(ChatBubble(isFromCurrentUser: true))
                 .frame(maxWidth: UIScreen.main.bounds.width * 0.75, alignment: .trailing)
                 .padding(.horizontal)
          }
         } else {
             HStack {
                 AppImageView(imageSource: .asset("batman"), imageWidth: 40, imageHeight: 40,contentMode : .fill)
                     .clipShape(Circle())
                 Text("This message is some other sender")
                     .padding()
                     .background(Color.gray.opacity(0.25))
                     .clipShape(ChatBubble(isFromCurrentUser: false))
                     .frame(maxWidth: UIScreen.main.bounds.width * 0.5, alignment: .trailing)
                 Spacer()
             }.padding(.horizontal)
             
         }
        
    }
}

#Preview{
    ChatMessageCell(isFromCurrentUser: true)
}
