//
//  InboxView.swift
//  MessengerClone
//
//  Created by seemakus on 4/17/26.
//

import SwiftUI

struct InboxView : View {
    @State var presentNewMessageView : Bool = false
    
    let userService = UserService.shared
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
            }.navigationDestination(for: User.self, destination: { user in
    ProfileView(
        profileUser: UserService.shared.currentUser)
})
            
            .fullScreenCover(isPresented: $presentNewMessageView, content: {
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
                        NavigationLink(value:  userService.currentUser) {
                            if let profileImageUrl = userService.currentUser?.profileImageUrl{
                                AppImageView(
                                    imageSource:
                                            .asset(
                                                profileImageUrl
                                            ),
                                    imageWidth : 30,
                                    imageHeight: 30,
                                    contentMode: .fill
                                ).clipShape(Circle())
                            } else {
                                AppImageView(
                                imageSource:
                                        .systemImage("person.crop.circle"),
                                imageWidth : 30,
                                imageHeight: 30,
                                contentMode: .fill
                            ).foregroundStyle(Color.black)
                             .clipShape(Circle())
                                
                            }
                        }
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
