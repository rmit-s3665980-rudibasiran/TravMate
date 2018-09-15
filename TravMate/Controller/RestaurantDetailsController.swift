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
