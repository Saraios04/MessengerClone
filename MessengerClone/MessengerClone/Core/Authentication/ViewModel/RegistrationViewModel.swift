//
//  RegistrationViewModel.swift
//  MessengerClone
//
//  Created by seemakus on 6/14/26.
//

import Foundation

class RegistrationViewModel: ObservableObject {
   
    @Published var errorMessage: String = ""
    @Published var email  = ""
    @Published var password = ""
    
    
   
    
   @MainActor
    func registration() async {
            do {
                try await AuthService.shared.createUser(withEmail: email, password: password)
            } catch {
                self.errorMessage = "failed creating the userName"
            }
        }
    
}
