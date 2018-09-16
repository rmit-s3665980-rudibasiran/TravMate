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
    
    @IBOutlet weak var foodBtn1Img: UIButton!
    
    @IBAction func foodBtn1(_ sender: Any) {
       foodITem1isOn = !foodITem1isOn
        setButtonImage(foodBtn1Img, bool: foodITem1isOn)
    }
    
    
    @IBOutlet weak var foodBtn2Img: UIButton!
    
    
    @IBAction func foodBtn2(_ sender: Any) {
        
        foodITem2isOn = !foodITem2isOn
        setButtonImage(foodBtn2Img, bool: foodITem2isOn)
        
    }
    
    
    @IBOutlet weak var foodBtn3Img: UIButton!
    
    
    @IBAction func foodBtn3(_ sender: Any) {
        
        foodITem3isOn = !foodITem3isOn
        setButtonImage(foodBtn3Img, bool: foodITem3isOn)
        
    }
    
    @IBOutlet weak var cafeRating: RestaurantRatingController!
    var foodITem1isOn =  Trip.sharedInstance.restaurant.foodItemSmiley1[Trip.sharedInstance.myCurrentTrip]
    var foodITem2isOn =  Trip.sharedInstance.restaurant.foodItemSmiley2[Trip.sharedInstance.myCurrentTrip]
    var foodITem3isOn =  Trip.sharedInstance.restaurant.foodItemSmiley3[Trip.sharedInstance.myCurrentTrip]
    
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
        Trip.sharedInstance.restaurant.foodItemSmiley1[Trip.sharedInstance.myCurrentTrip] = foodITem1isOn
        Trip.sharedInstance.restaurant.foodItemSmiley2[Trip.sharedInstance.myCurrentTrip] = foodITem2isOn
        Trip.sharedInstance.restaurant.foodItemSmiley3[Trip.sharedInstance.myCurrentTrip] = foodITem3isOn
        
        Trip.sharedInstance.restaurant.cafeRating[Trip.sharedInstance.myCurrentTrip] = cafeRating.starsRating
        
       
    }
    
    // W: Share button
    @IBAction func shareSocial(_ sender: Any) {
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
            setButtonImage(foodBtn1Img, bool: foodITem1isOn)
            setButtonImage(foodBtn2Img, bool: foodITem2isOn)
            setButtonImage(foodBtn3Img, bool: foodITem3isOn) 
            
            
        }
    }
    
    func setButtonImage(_ btn:UIButton, bool:Bool) {
        let imgName = bool ? "smile" : "sad"
        let image = UIImage(named: imgName)!
        btn.setImage(image, for: .normal)
    }
    
}
