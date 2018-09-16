//
//  FlightDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class FlightDetailsController: UIViewController {
    
    @IBOutlet weak var tripName: UILabel!
    
    @IBOutlet weak var flightPortFrom: UITextField!
    
    @IBOutlet weak var flightDepartNo: UITextField!
    
    @IBOutlet weak var flightPortTo: UITextField!
    
    @IBOutlet weak var flightDepartDate: UITextField!
    
    @IBOutlet weak var flightDepartTime: UITextField!
    
    @IBOutlet weak var flightReturnNo: UITextField!
    
    @IBOutlet weak var flightReturnDate: UITextField!
    
    @IBOutlet weak var flightReturnTime: UITextField!
    
    @IBOutlet weak var flightCost: UITextField!
    
    @IBAction func saveFlight(_ sender: Any) {
        
        Trip.sharedInstance.flight.flightPortFrom[Trip.sharedInstance.myCurrentTrip] = flightPortFrom.text!
        Trip.sharedInstance.flight.flightDepartNo[Trip.sharedInstance.myCurrentTrip] = flightDepartNo.text!
        Trip.sharedInstance.flight.flightReturnNo[Trip.sharedInstance.myCurrentTrip] = flightReturnNo.text!
        Trip.sharedInstance.flight.flightPortTo[Trip.sharedInstance.myCurrentTrip] = flightPortTo.text!
        Trip.sharedInstance.flight.flightDepartDate[Trip.sharedInstance.myCurrentTrip] = flightDepartDate.text!
        Trip.sharedInstance.flight.flightReturnDate[Trip.sharedInstance.myCurrentTrip] = flightReturnDate.text!
        Trip.sharedInstance.flight.flightDepartTime[Trip.sharedInstance.myCurrentTrip] = flightDepartTime.text!
        Trip.sharedInstance.flight.flightReturnTime[Trip.sharedInstance.myCurrentTrip] = flightReturnTime.text!
        Trip.sharedInstance.flight.flightCost[Trip.sharedInstance.myCurrentTrip] = flightCost.text!
        
    }
    
    
    @IBAction func flightShare(_ sender: Any) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flightData = Trip.sharedInstance.geFlight()
        let i = Trip.sharedInstance.myCurrentTrip
        
        if (Trip.sharedInstance.myCurrentTrip >= 0)  {
            tripName.text = Trip.sharedInstance.locationName[i]
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
