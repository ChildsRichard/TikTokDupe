//
//  TikTokDupeApp.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/20/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TikTokDupeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let authService = AuthService()
    private let userService = UserService()
    private let postUploadService = VideoUploadService()
    private let post = Post(id: "", ownerUserId: "", videoUrl: "", caption: "")
    
    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService,userService: userService,postUploadService: postUploadService,post: post)
        }
    }
}
