//
//  ProfileView.swift
//  MessengerClone
//
//  Created by seemakus on 4/29/26.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject var profileVM = ProfileViewModel()
    let profileUser: User
    
    var body: some View {
            VStack {
                VStack(spacing: 15) {
                    PhotosPicker(selection: $profileVM.selectedItem){
                        if let profileImage = profileVM.profileImage {
                            profileImage
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                        } else {
                            AppImageView(
                                imageSource: .asset(profileUser.profileImageUrl ?? ""),
                                imageWidth : 60,
                                imageHeight: 60,
                                contentMode: .fill
                            ).clipShape(Circle())
                        }
                     
                    }
                            
                    Text(profileUser.fullName)
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


#Preview{
    ProfileView(profileUser: User.MOCK_User)
}
