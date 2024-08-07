//
//  PostUploadService.swift
//  TikTokDupe
//
//  Created by Richard Childs on 5/1/24.
//

import UIKit
import AVKit
import FirebaseStorage

struct VideoUploadService {

      func uploadVideo(movieurl: URL?) async throws -> String? {
          
          guard let movieUrl = movieurl else { return nil }
          let fileName = NSUUID().uuidString
          let ref = Storage.storage().reference(withPath: "post_videos/\(fileName).mov")
          
          do {
              let _ = try await ref.putFileAsync(from: movieUrl)
              let url = try await ref.downloadURL()
              return url.absoluteString
          } catch {
              print("DEBUG: failed to upload video with error: \(error)")
              return nil
          }
      }
    
  
    
    
}
