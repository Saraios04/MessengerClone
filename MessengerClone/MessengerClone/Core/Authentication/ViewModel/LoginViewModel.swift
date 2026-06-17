//
//  LoginViewModel.swift
//  MessengerClone
//
//  Created by seemakus on 6/14/26.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var errorMessage: String = ""
    @Published var email  = ""
    @Published var password = ""
    
    
    
    @MainActor
    func login() async {
            do {
                print("Email: [\(email)]")
                try await AuthService.shared.login(withEmail: email, password: password)
                
            } catch {
                print("Error:", error)

                if let error = error as NSError? {
                    print("Code:", error.code)
                    print("Domain:", error.domain)
                    print("UserInfo:", error.userInfo)
                }
                print("Debug: Failed to login user with error: \(error.localizedDescription)")
                self.errorMessage = "Login failed"
            }
        }
   
}
