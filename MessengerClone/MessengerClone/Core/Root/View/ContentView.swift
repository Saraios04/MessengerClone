//
//  ContentView.swift
//  MessengerClone
//
//  Created by seemakus on 6/14/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var contentVM = ContentViewModel()
    
    var body: some View {
        Group{
            if contentVM.userSession != nil {
                InboxView()
            } else {
                LoginView()
            }
        }
    }
}
