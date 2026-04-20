//
//  InboxRowView.swift
//  MessengerClone
//
//  Created by seemakus on 4/20/26.
//

import SwiftUI
struct InboxRowView: View {
    var body : some View {
        HStack(spacing: 12) {
            AppImageView(imageSource: .systemImage("person.circle.fill"), imageWidth: 50, imageHeight: 50)
    
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Heath Ledger")
                            .font(.headline)
                        Text("Ya Ya")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        
                    }
                    Spacer()
                    Text("Yesterday")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                }
         }
        }
  }
}


#Preview {
    InboxRowView()
}
