//
//  TripDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class TripDetailsController: UIViewController {
   
    @IBAction func trachClick(_ sender: Any) {
        
        let alert = UIAlertController(title: "TRIP", message: "Delete Data?", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            Trip.sharedInstance.clearData()
            Trip.sharedInstance.clearDBofItem()
            self.navigationController?.popToRootViewController(animated: true)
      
        })
        
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (_)in
            
        })
        
        alert.addAction(CancelAction)
        alert.addAction(OKAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var tripName: UITextField!
    
    @IBOutlet weak var tripDays: UITextField!
    
    @IBOutlet weak var tripCost: UITextField!
    
    @IBAction func clickFlight(_ sender: Any) {
        Trip.sharedInstance.myCurrentTab = TripTabController.flight
        performSegue(withIdentifier: "GoToTabSegue", sender: self)
    }
    
    @IBAction func clickHotel(_ sender: Any) {
        Trip.sharedInstance.myCurrentTab = TripTabController.hotel
        performSegue(withIdentifier: "GoToTabSegue", sender: self)
    }
    
    @IBAction func clickRestaurant(_ sender: Any) {
        Trip.sharedInstance.myCurrentTab = TripTabController.restaurant
        performSegue(withIdentifier: "GoToTabSegue", sender: self)
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        if (self.tripName.text!) == "" {
            
            let alertCheck = UIAlertController(title: "TRIP", message: "Please enter trip name", preferredStyle: .alert)
            let OKActionCheck = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (_)in
                
            })
            
            alertCheck.addAction(OKActionCheck)
            self.present(alertCheck, animated: true, completion: nil)
            
        }
        else {
        
            let alert = UIAlertController(title: "TRIP", message: "Save Data?", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (_)in
            
                print ("Entering Save Trip Action")
                Trip.sharedInstance.saveTrip(tLocationName: self.tripName.text!, tLocationDay: self.tripDays.text!, tLocationCost: self.tripCost.text!)
            
                print ("Exiting Save Trip Action")
                self.performSegue(withIdentifier: "GoToTabSegue", sender: self)
            })
        
            let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
                (_)in
                self.performSegue(withIdentifier: "SegueBackToTrip", sender: self)
            })
        
            alert.addAction(CancelAction)
            alert.addAction(OKAction)
 
            self.present(alert, animated: true, completion: nil)
        }
 
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("myCurrentTrip = " +  String(Trip.sharedInstance.myCurrentTrip))
        if (Trip.sharedInstance.myCurrentTrip >= 0) {
            tripName.text = Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip]
            tripDays.text = Trip.sharedInstance.locationDays[Trip.sharedInstance.myCurrentTrip]
            tripCost.text = Trip.sharedInstance.locationCost[Trip.sharedInstance.myCurrentTrip]
        }
    }
}
