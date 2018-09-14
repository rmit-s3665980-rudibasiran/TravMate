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
    
    @IBOutlet weak var tripDetlName: UITextField!
    @IBOutlet weak var tripCost: UITextField!
    @IBOutlet weak var tripNoDays: UITextField!
    
    @IBAction func saveData(_ sender: Any) {
        
        let tNum = tripNoDays.text
        let tName = tripDetlName.text
        let tCost = tripCost.text
        Trip.sharedInstance.locationCost[Trip.sharedInstance.myCurrentTrip] = tCost!
        Trip.sharedInstance.locationDays[Trip.sharedInstance.myCurrentTrip] = tNum!
        Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip] = tName!
        
        performSegue(withIdentifier: "SegueBackToTrip", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (Trip.sharedInstance.myCurrentTrip >= 0) {
            tripDetlName.text = Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip]
            tripNoDays.text = Trip.sharedInstance.locationDays[Trip.sharedInstance.myCurrentTrip]
            tripCost.text = Trip.sharedInstance.locationCost[Trip.sharedInstance.myCurrentTrip]
        }
        else {
            tripDetlName.text = ""
            tripNoDays.text = ""
        }
       
    }
    
    
}
