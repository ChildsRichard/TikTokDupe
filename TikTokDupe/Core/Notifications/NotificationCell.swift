//
//  NotificationCell.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/21/24.
//

import SwiftUI

struct NotificationCell: View {
   
    
    var body: some View {
        
        HStack{
//            AvatarView(user: user)
//                .frame(width: 48, height: 48)
//            
            VStack(alignment: .leading){
                Text("Antonio.brown")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                HStack{
                    Text("liked one of your post")
                        .font(.footnote)
                    
                    Text("3d")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
