//
//  TripController.swift
//  TravMate
//
//  Created by Rudi Basiran on 13/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class TripController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var trip:Trip = Trip.sharedInstance
    
    @IBAction func addTrip(_ sender: Any) {
        
        Trip.sharedInstance.locationName.append("")
        Trip.sharedInstance.locationDays.append("")
        Trip.sharedInstance.locationCost.append("")

        Trip.sharedInstance.flight.flightDepartNo.append("")
        Trip.sharedInstance.flight.flightReturnNo.append("")
        Trip.sharedInstance.flight.flightPortFrom.append("")
        Trip.sharedInstance.flight.flightPortTo.append("")
        Trip.sharedInstance.flight.flightDepartDate.append("")
        Trip.sharedInstance.flight.flightDepartTime.append("")
        Trip.sharedInstance.flight.flightReturnDate.append("")
        Trip.sharedInstance.flight.flightReturnTime.append("")
        Trip.sharedInstance.flight.flightCost.append("")
        
        Trip.sharedInstance.hotel.hotelName.append("")
        Trip.sharedInstance.hotel.hotelCheckIn.append("")
        Trip.sharedInstance.hotel.hotelCheckOut.append("")
        Trip.sharedInstance.hotel.hotelCost.append("")
        Trip.sharedInstance.hotel.hotelAddress.append("")
        Trip.sharedInstance.hotel.roomType.append("")
        Trip.sharedInstance.hotel.hotelNotes.append("")
        
        Trip.sharedInstance.restaurant.cafeName.append("")
        Trip.sharedInstance.restaurant.cafeNotes.append("")
        Trip.sharedInstance.restaurant.cafeRating.append("")
        Trip.sharedInstance.restaurant.cafeCost.append("")
        
        Trip.sharedInstance.myCurrentTrip = trip.getSizeofData()
        
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
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trip.getSizeofData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TripCollectionViewCell
        
        cell.tripName.text = trip.locationName[indexPath.row]
        cell.tripDays.text = trip.locationDays[indexPath.row]
        cell.tripCost.text = trip.locationCost[indexPath.row]
        
        let picture = ["icon_beijing", "icon_newyork", "icon_paris"]
        
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
        
        cell.tripImage.image =  UIImage(named: picture[indexPath.row % 3])
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Trip.sharedInstance.myCurrentTrip = indexPath.row
        performSegue(withIdentifier: "TripDetlSegue", sender: self)
    }
}
