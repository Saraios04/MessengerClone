//
//  ActiveUsersView.swift
//  MessengerClone
//
//  Created by seemakus on 4/17/26.
//

import SwiftUI

struct ActiveUsersView : View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body : some View {
        let avtarSize: CGFloat = horizontalSizeClass == .regular ? 56 : 40
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 20){
                ForEach(0...10, id: \.self) { _ in
                    VStack(spacing: 4){
                        ZStack(alignment: .bottomTrailing){
                            AppImageView(imageSource: .systemImage("person.circle.fill"), imageWidth : avtarSize, imageHeight: avtarSize, contentMode: .fit)
                            Circle()
                                .fill(Color.white)
                                .frame(width: avtarSize * 0.25,height: avtarSize * 0.25)
                            Circle()
                                .fill(Color.green)
                                .frame(width: avtarSize * 0.22,height: avtarSize * 0.22)
                        }
                        Text("Name")
                            .font(.footnote)
                    }
                }
            }.padding()
        }
    }
}
#Preview {
    ActiveUsersView()
}
