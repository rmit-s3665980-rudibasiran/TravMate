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
    @IBOutlet weak var cafeNotes: UITextField!
    @IBOutlet weak var cafeRating: UITextField!
    @IBOutlet weak var cafeCost: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cafeData = Trip.sharedInstance.getRestaurant()
        let i = Trip.sharedInstance.myCurrentTrip
        
        if (Trip.sharedInstance.myCurrentTrip >= 0) {
            cafeName.text = cafeData.cafeName[i]
            cafeNotes.text = cafeData.cafeNotes[i]
            cafeRating.text = cafeData.cafeRating[i]
            cafeCost.text = cafeData.cafeCost[i]
        }
        else {
            cafeName.text = ""
            cafeNotes.text = ""
            cafeRating.text = ""
            cafeCost.text = ""
        }
    }
}
