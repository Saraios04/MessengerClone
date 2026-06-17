//
//  User.swift
//  MessengerClone
//
//  Created by seemakus on 5/11/26.
//

import Foundation
import FirebaseFirestore

struct User: Codable,Hashable,Identifiable {
    
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    var profileImageUrl: String?
    var id : String {
        return uid ?? NSUUID().uuidString
    }
}

extension User {
    static let MOCK_User = User(fullName: "Sara", email: "Sara@gmail.com", profileImageUrl: "batman")
}
