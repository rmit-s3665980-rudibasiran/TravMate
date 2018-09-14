//
//  Trip.swift
//  TravMate
//
//  Created by Rudi Basiran on 13/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

struct Trip {
    
    var myCurrentTrip = 0;
    var locationName = ["LONDON, UK", "MELBOURNE, AU", "SYDNEY, AU", "PERTH, AU"]
    var locationDays = ["10 Days", "7 Days", "4 Days", "4 Days"]
    var locationImage = ["trip01", "trip02", "trip03", "trip04"]
    var locationCost = ["$3,000", "$1,000", "$400", "$700"]
    
    var flight:Flight = Flight ()
    var hotel:Hotel = Hotel()
    var restaurant:Restaurant = Restaurant ()
    
    static var sharedInstance = Trip()
    
    init() {
        myCurrentTrip = -1
    }
    
    func geFlight() -> Flight {
        return flight
    }
    
    func geHotel() -> Hotel {
        return hotel
    }
    
    func getRestaurant() -> Restaurant {
        return restaurant
    }
    
    func getSizeofData() -> Int {
        return locationName.count
    }
    
   

}
