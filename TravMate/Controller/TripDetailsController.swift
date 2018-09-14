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
        Trip.sharedInstance.locationDesc[Trip.sharedInstance.myCurrentTrip] = tripDesc!
        
        performSegue(withIdentifier: "SegueBackToTrip", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tripDetlName.text = Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip]
        tripDetlDesc.text = Trip.sharedInstance.locationDesc[Trip.sharedInstance.myCurrentTrip]
       
    }
    
    
}
