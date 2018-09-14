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
    var locationName = ["London", "Melbourne", "Sydney", "Perth"]
    var locationDesc = ["London is in England, the United Kingdom",
                        "Melbourne is the capital and most populous city of the Australian state of Victoria, and the second-most populous city in Australia and Oceania",
                        "Sydney is the state capital of New South Wales and the most populous city in Australia and Oceania.",
                        "Perth is the capital and largest city of the Australian state of Western Australia"]
    var locationImage = ["london", "melbourne", "sydney", "perth"]
    
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
