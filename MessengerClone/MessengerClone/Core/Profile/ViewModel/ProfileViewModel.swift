//
//  ProfileViewModel.swift
//  MessengerClone
//
//  Created by seemakus on 5/6/26.
//

import SwiftUI
import PhotosUI

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet{
            Task{
                try await loadImage()
            }
        }
    }
    @Published var profileImage: Image?
    
    func loadImage() async throws {
        guard let selectedImage = selectedItem else {
            return
        }
        guard let profileImage = try await selectedImage.loadTransferable(type: Data.self) else {
            return
        }
        guard let uiImage = UIImage(data: profileImage) else { return }
        self.profileImage = Image(uiImage: uiImage)
        
    }
    func logOut()  {
        do {
            try AuthService.shared.signOut()
        } catch {
            print("Debug: Failed to logout the user with error \(error.localizedDescription)")
        }
    }
}
#Preview {
    ProfileView(profileUser: User.MOCK_User)
}
