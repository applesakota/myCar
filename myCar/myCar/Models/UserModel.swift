//
//  User.swift
//  myCar
//
//  Created by Petar Sakotic on 4/2/24.
//

import Foundation


struct UserModel: Identifiable, Equatable, Hashable {

    //MARK: - Identifiable
    
    var id: String = UUID().uuidString
    
    //MARK: - Globals
    
    let name: String
    let car: String
    let carBattery: Int
    let voltage: Int
    let batteryLength: Int
    let fastCharger: Int
    let supercharges: [SuperchargerModel]
    
    //MARK: - Equatable
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        lhs.id == rhs.id
    }
    
    //MARK: - Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - Test Data
    
    static let userModelInstance = UserModel(
        name: "Billy",
        car: "Tesla Model X",
        carBattery: 50,
        voltage: 240,
        batteryLength: 540,
        fastCharger: 20,
        supercharges: [
            SuperchargerModel(name: "Ranchview Dr. Richardson", availability: "4 / 10", distance: 1.2),
            SuperchargerModel(name: "Thorniridge Cir. Shiloh",  availability: "5 / 10", distance: 2.6),
            SuperchargerModel(name: "Elgin St.Celina",          availability: "8 / 10", distance: 4.3),
            SuperchargerModel(name: "Westheier Rd. Santa Ana",  availability: "3 / 10", distance: 5.4),
            SuperchargerModel(name: "Strada General",           availability: "4 / 10", distance: 1.2),
            SuperchargerModel(name: "Strada Deltei",            availability: "4 / 10", distance: 1.2),
            SuperchargerModel(name: "Ranchview Dr. Richardson", availability: "4 / 10", distance: 1.2)
        ]
    )
        
}
