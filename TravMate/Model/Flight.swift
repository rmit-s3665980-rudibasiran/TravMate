//
//  Flight.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

struct Flight {
    
    var flightName = ["British Airways 101", "Qantas 202", "JetStar 303", "Virgin 404"]
    var flightDepart = ["15 May 2018 10:00", "14 Feb 2018 08:00", "4 Aug 2018 22:00" , "7 Oct 2018 14:00"]
    var flightArrival = ["15 May 2018 20:00", "14 Feb 2018 10:00", "4 Aug 2018 23:00" , "7 Oct 2018 17:00"]
    var flightCost = ["$2,000", "$300", "$400", "$600"]
    
    // static var sharedInstance = Flight()
    init() {
    }
    
    func getSizeofData() -> Int {
        return flightName.count
    }
    
}
