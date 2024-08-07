//
//  EditProfileManager.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/29/24.
//

import UIKit
import FirebaseAuth


class EditProfileManager: ObservableObject {
    private let imageUploadService: ImageUploadService
    
    init(imageUploadService: ImageUploadService) {
        self.imageUploadService = imageUploadService
    }
    
    func uploadProfileImage(_ uiImage: UIImage) async  {
        do {
            let profileImageUrl = try await ImageUploadService().uploadImage(image: uiImage)
            try await updateUserProfileImage(profileImageUrl)
        } catch {
            print("DEBUG: Handle image upload error ..")
            
        }
    }
    
    private func updateUserProfileImage(_ imageUrl: String?) async throws {
        guard let imageUrl else {return}
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        try await FireStoreConstants.UserCollections.document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
    }
    
}
