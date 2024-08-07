//
//  UserProfileView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/28/24.
//

import SwiftUI

struct UserProfileView: View {
    let user: TikTokUser

    var body: some View {
        
//MARK: - This view can not be in a navigationStack. You can not go from one view that is embeded in a navigationStack to another
        
        ScrollView{
            VStack(spacing: 2){
                //profile header
                ProfileHeaderView(user: user)
                
                //post grid view
                PostGridView()
                
            }
            .padding(.top)
        }
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
