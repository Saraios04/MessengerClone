//
//  MessengerCloneApp.swift
//  MessengerClone
//
//  Created by seemakus on 4/9/26.
//

import SwiftUI

@main
struct MessengerCloneApp: App {
    var body: some Scene {
        WindowGroup {
            ChatMessageCell(isFromCurrentUser: false)
            //InboxView()
           // ProfileView(profileUser: User.MOCK_User)
            //LoginView()
           // ActiveUsersView()
        }
    }
}
