//
//  ExploreView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/21/24.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel(userService: UserService())
    
    var body: some View {
        NavigationStack{
        ScrollView{
            VStack(spacing: 16){
                ForEach(viewModel.users){ user in
                    NavigationLink(value: user) {
                        UserCell(user: user)
                    }
                       
                }
              }
            }
        .navigationDestination(for: TikTokUser.self, destination: { user in
           UserProfileView(user: user)
        })
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.top)
        .padding(.horizontal)
        }
    }
}

#Preview {
    ExploreView()
}
