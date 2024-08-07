//
//  Firestore+Constants.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/28/24.
//

import FirebaseFirestore

struct FireStoreConstants{
    static let Root = Firestore.firestore()
    
    static let UserCollections = Root.collection("users")
    
    static let PostsCollections = Root.collection("posts")
}
