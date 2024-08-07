//
//  AvatarView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/29/24.
//

import SwiftUI
import Kingfisher

struct AvatarView: View {
    let user: TikTokUser?
    let size: AvatarSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    VStack {
        AvatarView(user: DeveloperPreview.user,size: .xxSmall)
        AvatarView(user: DeveloperPreview.user,size: .xSmall)
        AvatarView(user: DeveloperPreview.user,size: .medium)
        AvatarView(user: DeveloperPreview.user,size: .large)
        AvatarView(user: DeveloperPreview.user,size: .xLarge)
    }
}
