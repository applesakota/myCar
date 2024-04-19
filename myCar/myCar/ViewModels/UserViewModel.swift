//
//  UserViewModel.swift
//  myCar
//
//  Created by Petar Sakotic on 4/2/24.
//

import Foundation

// Test Class for Observing test User
class UserViewModel: ObservableObject {
    @Published var user: UserModel?
        
    /// Showing on Main
    @MainActor
    @discardableResult
    func fetchData() async -> UserModel {
        let model = await apiFetchData()
        self.user = model
        return model
    }
    
    private func apiFetchData() async -> UserModel {
        do {
            return try await loadUserFromJSON()
        } catch {
            return UserModel.userModelInstance
        }
    }
}
