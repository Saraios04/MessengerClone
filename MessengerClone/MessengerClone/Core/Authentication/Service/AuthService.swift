//
//  AuthService.swift
//  MessengerClone
//
//  Created by seemakus on 6/14/26.
//

import Foundation
import FirebaseAuth
import Combine

class AuthService: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    private init() {
        self.userSession = Auth.auth().currentUser
        print("Debug: User Session id is \(userSession?.uid ?? "nil")")
    }
    
    func login(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
        print("Debug: login user \(result.user)")
    }
    
    func createUser (withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        print("Debug: create user \(result.user)")
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        self.userSession = nil
    }
}
