//
//  AuthService.swift
//  MessengerClone
//
//  Created by seemakus on 6/14/26.
//

import Foundation
import FirebaseAuth
import Combine
import FirebaseFirestore

class AuthService: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    private init() {
        self.userSession = Auth.auth().currentUser
        Task {
            try await UserService.shared.fetchCurrentUser()
        }
        print("Debug: User Session id is \(userSession?.uid ?? "nil")")
    }
    
    func login(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
        print("Debug: login user \(result.user)")
        try await UserService.shared.fetchCurrentUser()
        
    }
    
    func createUser (withEmail email: String, password: String,fullname: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        try await uploadUserData(email:email,fullname:fullname, id: result.user.uid)
        try await UserService.shared.fetchCurrentUser()
        
        print("Debug: create user \(result.user)")
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.currentUser = nil
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(fullName: fullname, email: email,profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
}
