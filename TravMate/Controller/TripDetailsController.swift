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
        
        let alert = UIAlertController(title: "DELETE", message: "Deletion of trip only available by Subscription", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            
        })
   
        alert.addAction(OKAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var tripName: UITextField!
    
    @IBOutlet weak var tripDays: UITextField!
    
    @IBOutlet weak var tripCost: UITextField!
    
    @IBAction func clickFlight(_ sender: Any) {
        performSegue(withIdentifier: "GoToTabSegue", sender: self)
    }
    
    @IBAction func clickHotel(_ sender: Any) {
        performSegue(withIdentifier: "GoToTabSegue", sender: self)
    }
    
    @IBAction func clickRestaurant(_ sender: Any) {
        performSegue(withIdentifier: "GoToTabSegue", sender: self)
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        let alert = UIAlertController(title: "TRIP", message: "Save Data?", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip] = self.tripName.text!
            Trip.sharedInstance.locationDays[Trip.sharedInstance.myCurrentTrip] = self.tripDays.text!
            Trip.sharedInstance.locationCost[Trip.sharedInstance.myCurrentTrip] = self.tripCost.text!
            
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if (Trip.sharedInstance.myCurrentTrip >= 0) {
            tripName.text = Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip]
            tripDays.text = Trip.sharedInstance.locationDays[Trip.sharedInstance.myCurrentTrip]
            tripCost.text = Trip.sharedInstance.locationCost[Trip.sharedInstance.myCurrentTrip]
        }
    }
    
    
}
