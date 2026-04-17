//
//  InboxView.swift
//  MessengerClone
//
//  Created by seemakus on 4/17/26.
//

import Foundation
import SwiftUI

struct InboxView : View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ZStack(alignment: .center){
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 26,height: 26)
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 10, weight : .bold))
                        
                    }
                }
                    ToolbarItem(placement: .navigationBarLeading){
                        HStack {
                            AppImageView(imageSource: .systemImage("person.circle.fill"), imageWidth : 20, imageHeight: 20, contentMode: .fit)
                            Text("Chats")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                        }
                    }
                }
            }
        }
    }
#Preview {
        InboxView()
}
