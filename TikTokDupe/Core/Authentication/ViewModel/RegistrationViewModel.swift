//
//  RegistrationViewModel.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/24/24.
//

import Foundation

class RegistrationViewModel: ObservableObject{
    
    private let authService: AuthService
    
    init(authService: AuthService){
        self.authService = authService
    }
    
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async {
        do {
            try await authService.createUser(withEmail: email, password: password, fullName: fullName, userName: userName)
        } catch {
            print("DEBUG: Did fail to register with error \(error.localizedDescription)")
        }
        
        
    }
}
