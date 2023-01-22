//
//  Registration.swift
//  Hotel
//
//  Created by Arda Toprak on 20.01.2023.
//

import Foundation

struct Registration {
    
    // MARK: - Properties
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    
    var numberOfAdults: Int
    var numberOfAChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
    
    // MARK: - Functions
    func fullName() -> String {
        return firstName + " " + lastName
    }
    }
