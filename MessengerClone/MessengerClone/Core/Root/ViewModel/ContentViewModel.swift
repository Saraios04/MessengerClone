//
//  ContentViewModel.swift
//  MessengerClone
//
//  Created by seemakus on 6/14/26.
//

import Foundation
import FirebaseAuth
import Observation
import Combine

@Observable
class ContentViewModel{
    
    var userSession: FirebaseAuth.User?
   
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setUpSubscribers()
    }
    
   
    private func setUpSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] session  in
            self?.userSession = session
            
        }.store(in: &cancellables)
    }
     
}
