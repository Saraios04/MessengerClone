//
//  UserService.swift
//  MessengerClone
//
//  Created by seemakus on 6/17/26.
//

import Foundation
import Observation
import FirebaseAuth
import FirebaseFirestore

@Observable
class UserService {
     var currentUser: User?
    
    static let shared = UserService()
    
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("Debug: Currenr user in service is \(currentUser)")
    }
    
    
    
    
}
