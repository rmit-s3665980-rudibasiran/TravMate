//
//  RestaurantRatingController.swift
//  TravMate
//
//  Created by Rudi Basiran on 16/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class RestaurantRatingController: UIStackView {
    
    
    // set to what is in the data or 0 for initial
    var starsRating = Trip.sharedInstance.getRestaurant().cafeRating[Trip.sharedInstance.myCurrentTrip]
    
    var starsEmptyPicName = "star_empty" // change it to your empty star picture name
    var starsFilledPicName = "star_filled" // change it to your filled star picture name
    
    override func draw(_ rect: CGRect) {
        let cafeRating = self.subviews.filter{$0 is UIButton}
        var starTag = 1
        for button in cafeRating {
            if let button = button as? UIButton{
                button.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                button.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
                button.tag = starTag
                starTag = starTag + 1
            }
        }
        setStarsRating(rating:starsRating)
    }
    func setStarsRating(rating:Int){
        self.starsRating = rating
        let stackSubViews = self.subviews.filter{$0 is UIButton}
        for subView in stackSubViews {
            if let button = subView as? UIButton{
                if button.tag > starsRating {
                    button.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                }else{
                    button.setImage(UIImage(named: starsFilledPicName), for: .normal)
                }
            }
        }
    }
    
    @objc func pressed(sender: UIButton) {
        setStarsRating(rating: sender.tag)
    }
}

