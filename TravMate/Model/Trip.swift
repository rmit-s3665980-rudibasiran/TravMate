//
//  Trip.swift
//  TravMate
//
//  Created by Rudi Basiran on 13/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

class Trip {
    
    var locationName = ["Melbourne", "Sydney", "Perth"]
    var locationDesc = ["Victoria", "New South Wales", "Western Australia"]
    var locationImage = [UIImage(named: "melbourne"), UIImage(named: "sydney"), UIImage (named: "perth")]
    
    var title: String?
    var image: UIImage?
    
    init() {
        
    }
    
    init(title: String, image: UIImage) {
        self.title = title;
        self.image = image;
    }
    
}
