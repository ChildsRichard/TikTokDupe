//
//  ExploreViewModel.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/28/24.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    
    @Published var users = [TikTokUser]()
    private var userService: UserService
    
    init(userService: UserService){
        self.userService = userService
        Task { await fetchUsers() }
    }
    
    func fetchUsers() async {
        do {
            self.users = try await userService.fetchUsers()
        } catch {
            print("DEBUG: Failed to fetch users with error: \(error)")
        }
    }
}
