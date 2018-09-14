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
    
    let locationName = ["Melbourne", "Sydney", "Perth"]
    let locationDesc = ["Melbourne is the capital and most populous city of the Australian state of Victoria, and the second-most populous city in Australia and Oceania","Sydney is the state capital of New South Wales and the most populous city in Australia and Oceania. ","Perth is the capital and largest city of the Australian state of Western Australia"]
    let locationImage = [UIImage(named: "melbourne"), UIImage(named: "sydney"), UIImage(named: "perth")]
    
    // var trip:Trip = Trip()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TripCollectionViewCell
        
        cell.tripName.text = locationName[indexPath.row]
        cell.tripImage.image = locationImage[indexPath.row]
        cell.tripDesc.text = locationDesc[indexPath.row]
        
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
}
