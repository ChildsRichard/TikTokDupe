//
//  ImageUploadService.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/29/24.
//

import UIKit
import FirebaseStorage
import AVKit

struct ImageUploadService {
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "profile_images/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: failed to upload image with error: \(error)")
            return nil
        }
        
    }
    
    func uploadThumbnail(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "profile_thumbnail/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: failed to upload image with error: \(error)")
            return nil
        }
    }
    
    
}
