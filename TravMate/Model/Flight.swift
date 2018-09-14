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
    var flightGo = ["15 May 2018 10:00", "14 Feb 2018 08:00", "4 Aug 2018 22:00" , "7 Oct 2018 14:00"]
    var flightReturn = ["25 May 2018 10:00", "21 Feb 2018 08:00", "8 Aug 2018 22:00" , "11 Oct 2018 14:00"]
    var flightCost = [2000, 300, 400, 600]
    
    static var sharedInstance = Flight()
    init() {
    }
    
    func getSizeofData() -> Int {
        return flightName.count
    }
    
}
