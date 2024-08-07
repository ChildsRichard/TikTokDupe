//
//  ContentView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    
    private var authService: AuthService
    private var userService: UserService
    private var postUploadService: VideoUploadService
    private var post: Post
    
    init(authService: AuthService, userService: UserService, postUploadService: VideoUploadService,post: Post){
        self.authService = authService
        self.userService = userService
        self.postUploadService = postUploadService
        self.post = post
        
        let vm = ContentViewModel(authService: authService,userService: userService)
        self._viewModel = StateObject(wrappedValue: vm)
        
    }
    
    var body: some View {
        
        Group{
            if viewModel.userSession != nil {
                if let user = viewModel.currentUser{
                    MainTabView(authService: authService,user: user,postUploadService: postUploadService,post: post)
                }
            } else {
                LogInView(authService: authService)
            }
        }
        
    }
}

#Preview {
    ContentView(authService: AuthService(),userService: UserService(), postUploadService: VideoUploadService(),post: DeveloperPreview.post)
}
