//
//  PreviewProvider.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/28/24.
//

import Foundation
import PhotosUI
import SwiftUI

//MARK: -  Used to distribute mock data for testing. Avoids stressing the API

struct DeveloperPreview {
    
    static var user = TikTokUser(id: NSUUID().uuidString,
                           userName: "AmericanNightmare",
                           email: "cody@gmail.com",
                           fullName: "Cody Rhodes"
    )
    
    static var users: [TikTokUser] = [
        .init(id: NSUUID().uuidString, userName: "AmericanNightmare", email: "cody@gmail.com", fullName: "Cody Rhodes"),
        .init(id: NSUUID().uuidString, userName: "MainEventJeyUso", email: "Jey@gmail.com", fullName: "Jey Uso"),
        .init(id: NSUUID().uuidString, userName: "StillNoYeet", email: "Jimmy@gmail.com", fullName: "Jimmy Uso"),
        .init(id: NSUUID().uuidString, userName: "AlwaysOnTop", email: "rhea@gmail.com", fullName: "Rhea Ripley"),
        .init(id: NSUUID().uuidString, userName: "MrLatinoHeat", email: "dom@gmail.com", fullName: "Dominik Mysterio")
    ]
    
    static var post = Post(id: NSUUID().uuidString, ownerUserId: NSUUID().uuidString, videoUrl: "https://firebasestorage.googleapis.com/v0/b/tiktokclone-5a433.appspot.com/o/post_videos%2F209CB10F-68BA-49B1-A6AD-D484D4501D34.mov?alt=media&token=a139844a-c957-411e-8919-12f7a223e6e3", caption: "TEST CAPTION")
    
    static var thumbnail = UIImage(named: "photo.artframe.circle.fill")
    
}
