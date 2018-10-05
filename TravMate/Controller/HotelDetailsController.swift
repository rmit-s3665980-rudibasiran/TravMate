//
//  HotelDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class HotelDetailsController: UIViewController {
  
    
    @IBOutlet weak var hotelRating: HotelRatingController!
    
    @IBOutlet weak var hotelNotes: UITextView!
    
    @IBOutlet weak var roomType: UITextField!
    
    @IBOutlet weak var hotelName: UITextField!
    
    @IBOutlet weak var checkInDate: UITextField!
    
    @IBOutlet weak var checkOutDate: UITextField!
    
    @IBOutlet weak var hotelCost: UITextField!
    
    @IBOutlet weak var hotelAddress: UITextField!
    
    @IBAction func saveHotel(_ sender: Any) {
        
        let alert = UIAlertController(title: "HOTEL", message: "Save Data?", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            Trip.sharedInstance.hotel.hotelNotes[Trip.sharedInstance.myCurrentTrip] = self.hotelNotes.text!
            Trip.sharedInstance.hotel.roomType[Trip.sharedInstance.myCurrentTrip] = self.roomType.text!
            Trip.sharedInstance.hotel.hotelName[Trip.sharedInstance.myCurrentTrip] = self.hotelName.text!
            Trip.sharedInstance.hotel.hotelCheckIn[Trip.sharedInstance.myCurrentTrip] = self.checkInDate.text!
            Trip.sharedInstance.hotel.hotelCheckOut[Trip.sharedInstance.myCurrentTrip] = self.checkOutDate.text!
            Trip.sharedInstance.hotel.hotelAddress[Trip.sharedInstance.myCurrentTrip] = self.hotelAddress.text!
            Trip.sharedInstance.hotel.hotelCost[Trip.sharedInstance.myCurrentTrip] = self.hotelCost.text!
            Trip.sharedInstance.hotel.hotelRating[Trip.sharedInstance.myCurrentTrip] = self.hotelRating.starsRating
            
        })
        
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            self.do_load ()
            
        })
        
        alert.addAction(CancelAction)
        alert.addAction(OKAction)
        
        self.present(alert, animated: true, completion: nil)

        
    }
    
    @IBAction func hotelShare(_ sender: Any) {
        print("Share image")
        
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let activityViewController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true, completion: nil)
    }
    
    func do_load () {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.do_load()
        
        
    }
}
