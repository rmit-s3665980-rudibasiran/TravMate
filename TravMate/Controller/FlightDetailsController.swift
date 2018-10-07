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
            
            Trip.sharedInstance.saveFlight(
                tFlightDepartNo: self.flightDepartNo.text!,
                tFlightReturnNo: self.flightReturnNo.text!,
                tFlightPortFrom: self.flightPortFrom.text!,
                tFlightPortTo: self.flightPortTo.text!,
                tFlightDepartDate: self.flightDepartDate.text!,
                tFlightDepartTime: self.flightDepartTime.text!,
                tFlightReturnDate: self.flightReturnDate.text!,
                tFlightReturnTime: self.flightReturnTime.text!,
                tFlightCost: self.flightCost.text!,
                tFlightType: self.flightType.text!,
                tFlightDuration: self.flightDuration.text!)
         
            
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
        Trip.sharedInstance.myCurrentTab = TripTabController.flight
        self.do_load()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.do_load()
        Trip.sharedInstance.myCurrentTab = TripTabController.flight
       
    }
    
}
