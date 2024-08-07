//
//  ProfileHeaderView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/22/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfile = false
    let user: TikTokUser
    
    var body: some View {
        VStack(spacing: 16){
            VStack(spacing: 8){
              
                AvatarView(user: user,size: .large)
                
                Text("@\(user.userName)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
                
                HStack(spacing: 18){
                    
                    UserStatView(value: 263, title: "Following")
                    UserStatView(value: 897, title: "Followers")
                    UserStatView(value: 918, title: "Likes")
                    
                         
                }
            
            
                Button{
                    showEditProfile.toggle()
                } label: {
                    Text("Edit Profile")
                        .foregroundStyle(.black)
                        .frame(width: 300, height: 30)
                        .foregroundStyle(Color(.systemGray5))
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                    Divider()
              }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.user)
}


