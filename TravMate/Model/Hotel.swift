//
//  Hotel.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

struct Hotel {
    
    var hotelName: [String] = []
    var hotelCheckIn: [String] = []
    var hotelCheckOut: [String] = []
    var roomType: [String] = []
    var hotelCost: [String] = []
    var hotelAddress: [String] = []
    var hotelNotes: [String] = []
    var hotelRating:[Int] = []
    
    init() {
    }
    
    func getSizeofData() -> Int {
        return hotelName.count
    }
    
}
