//
//  User.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/28/24.
//

import Foundation

struct TikTokUser: Identifiable, Codable {
    let id: String
    let userName: String
    let email: String
    let fullName: String
    var bio: String?
    var profileImage: String?
    var profileImageUrl: String?
}

extension TikTokUser: Hashable {
    
}
