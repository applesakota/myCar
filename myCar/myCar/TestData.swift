//
//  TestData.swift
//  myCar
//
//  Created by Petar Sakotic on 4/4/24.
//

import Foundation

func loadUserFromJSON() async throws -> UserModel {
    do {
        let jsonUrl = Bundle.main.url(forResource: "user", withExtension: "json")!
        let data = try Data(contentsOf: jsonUrl)
        let user = try JSONDecoder().decode(UserModel.self, from: data)
        return user
    } catch {
        print("Error creating user")
    }
    return UserModel.userModelInstance
}
