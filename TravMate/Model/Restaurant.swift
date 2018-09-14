//
//  Restaurant.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

struct Restaurant {
    
    var cafeName = ["Flirting Shadows", "Chorba", "Nandos", "McDonalds"]
    var cafeRating = [5, 4, 3, 2]
    var cafeNotes = ["Good Coffee", "Best Golzame", "Chicken" , "McMuffin"]
    var cafeCost = [33, 50, 20, 10]
    
    init() {
    }
    
    func getSizeofData() -> Int {
        return cafeName.count
    }
    
}
