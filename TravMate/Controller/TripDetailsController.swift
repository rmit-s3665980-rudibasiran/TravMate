//
//  TripDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class TripDetailsController: UIViewController {
    
   
    @IBOutlet weak var tripName: UITextField!
    
    @IBOutlet weak var tripDays: UITextField!
    
    @IBOutlet weak var tripCost: UITextField!
    
    
    @IBAction func saveData(_ sender: Any) {
        
        Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip] = tripName.text!
        Trip.sharedInstance.locationDays[Trip.sharedInstance.myCurrentTrip] = tripDays.text!
        Trip.sharedInstance.locationCost[Trip.sharedInstance.myCurrentTrip] = tripCost.text!
        
        
        performSegue(withIdentifier: "SegueBackToTrip", sender: self)
        
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
