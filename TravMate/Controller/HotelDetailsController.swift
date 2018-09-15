//
//  HotelDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class HotelDetailsController: UIViewController {
  
    
    @IBOutlet weak var hotelNotes: UITextView!
    
    @IBOutlet weak var roomType: UITextField!
    
    @IBOutlet weak var hotelName: UITextField!
    
    @IBOutlet weak var checkInDate: UITextField!
    
    @IBOutlet weak var checkOutDate: UITextField!
    
    @IBOutlet weak var hotelCost: UITextField!
    
    @IBOutlet weak var hotelAddress: UITextField!
    
    @IBAction func saveHotel(_ sender: Any) {
        
        Trip.sharedInstance.hotel.hotelNotes[Trip.sharedInstance.myCurrentTrip] = hotelNotes.text!
        Trip.sharedInstance.hotel.roomType[Trip.sharedInstance.myCurrentTrip] = roomType.text!
        Trip.sharedInstance.hotel.hotelName[Trip.sharedInstance.myCurrentTrip] = hotelName.text!
        Trip.sharedInstance.hotel.hotelCheckIn[Trip.sharedInstance.myCurrentTrip] = checkInDate.text!
        Trip.sharedInstance.hotel.hotelCheckOut[Trip.sharedInstance.myCurrentTrip] = checkOutDate.text!
        Trip.sharedInstance.hotel.hotelAddress[Trip.sharedInstance.myCurrentTrip] = hotelAddress.text!
        Trip.sharedInstance.hotel.hotelCost[Trip.sharedInstance.myCurrentTrip] = hotelCost.text!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hotelData = Trip.sharedInstance.geHotel()
        let i = Trip.sharedInstance.myCurrentTrip
        
        if (Trip.sharedInstance.myCurrentTrip >= 0) {
            hotelName.text = hotelData.hotelName[i]
            checkInDate.text = hotelData.hotelCheckIn[i]
            checkOutDate.text = hotelData.hotelCheckOut[i]
            hotelCost.text = hotelData.hotelCost[i]
            hotelAddress.text = hotelData.hotelAddress[i]
            roomType.text = hotelData.roomType[i]
            hotelNotes.text = hotelData.hotelNotes[i]
            
        }
        
    }
}
