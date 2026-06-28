//
//  InboxViewModel.swift
//  MessengerClone
//
//  Created by seemakus on 6/28/26.
//

import Foundation
import FirebaseAuth

@Observable
class NewMessageViewModel {
    
    var users: [User] = []
    var errorMessage : String = ""
 
    func fetchAllUsers() async {
        do {
            guard let currentUid =  Auth.auth().currentUser?.uid  else { return }
            var users =  try await UserService.shared.fetchAllUsers()
            self.users = users.filter ({ $0.id != currentUid})
        } catch {
            self.errorMessage = "Unable to fetch the current errors"
            print("\(error.localizedDescription)")
        }
    }
    
}
