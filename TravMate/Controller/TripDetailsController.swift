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
    @IBOutlet weak var tripDetlDesc: UITextView!
    
    @IBAction func saveData(_ sender: Any) {
        
        let tripDesc = tripDetlDesc.text
        let tripName = tripDetlName.text
        Trip.sharedInstance.locationDesc[Trip.sharedInstance.myCurrentTrip] = tripDesc!
        Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip] = tripName!
        
        performSegue(withIdentifier: "SegueBackToTrip", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (Trip.sharedInstance.myCurrentTrip >= 0) {
            tripDetlName.text = Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip]
            tripDetlDesc.text = Trip.sharedInstance.locationDesc[Trip.sharedInstance.myCurrentTrip]
        }
        else {
            tripDetlName.text = ""
            tripDetlDesc.text = ""
        }
       
    }
    
    
}
