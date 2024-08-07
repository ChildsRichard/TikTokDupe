//
//  AuthService.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/22/24.
//

import Firebase
import FirebaseAuth

@MainActor
class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    func updateUserSession(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do { let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Log in with email \(email)")
        } catch {
            print("DEBUG: Could not sign in user with error \(error.localizedDescription)")
            throw error
        }
        
        
        
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    fullName: String,
                    userName: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, id: result.user.uid, fullName: fullName, userName: userName)
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
            throw error
        }
        
        
        print("DEBUG: Sign Up with user info \(email), \(password), \(fullName), \(userName) ")
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            self.userSession = nil
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    private func uploadUserData(withEmail email: String,
                                id: String,
                                fullName: String,
                                userName: String) async throws {
        let user = TikTokUser(id: id, userName: userName, email: email, fullName: fullName)
        try await UserService().uploadUserData(user)
    }
    
    
}
