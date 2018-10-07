//
//  RestaurantDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


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
    
    @IBOutlet weak var cafeStockImage: UIImageView!
    
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
    
    typealias JSON = [String: Any]
    var centerLatitude = -37.811270
    var centerLongitude = 144.956470
    var findCafeURL = ""
    var zomatoKey = "0b81760c6c459b42e90f4ad888fcd9b5"
 
    
    @IBAction func cafeSave(_ sender: Any) {
        
        let alert = UIAlertController(title: "RESTAURANT", message: "Save Data?", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            Trip.sharedInstance.saveCafe(
                tCafeName: self.cafeName.text!,
                tCafeAddress: self.cafeAddress.text!,
                tCafeType: self.cafeType.text!,
                tCafeCost: self.cafeCost.text!,
                tCafePax: self.cafePax.text!,
                tCafeNotes: self.cafeNotes.text!,
                tCafefoodItem1: self.item1.text!,
                tCafefoodItem2: self.item2.text!,
                tCafefoodItem3: self.item3.text!,
                tCafefoodItemSmiley1: self.foodITem1isOn,
                tCafefoodItemSmiley2: self.foodITem2isOn,
                tCafefoodItemSmiley3: self.foodITem3isOn,
                tCafeRating: Int16(self.cafeRating.starsRating))
            
        })
        
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            self.do_load ()
            
        })
        
        alert.addAction(CancelAction)
        alert.addAction(OKAction)
        
        self.present(alert, animated: true, completion: nil)
       
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
    
    
    func do_load () {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.do_load()
        Trip.sharedInstance.myCurrentTab = TripTabController.restaurant

        let cuisine = cafeType.text!.escapedParameters()
        let address = cafeAddress.text!
        
        var foundLatLong = false;
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil) {
                print("Error", error ?? "")
            }
            let placemark = placemarks?.first
            let coordinates:CLLocationCoordinate2D = placemark!.location!.coordinate
            self.centerLatitude = coordinates.latitude
            self.centerLongitude = coordinates.longitude
            print("Lat: \(coordinates.latitude) -- Long: \(coordinates.longitude)")
            foundLatLong = true
            if (foundLatLong) {
                self.findCafeURL = "https://developers.zomato.com/api/v2.1/search?&apikey=\(self.zomatoKey)&lat=\(self.centerLatitude)&lon=\(self.centerLongitude)&cuisines=\(cuisine)"
                if (Trip.sharedInstance.debugMode) {
                    print("REST URL | Start")
                    print(self.findCafeURL)
                    print("REST URL | End")
                }
                self.findNearbyCafes()
            
            }
        })
    }
    
    func findNearbyCafes () {
        
        let session = URLSession.shared
        let urlCafe = URL(string: findCafeURL)
        let request = URLRequest(url: urlCafe!)
        
        if (Trip.sharedInstance.debugMode) {
            print("Nearby cafes (i): ")
        }
        let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
            
            if (Trip.sharedInstance.debugMode) {
                print("Nearby cafes (ii): ")
            }
            
            if let error = downloadError {
                if (Trip.sharedInstance.debugMode) {
                    print("\(data) \n data")
                    print("\(response) \n response")
                    print("\(error)\n error")
                }
            }
            else {
                let parsedResult: Any!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }
                catch let error as NSError {
                    parsedResult = nil
                }
                catch {
                    fatalError()
                }
                if (Trip.sharedInstance.debugMode) {
                    print("Nearby cafes (iii): ")
                    // print(parsedResult)
                }
                    
                
                Trip.sharedInstance.recommendedCafes = ""
                Trip.sharedInstance.newCafeImage = ""
                if let allCafes = (parsedResult as AnyObject).value(forKey: "restaurants") as? NSArray {
                    for c in allCafes {
                        let cafe = c as! NSDictionary
                        let cName = cafe.value(forKeyPath: "restaurant.name") as? String
                        // let cAddr = cafe.value(forKeyPath: "restaurant.address") as? String
                        // let cPhoto = cafe.value(forKeyPath: "restaurant.photos_url") as? String
                        let cThumb = cafe.value(forKeyPath: "restaurant.thumb") as? String
                        
                        if (cName!.isEmpty) {
                            // do nothing
                        }
                        else {
                          
                            Trip.sharedInstance.recommendedCafes = cName!
                        
                            DispatchQueue.main.async(execute: {self.cafeNotes.text =  self.cafeNotes.text + "\nSuggested: " + Trip.sharedInstance.recommendedCafes})
                            
                            if (Trip.sharedInstance.debugMode) {
                                print("Cafes found | Start")
                                print (Trip.sharedInstance.recommendedCafes)
                                print("Cafes found | End")
                            }
                            
                        }
                        
                        if (cThumb!.isEmpty) {
                            // do nothing
                        }
                        else {
                            
                            Trip.sharedInstance.newCafeImage = cThumb!
                        
                            let url = URL(string: Trip.sharedInstance.newCafeImage)
                            do {
                                let data = try? Data(contentsOf: url!)
                                self.cafeStockImage.image = UIImage(data: data!)
                                DispatchQueue.main.async(execute: {self.cafeStockImage.image = UIImage(data: data!)})
                            }
                            catch let error as NSError {
                                print("Could not assign new photo: \(error), \(error.userInfo)")
                            }
                            
                            if (Trip.sharedInstance.debugMode) {
                                print("New Image URL | Start")
                                print(Trip.sharedInstance.newCafeImage)
                                print("New Image URL | End")
                            }
                            
                        }
                    }
                }
            }
        })
        task.resume()
    }
    
    
    func setButtonImage(_ btn:UIButton, bool:Bool) {
        let imgName = bool ? "smile" : "sad"
        let image = UIImage(named: imgName)!
        btn.setImage(image, for: .normal)
    }
    
}
