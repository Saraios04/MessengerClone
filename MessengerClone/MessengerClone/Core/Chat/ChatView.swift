//
//  ChatView.swift
//  MessengerClone
//
//  Created by seemakus on 5/12/26.
//

import SwiftUI

struct ChatView: View {
    @State var inputText : String
    
    var body: some View {
        VStack {
            ScrollView {
                    VStack {
                        AppImageView(
                            imageSource: .systemImage("person.circle.fill"),
                            imageWidth: 90,
                            imageHeight: 90,
                            contentMode: .fill
                        )
                        VStack(spacing: 4){
                            Text("UserName")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("Messenger")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    ForEach(0..<10) {i in
                        ChatMessageCell(isFromCurrentUser: i % 2 == 0)
                    }
                }
            
                Spacer()
                
                ZStack(alignment: .trailing) {
                    TextField("Message...", text: $inputText, axis: .vertical )
                        .padding()
                        .padding(.trailing, 48)
                        .background(Color(.systemGroupedBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    Button {
                        print("Message sent")
                    } label : {
                        Text("Send")
                            .fontWeight(.bold)
                    }
                    .padding()
                    
                }.padding()
            
        }
    }
}

#Preview {
    ChatView(inputText: "message")
}
