//
//  EditProfileOptions.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/29/24.
//

import Foundation

enum EditProfileOptions:  Hashable  {
    case name
    case userName
    case bio
    
    var title: String {
        switch self {
        case .name:
            return "Name"
        case .userName:
            return "User Name"
        case .bio:
            return "Bio"
        }
    }
    
    
    
}
