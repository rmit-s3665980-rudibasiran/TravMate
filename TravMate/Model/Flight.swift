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
    
    var flightDepartNo:[String] = []
    var flightReturnNo:[String] = []
    var flightPortFrom:[String] = []
    var flightPortTo:[String] = []
    var flightDepartDate:[String] = []
    var flightDepartTime:[String] = []
    var flightReturnDate:[String] = []
    var flightReturnTime:[String] = []
    var flightCost:[String] = []
    var flightType:[String] = []
    var flightDuration:[String] = []
    
    // static var sharedInstance = Flight()
    init() {
    }
    
    func getSizeofData() -> Int {
        return flightDepartNo.count
    }
    
}
