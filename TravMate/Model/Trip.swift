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

    var locationName = ["LONDON, ENGLAND", "NEW YORK, USA", "PARIS, FRANCE", "MEBOURNE, AUSTRALIA"]
    var locationDays = ["10 days", "11 days", "14 days", "5 days"]
    var locationCost = ["$5,000" , "$7,000", "$8,000", "$500" ]
    
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
