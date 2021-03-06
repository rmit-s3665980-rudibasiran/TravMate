//
//  TripController.swift
//  TravMate
//
//  Created by Rudi Basiran on 13/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class TripController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tripsCollection: UICollectionView!
    
    // var trip:Trip = Trip.sharedInstance
    
    @IBAction func addTrip(_ sender: Any) {
        
        // init new array for new trip
        Trip.sharedInstance.locationName.append("")
        Trip.sharedInstance.locationDays.append("")
        Trip.sharedInstance.locationCost.append("")
        
        // Trip.sharedInstance.saveTrip(tLocationName: "", tLocationDay: "", tLocationCost: "")

        Trip.sharedInstance.flight.flightDepartNo.append("")
        Trip.sharedInstance.flight.flightReturnNo.append("")
        Trip.sharedInstance.flight.flightPortFrom.append("")
        Trip.sharedInstance.flight.flightPortTo.append("")
        Trip.sharedInstance.flight.flightDepartDate.append("")
        Trip.sharedInstance.flight.flightDepartTime.append("")
        Trip.sharedInstance.flight.flightReturnDate.append("")
        Trip.sharedInstance.flight.flightReturnTime.append("")
        Trip.sharedInstance.flight.flightCost.append("")
        Trip.sharedInstance.flight.flightType.append("")
        Trip.sharedInstance.flight.flightDuration.append("")
  
        Trip.sharedInstance.hotel.hotelName.append("")
        Trip.sharedInstance.hotel.hotelCheckIn.append("")
        Trip.sharedInstance.hotel.hotelCheckOut.append("")
        Trip.sharedInstance.hotel.hotelCost.append("")
        Trip.sharedInstance.hotel.hotelAddress.append("")
        Trip.sharedInstance.hotel.roomType.append("")
        Trip.sharedInstance.hotel.hotelNotes.append("")
        Trip.sharedInstance.hotel.hotelRating.append(0)
        
        Trip.sharedInstance.restaurant.cafeName.append("")
        Trip.sharedInstance.restaurant.cafeAddress.append("")
        Trip.sharedInstance.restaurant.cafeType.append("")
        Trip.sharedInstance.restaurant.cafeCost.append("")
        Trip.sharedInstance.restaurant.cafePax.append("")
        Trip.sharedInstance.restaurant.cafeNotes.append("")
        Trip.sharedInstance.restaurant.foodItem1.append("")
        Trip.sharedInstance.restaurant.foodItem2.append("")
        Trip.sharedInstance.restaurant.foodItem3.append("")
        Trip.sharedInstance.restaurant.foodItemSmiley1.append(true)
        Trip.sharedInstance.restaurant.foodItemSmiley2.append(true)
        Trip.sharedInstance.restaurant.foodItemSmiley3.append(true)
        Trip.sharedInstance.restaurant.cafeRating.append(0)
       
        if (Trip.sharedInstance.debugMode) {
            print ("Sizeofdata: " + String (Trip.sharedInstance.getSizeofData()))
        }
        
        Trip.sharedInstance.myCurrentTrip = Trip.sharedInstance.getSizeofData() - 1
        Trip.sharedInstance.myCurrentTab = TripTabController.flight
        performSegue(withIdentifier: "TripDetlSegue", sender: self)
    }
    
    // W: to convert RGB to HEX
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Trip.sharedInstance.myCurrentTrip = -1
        Trip.sharedInstance.clearEmptyData()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Trip.sharedInstance.myCurrentTrip = -1
        self.tripsCollection.reloadData()
        Trip.sharedInstance.clearEmptyData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Trip.sharedInstance.getSizeofData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TripCollectionViewCell
        
        cell.tripName.text = Trip.sharedInstance.locationName[indexPath.row]
        cell.tripDays.text = Trip.sharedInstance.locationDays[indexPath.row]
        cell.tripCost.text = Trip.sharedInstance.locationCost[indexPath.row]
    
      
        let picture = ["icon_london", "icon_newyork", "icon_paris", "icon_melbourne"]
        
        if (indexPath.row % 3 == 1) {
            // cell color: blue
            cell.backgroundColor = uicolorFromHex(rgbValue: 0x1684FB)
        }
        else if (indexPath.row % 3 == 2) {
            // cell color: purple
            cell.backgroundColor = uicolorFromHex(rgbValue: 0x7A70E4)
        }
        else {
            // cell color: turquoise
            cell.backgroundColor = uicolorFromHex(rgbValue: 0x53E3DD)
        }
        
        cell.tripImage.image =  UIImage(named: picture[indexPath.row % 4])
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        if (Trip.sharedInstance.debugMode) {
            print (indexPath.row)
            print (indexPath.item)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Trip.sharedInstance.myCurrentTrip = indexPath.row
        
        Trip.sharedInstance.dCurrentTrip = Trip.sharedInstance.getTrip(indexPath)
        Trip.sharedInstance.dCurrentFlight = Trip.sharedInstance.getFlight(indexPath)
        Trip.sharedInstance.dCurrentHotel = Trip.sharedInstance.getHotel(indexPath)
        Trip.sharedInstance.dCurrentCafe = Trip.sharedInstance.getCafe(indexPath)
        
        performSegue(withIdentifier: "TripDetlSegue", sender: self)
    }
    
}
