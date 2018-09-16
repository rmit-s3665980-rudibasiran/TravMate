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
    
    @IBOutlet weak var flightType: UITextField!
    
    @IBOutlet weak var flightCost: UITextField!
    
    @IBOutlet weak var flightDuration: UITextField!
    
    @IBAction func saveFlight(_ sender: Any) {
        
        let alert = UIAlertController(title: "TRIP", message: "Save Data?", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            Trip.sharedInstance.flight.flightPortFrom[Trip.sharedInstance.myCurrentTrip] = self.flightPortFrom.text!
            Trip.sharedInstance.flight.flightDepartNo[Trip.sharedInstance.myCurrentTrip] = self.flightDepartNo.text!
            Trip.sharedInstance.flight.flightReturnNo[Trip.sharedInstance.myCurrentTrip] = self.flightReturnNo.text!
            Trip.sharedInstance.flight.flightPortTo[Trip.sharedInstance.myCurrentTrip] = self.flightPortTo.text!
            Trip.sharedInstance.flight.flightDepartDate[Trip.sharedInstance.myCurrentTrip] = self.flightDepartDate.text!
            Trip.sharedInstance.flight.flightReturnDate[Trip.sharedInstance.myCurrentTrip] = self.flightReturnDate.text!
            Trip.sharedInstance.flight.flightDepartTime[Trip.sharedInstance.myCurrentTrip] = self.flightDepartTime.text!
            Trip.sharedInstance.flight.flightReturnTime[Trip.sharedInstance.myCurrentTrip] = self.flightReturnTime.text!
            Trip.sharedInstance.flight.flightCost[Trip.sharedInstance.myCurrentTrip] = self.flightCost.text!
            Trip.sharedInstance.flight.flightDuration[Trip.sharedInstance.myCurrentTrip] = self.flightDuration.text!
            Trip.sharedInstance.flight.flightType[Trip.sharedInstance.myCurrentTrip] = self.flightType.text!
            
        })
        
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            self.do_load()
            
        })
        
        alert.addAction(CancelAction)
        alert.addAction(OKAction)
        
        self.present(alert, animated: true, completion: nil)
        
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
    
    func do_load () {
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
            flightDuration.text = flightData.flightDuration[i]
            flightType.text = flightData.flightType[i]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.do_load()
        
    }
}
