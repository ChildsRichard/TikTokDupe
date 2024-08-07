//
//  Post.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/24/24.
//

import Foundation

struct Post: Identifiable, Codable {
    var id: String
    var ownerUserId: String
    var videoUrl: String?
    var caption: String?
    var thumbnailUrl: String?
}

extension Post: Hashable{

}
