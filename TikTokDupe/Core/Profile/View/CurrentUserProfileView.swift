//
//  CurrentUserProfileView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/21/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let authService: AuthService
    let user: TikTokUser
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 2){
                    //profile header
                    ProfileHeaderView(user: user)
                    
                    //post grid view
                    PostGridView()
                    
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        authService.signOut()
                        print("DEBUG: Signed out")
                    }, label: {
                        Text("Sign Out")
                    })
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        
            
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService(), user: DeveloperPreview.user)
}
