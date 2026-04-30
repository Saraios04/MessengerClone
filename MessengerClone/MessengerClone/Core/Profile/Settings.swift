//
//  Settings.swift
//  MessengerClone
//
//  Created by seemakus on 4/29/26.
//

import SwiftUI

enum Settings: CaseIterable{
    case mode
    case status
    case accessibility
    case privacyAndSecurity
    case notifications
   
    
    var title: String {
        switch self {
            case .mode:
                return "Dark mode"
            case .status:
                return "Active status"
            case .accessibility:
                return "Accessibility"
            case .privacyAndSecurity:
                return "Privacy and Safety"
            case .notifications:
                return "Notifications"
        }
    }
    
    var image: String{
        switch self {
            case .mode:
                return "moon.circle.fill"
            case .status:
                return "message.badge.circle.fill"
            case .accessibility:
                return "person.circle.fill"
            case .privacyAndSecurity:
                return "lock.circle.fill"
            case .notifications:
                return "bell.circle.fill"
                
        }
    }
        var foregroundColor: Color {
            switch self {
                case .mode:
                    return Color.black
                case .status:
                    return Color.green
                case .accessibility:
                    return Color.black
                case .privacyAndSecurity:
                    return Color.blue
                case .notifications:
                    return Color.purple
                    
            }
    }
}

