//
//  RoomType.swift
//  Hotel
//
//  Created by Arda Toprak on 20.01.2023.
//

import Foundation

struct RoomType: Equatable {
    
    // MARK: - Properties
    var id: Int
    var name: String
    var shortName: String
    var price: Int //bununda modelini oluşturabiliriz istersek.
    
    // MARK: - Functions
    static func == (lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
}
    
