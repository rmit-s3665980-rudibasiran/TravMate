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
    
    
    @IBOutlet weak var flightPortFrom: UITextField!
    
    @IBOutlet weak var flightDepartNo: UITextField!
    
    @IBOutlet weak var flightPortTo: UITextField!
    
    @IBOutlet weak var flightDepartDate: UITextField!
    
    @IBOutlet weak var flightDepartTime: UITextField!
    
    @IBOutlet weak var flightReturnNo: UITextField!
    
    @IBOutlet weak var flightReturnDate: UITextField!
    
    @IBOutlet weak var flightReturnTime: UITextField!
    
    @IBOutlet weak var flightCost: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flightData = Trip.sharedInstance.geFlight()
        let i = Trip.sharedInstance.myCurrentTrip
        
        if (Trip.sharedInstance.myCurrentTrip >= 0)  {
            flightPortFrom.text = flightData.flightPortFrom[i]
            flightDepartNo.text = flightData.flightDepartNo[i]
            flightReturnNo.text = flightData.flightReturnNo[i]
            flightPortTo.text = flightData.flightPortTo[i]
            flightDepartDate.text = flightData.flightDepartDate[i]
            flightReturnDate.text = flightData.flightReturnDate[i]
            flightDepartTime.text = flightData.flightDepartTime[i]
            flightReturnTime.text = flightData.flightReturnTime[i]
            flightCost.text = flightData.flightCost[i]
        }
    }
}
