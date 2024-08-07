//
//  UserCell.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/21/24.
//

import SwiftUI

struct UserCell: View {
    let user: TikTokUser
    
    var body: some View {
        HStack(spacing: 12){
            
            AvatarView(user: user,size: .medium)
                .frame(width: 48, height: 48)
                
            
            VStack(alignment: .leading){
                Text(user.userName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(user.fullName)
                    .font(.footnote)
                
            }
            Spacer()
        }
    }
}

#Preview {
    UserCell(user: DeveloperPreview.user)
}
