//
//  Movie.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/30/24.
//

import AVKit
import PhotosUI
import SwiftUI

struct Movie: Transferable {
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation {
        
        FileRepresentation.init(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { received in
            let copy = URL.documentsDirectory.appending(path: "movie.mp4")
            
            if FileManager.default.fileExists(atPath: copy.path()) {
                try FileManager.default.removeItem(at: copy)
            }
            
            try FileManager.default.copyItem(at: received.file, to: copy)
            
            return Movie(url: copy)
        }

    }
}
