//
//  InboxView.swift
//  MessengerClone
//
//  Created by seemakus on 4/17/26.
//

import SwiftUI

struct InboxView : View {
    @State var presentNewMessageView : Bool = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ActiveUsersView()
                List {
                        ForEach(1..<10) {_ in
                            NavigationLink( destination: {
                                Text("Inbox Chat View")
                            },label: {
                                InboxRowView()
                                    .swipeActions(edge: .trailing) {
                                        Button(role: .destructive){
                                            print("Delete Tapped")
                                        } label : {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            })
                        }
                }.listStyle(.plain)
            }.fullScreenCover(isPresented: $presentNewMessageView, content: {
                NewMessageView()
            } )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button (action : {
                        presentNewMessageView.toggle()
                    },
                        label : {
                        ZStack(alignment: .center){
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 26,height: 26)
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 10, weight : .bold))
                                .foregroundColor(.black)
                            
                        }
                    })
                }
                ToolbarItem(placement: .navigationBarLeading){
                    HStack {
                        AppImageView(imageSource: .systemImage("person.circle.fill"), imageWidth : 20, imageHeight: 20, contentMode: .fit)
                        Text("Chats")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                }
            }
        }
    }
    
}
#Preview {
        InboxView()
}
