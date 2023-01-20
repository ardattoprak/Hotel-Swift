//
//  Registration.swift
//  Hotel
//
//  Created by Arda Toprak on 20.01.2023.
//

import Foundation

struct Registration {
    
    // MARK: - Properties
    var firstname: String
    var lastname: String
    var emailAdress: String
    
    var chechInDate: Date
    var chechOutDate: Date
    
    var numberOfAdults: Int
    var numberOfAChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
    
}
