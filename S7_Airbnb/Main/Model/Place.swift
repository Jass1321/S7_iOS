//
//  Place.swift
//  S7_Airbnb
//
//  Created by MAC06 on 25/11/21.
//

import Foundation

class Place: Codable {
    
    let id: String
    let name: String
    let address: String
    let rating: Float
    let userRatingsTotal: Int
    let photo: String
    
}
