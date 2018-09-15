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
    
    @IBOutlet weak var cafeType: UITextField!
    
    @IBOutlet weak var item1: UITextField!
    
    @IBOutlet weak var item2: UITextField!
    
    @IBOutlet weak var item3: UITextField!
    
    @IBOutlet weak var cafeNotes: UITextView!
    
    
    @IBAction func cafeSave(_ sender: Any) {
        Trip.sharedInstance.restaurant.cafeName[Trip.sharedInstance.myCurrentTrip] = cafeName.text!
        Trip.sharedInstance.restaurant.cafeAddress[Trip.sharedInstance.myCurrentTrip] = cafeAddress.text!
        
        Trip.sharedInstance.restaurant.cafeType[Trip.sharedInstance.myCurrentTrip] = cafeType.text!
        Trip.sharedInstance.restaurant.cafeCost[Trip.sharedInstance.myCurrentTrip] = cafeCost.text!

        Trip.sharedInstance.restaurant.cafePax[Trip.sharedInstance.myCurrentTrip] = cafePax.text!
        
        Trip.sharedInstance.restaurant.foodItem1[Trip.sharedInstance.myCurrentTrip] = item1.text!
        Trip.sharedInstance.restaurant.foodItem2[Trip.sharedInstance.myCurrentTrip] = item2.text!
        Trip.sharedInstance.restaurant.foodItem3[Trip.sharedInstance.myCurrentTrip] = item3.text!
        
        Trip.sharedInstance.restaurant.cafeNotes[Trip.sharedInstance.myCurrentTrip] = cafeNotes.text!
        
       
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
            cafeType.text = cafeData.cafeType[i]
            item1.text = cafeData.foodItem1[i]
            item2.text = cafeData.foodItem2[i]
            item3.text = cafeData.foodItem3[i]
            cafeNotes.text = cafeData.cafeNotes[i]
            
            
            
        }
    }
}
