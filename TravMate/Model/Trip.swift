//
//  Trip.swift
//  TravMate
//
//  Created by Rudi Basiran on 13/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

struct Trip {
    
    var myCurrentTrip = 0
    var myCurrentTab = TripTabController.flight

    var locationName = ["LONDON, ENGLAND", "NEW YORK, USA", "PARIS, FRANCE", "MEBOURNE, AUSTRALIA"]
    var locationDays = ["10 Days", "11 Days", "14 Days", "5 Days"]
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
    
    func clearEmptyData() {
        var i = -1
        for string in Trip.sharedInstance.locationName {
            i = i + 1
            if (string == "") {
                deleteArray(i)
            }
        }
    }
    
    func deleteArray (_ i:Int) {
        // remove empty data
        Trip.sharedInstance.locationName.remove(at: i)
        Trip.sharedInstance.locationDays.remove(at: i)
        Trip.sharedInstance.locationCost.remove(at: i)
        
        Trip.sharedInstance.flight.flightDepartNo.remove(at: i)
        Trip.sharedInstance.flight.flightReturnNo.remove(at: i)
        Trip.sharedInstance.flight.flightPortFrom.remove(at: i)
        Trip.sharedInstance.flight.flightPortTo.remove(at: i)
        Trip.sharedInstance.flight.flightDepartDate.remove(at: i)
        Trip.sharedInstance.flight.flightDepartTime.remove(at: i)
        Trip.sharedInstance.flight.flightReturnDate.remove(at: i)
        Trip.sharedInstance.flight.flightReturnTime.remove(at: i)
        Trip.sharedInstance.flight.flightCost.remove(at: i)
        Trip.sharedInstance.flight.flightType.remove(at: i)
        Trip.sharedInstance.flight.flightDuration.remove(at: i)
        
        Trip.sharedInstance.hotel.hotelName.remove(at: i)
        Trip.sharedInstance.hotel.hotelCheckIn.remove(at: i)
        Trip.sharedInstance.hotel.hotelCheckOut.remove(at: i)
        Trip.sharedInstance.hotel.hotelCost.remove(at: i)
        Trip.sharedInstance.hotel.hotelAddress.remove(at: i)
        Trip.sharedInstance.hotel.roomType.remove(at: i)
        Trip.sharedInstance.hotel.hotelNotes.remove(at: i)
        Trip.sharedInstance.hotel.hotelRating.remove(at: i)
        
        Trip.sharedInstance.restaurant.cafeName.remove(at: i)
        Trip.sharedInstance.restaurant.cafeAddress.remove(at: i)
        Trip.sharedInstance.restaurant.cafeType.remove(at: i)
        Trip.sharedInstance.restaurant.cafeCost.remove(at: i)
        Trip.sharedInstance.restaurant.cafePax.remove(at: i)
        Trip.sharedInstance.restaurant.cafeNotes.remove(at: i)
        Trip.sharedInstance.restaurant.foodItem1.remove(at: i)
        Trip.sharedInstance.restaurant.foodItem2.remove(at: i)
        Trip.sharedInstance.restaurant.foodItem3.remove(at: i)
        Trip.sharedInstance.restaurant.foodItemSmiley1.remove(at: i)
        Trip.sharedInstance.restaurant.foodItemSmiley2.remove(at: i)
        Trip.sharedInstance.restaurant.foodItemSmiley3.remove(at: i)
        Trip.sharedInstance.restaurant.cafeRating.remove(at: i)
    }

}
