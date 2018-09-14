//
//  Hotel.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

struct Hotel {
    
    var hotelName = ["Meridien", "IBIS", "Century", "Hays Aparment"]
    var hotelCheckIn = ["15 May 2018", "14 Feb 2018", "4 Aug 2018" , "7 Oct 2018"]
    var hotelCheckOut = ["25 May 2018", "21 Feb 2018", "8 Aug 2018" , "11 Oct 2018"]
    var hotelCost = [200, 90, 120, 150]
    
    static var sharedInstance = Hotel()
    
    init() {
    }
    
    func getSizeofData() -> Int {
        return hotelName.count
    }
    
}
