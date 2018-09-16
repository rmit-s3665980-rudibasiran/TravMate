//
//  Hotel.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

struct Hotel {
    
    var hotelName = ["Le Méridien", "IBIS NYC", "Crown Hotels", "Hays Apartment"]
    var hotelCheckIn = ["15 May 2018", "14 Feb 2018", "4 Aug 2018" , "7 Oct 2018"]
    var hotelCheckOut = ["25 May 2018", "21 Feb 2018", "8 Aug 2018" , "11 Oct 2018"]
    var roomType = ["Deluxe" , "Single", "Triple" , "Suite"]
    var hotelCost = ["$200", "$90", "$120", "$150"]
    var hotelAddress = ["1 Cambridge Street", "2 Times Square", "3 Camp Street", "4 Hay Street"]
    var hotelNotes = ["Stay at our chic Le Méridien made for the creative and inspired",
                      "Welcome to IBIS NYC!" ,
                      "Crown Hotels - a class of its own" ,
                      "Hays Apartment - Right at the doorstep of ..."]
    var hotelRating = [1,2,3,4]
    
    // static var sharedInstance = Hotel()
    
    init() {
    }
    
    func getSizeofData() -> Int {
        return hotelName.count
    }
    
}
