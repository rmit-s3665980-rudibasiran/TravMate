//
//  Flight.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

struct Flight {
    
    var flightDepartNo = ["BA 101", "PANAM 202", "AIR FRANCE 303", "VIRGIN 404"]
    var flightReturnNo = ["BA 102", "PANAM 203", "AIR FRANCE 304", "VIRGIN 405"]
    var flightPortFrom = ["MEL", "MEL", "MEL" , "SYD"]
    var flightPortTo = ["LDN", "NYC", "PAR" , "MEL"]
    var flightDepartDate = ["15 May 2018", "14 Feb 2018", "4 Aug 2018" , "7 Oct 2018"]
    var flightDepartTime = ["10:00" , "12:00", "06:00", "12:00"]
    var flightReturnDate = ["25 May 2018", "24 Feb 2018", "18 Aug 2018" , "12 Oct 2018"]
    var flightReturnTime = ["21:00" , "13:00", "05:00", "19:00"]
    var flightCost = ["$3,000", "$5,000", "$6,000", "$300"]
    
    // static var sharedInstance = Flight()
    init() {
    }
    
    func getSizeofData() -> Int {
        return flightDepartNo.count
    }
    
}
