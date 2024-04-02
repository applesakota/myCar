//
//  SuperchargerModel.swift
//  myCar
//
//  Created by Petar Sakotic on 4/2/24.
//

import Foundation


struct SuperchargerModel: Identifiable, Equatable, Hashable {
    
    //MARK: - Identifiable
    
    var id: String = UUID().uuidString
    
    //MARK: - Globals
    
    let name: String
    let availability: String
    let distance: Double
    
    //MARK: - Equatable
    
    static func == (lhs: SuperchargerModel, rhs: SuperchargerModel) -> Bool {
        lhs.id == rhs.id
    }
    
    //MARK: - Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
    
    
