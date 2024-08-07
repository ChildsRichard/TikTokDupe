//
//  FeedViewModel.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/24/24.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    let videoUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
        ]
    
    init() {
        fetchPosts()
    }
    
    
    func fetchPosts(){
        self.posts = [
            .init(id: NSUUID().uuidString, ownerUserId: videoUrls[0], videoUrl: "0"),
            .init(id: NSUUID().uuidString, ownerUserId: videoUrls[1], videoUrl: "1"),
            .init(id: NSUUID().uuidString, ownerUserId: videoUrls[2], videoUrl: "2"),
            .init(id: NSUUID().uuidString, ownerUserId: videoUrls[3], videoUrl: "3"),
        ]
    }
    
}
