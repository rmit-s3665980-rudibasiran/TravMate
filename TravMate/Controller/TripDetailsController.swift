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
            Trip.sharedInstance.clearEmptyData()
            // Trip.sharedInstance.clearDBofItem()
            Trip.sharedInstance.deleteDataFromDB("DBTrip")
            Trip.sharedInstance.deleteDataFromDB("DBFlight")
            Trip.sharedInstance.deleteDataFromDB("DBHotel")
            Trip.sharedInstance.deleteDataFromDB("DBCafe")
            Trip.sharedInstance.populateDBfromArray()
            
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
        
        if ((self.tripName.text! == "") || (self.tripDays.text! == "") || (self.tripCost.text! == "") ) {
            
            let alertCheck = UIAlertController(title: "TRIP", message: "Please enter trip name, duration and costs", preferredStyle: .alert)
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
                
                Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip] = self.tripName.text!
                Trip.sharedInstance.locationDays[Trip.sharedInstance.myCurrentTrip] = self.tripDays.text!
                Trip.sharedInstance.locationCost[Trip.sharedInstance.myCurrentTrip] = self.tripCost.text!
                
                Trip.sharedInstance.deleteDataFromDB("DBTrip")
                Trip.sharedInstance.deleteDataFromDB("DBFlight")
                Trip.sharedInstance.deleteDataFromDB("DBHotel")
                Trip.sharedInstance.deleteDataFromDB("DBCafe")
                Trip.sharedInstance.populateDBfromArray()
                Trip.sharedInstance.myCurrentTab = TripTabController.flight
                
                print ("Exiting Save Trip Action")
                
                // self.performSegue(withIdentifier: "GoToTabSegue", sender: self)
                
                self.navigationController?.popToRootViewController(animated: true)
                
            })
        
            let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
                (_)in
                // self.performSegue(withIdentifier: "SegueBackToTrip", sender: self)
                self.navigationController?.popToRootViewController(animated: true)
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
