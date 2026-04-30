//
//  ProfileView.swift
//  MessengerClone
//
//  Created by seemakus on 4/29/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 15) {
                   
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        
                        .clipShape(Circle())
                        .overlay(alignment: .bottomTrailing) {
                            Circle()
                                .frame(width: 30,height:10)
                                .foregroundColor(Color.green)
                                .overlay{
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                }
                        }
                            
                    Text("Username")
                        .fontWeight(.bold)
                        .font(.subheadline)
                    
                    List {
                        Section{
                            ForEach(Settings.allCases, id: \.self){ setting  in
                                HStack(spacing: 25){
                                    Image(systemName: setting.image)
                                        .foregroundColor(setting.foregroundColor)
                                   
                                    Text(setting.title)
                                   
                                }
                            }
                        }
                        
                        Section {
                            VStack(alignment: .leading) {
                                Text("Log Out")
                                Divider()
                                Text("Delete Account")
                            }.font(.callout)
                                .foregroundColor(.red)
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview{
    ProfileView()
}
