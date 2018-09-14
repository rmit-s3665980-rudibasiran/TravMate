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
        Trip.sharedInstance.locationDesc.append("")
        Trip.sharedInstance.locationImage.append("defaulttripimage")
        
        Trip.sharedInstance.flight.flightCost.append("")
        Trip.sharedInstance.flight.flightName.append("")
        Trip.sharedInstance.flight.flightGo.append("")
        Trip.sharedInstance.flight.flightReturn.append("")
        
        Trip.sharedInstance.hotel.hotelName.append("")
        Trip.sharedInstance.hotel.hotelCheckIn.append("")
        Trip.sharedInstance.hotel.hotelCheckOut.append("")
        Trip.sharedInstance.hotel.hotelCost.append("")
        
        Trip.sharedInstance.restaurant.cafeName.append("")
        Trip.sharedInstance.restaurant.cafeNotes.append("")
        Trip.sharedInstance.restaurant.cafeRating.append("")
        Trip.sharedInstance.restaurant.cafeCost.append("")
        
        Trip.sharedInstance.myCurrentTrip = trip.getSizeofData()
        
        performSegue(withIdentifier: "TripDetlSegue", sender: self)
        
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
        cell.tripImage.image =  UIImage(named: trip.locationImage[indexPath.row]) 
        cell.tripDesc.text = trip.locationDesc[indexPath.row]
        
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
