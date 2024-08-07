//
//  AvatarSize.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/29/24.
//

import Foundation

enum AvatarSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall : return 28
        case .xSmall : return 32
        case .small : return 40
        case .medium : return 48
        case .large : return 64
        case .xLarge : return 80
        
        }
    }
    
}
