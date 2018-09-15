//
//  FlightDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class FlightDetailsController: UIViewController {
    
    @IBOutlet weak var flightName: UITextField!
    @IBOutlet weak var flightGo: UITextField!
    @IBOutlet weak var flightReturn: UITextField!
    @IBOutlet weak var flightCost: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flightData = Trip.sharedInstance.geFlight()
        let i = Trip.sharedInstance.myCurrentTrip
        
        if (Trip.sharedInstance.myCurrentTrip >= 0)  {
            flightName.text = flightData.flightName[i]
            flightGo.text = flightData.flightGo[i]
            flightReturn.text = flightData.flightReturn[i]
            flightCost.text = flightData.flightCost[i]
        }
        else {
            flightName.text = ""
            flightGo.text = ""
            flightReturn.text = ""
            flightCost.text = ""
        }
    }
}
