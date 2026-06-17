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
    @Published var fullname = ""
    
    
    
   
    
   @MainActor
    func registration() async {
            do {
                try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
            } catch {
                self.errorMessage = "failed creating the userName"
            }
        }
    
}
