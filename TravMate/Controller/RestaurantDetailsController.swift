//
//  RestaurantDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class RestaurantDetailsController: UIViewController {
    
    @IBOutlet weak var cafeName: UITextField!
    
    @IBOutlet weak var cafeAddress: UITextField!
    
    @IBOutlet weak var cafeCost: UITextField!
    
    @IBOutlet weak var cafePax: UITextField!
    
    
    
    
    @IBAction func cafeSave(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cafeData = Trip.sharedInstance.getRestaurant()
        let i = Trip.sharedInstance.myCurrentTrip
        
        if (Trip.sharedInstance.myCurrentTrip >= 0) {
            cafeName.text = cafeData.cafeName[i]
            cafeAddress.text = cafeData.cafeAddress[i]
            cafeCost.text = cafeData.cafeCost[i]
            cafePax.text = cafeData.cafePax[i]
            
            
        }
    }
}
