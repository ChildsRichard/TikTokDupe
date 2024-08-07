//
//  ContentViewModel.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/28/24.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: TikTokUser?
    
    private var authService: AuthService
    private var userService: UserService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService, userService: UserService){
        self.authService = authService
        self.userService = userService
        
        authService.updateUserSession()
        setupSubscribers()
    }
    
    
    private func setupSubscribers() {
        authService.$userSession.sink { [weak self] user in
            self?.userSession = user
            self?.fetchCurrentUser()
        }.store(in: &cancellables)
    }
    
    func fetchCurrentUser() {
        guard userSession != nil else { return }
        Task{ self.currentUser = try await userService.fetchCurrentUser()}
    }
}
