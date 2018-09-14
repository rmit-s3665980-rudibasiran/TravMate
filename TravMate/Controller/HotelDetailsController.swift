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
    
    @IBOutlet weak var hotelName: UITextField!
    
    @IBOutlet weak var checkInDate: UITextField!
    
    @IBOutlet weak var checkOutDate: UITextField!
    
    @IBOutlet weak var hotelCost: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hotelData = Trip.sharedInstance.geHotel()
        let i = Trip.sharedInstance.myCurrentTrip
        
        hotelName.text = hotelData.hotelName[i]
        checkInDate.text = hotelData.hotelCheckIn[i]
        checkOutDate.text = hotelData.hotelCheckOut[i]
        hotelCost.text = hotelData.hotelCost[i]
    }
}
