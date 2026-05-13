//
//  User.swift
//  MessengerClone
//
//  Created by seemakus on 5/11/26.
//

import Foundation
struct User: Codable,Hashable {
    let fullName: String
    let email: String
    var profileImageUrl: String?
}

extension User {
    static let MOCK_User = User(fullName: "Sara", email: "Sara@gmail.com", profileImageUrl: "batman")
}
