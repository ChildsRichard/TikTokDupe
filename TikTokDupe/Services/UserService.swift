//
//  UserService.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/28/24.
//


import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

// MARK: - protocol can be used with MockUserService to testing

//protocol UserServiceProtocol {
//    func fetchUsers() async throws -> [User]
//}

struct UserService {
    
    func fetchCurrentUser() async throws -> TikTokUser? {
        guard let currentUid = Auth.auth().currentUser?.uid else {return nil}
        let currentUser = try await FireStoreConstants.UserCollections.document(currentUid).getDocument(as: TikTokUser.self)
        print("DEBUG: current user is \(currentUser)")
        return currentUser
    }
    
    func uploadUserData(_ user: TikTokUser) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await FireStoreConstants.UserCollections.document(user.id).setData(userData)
        } catch {
            throw error
        }
    }
    
    func fetchUsers() async throws -> [TikTokUser] {
        do{
            let querySnapshot = try await FireStoreConstants.UserCollections.getDocuments()
            var users: [TikTokUser] = []
            for document in querySnapshot.documents {
                if let user = try? document.data(as: TikTokUser.self) {
                    users.append(user)
                }
            }
            return users
            
        } catch {
            print("Error getting documents: \(error)")
            throw error
        }
    }
    
    
//    struct MockUserService: UserServiceProtocol {
//        func fetchUsers() async throws -> [User] {
//            return DeveloperPreview.users
//        }
//    }
    
}
