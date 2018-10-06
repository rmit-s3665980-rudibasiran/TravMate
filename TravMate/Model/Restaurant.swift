//
//  Restaurant.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

struct Restaurant {
    
    var cafeName: [String] = []
    var cafeAddress: [String] = []
    var cafeType: [String] = []
    var cafeCost: [String] = []
    var cafePax: [String] = []
    var cafeNotes: [String] = []
    var foodItem1: [String] = []
    var foodItem2: [String] = []
    var foodItem3: [String] = []
    var foodItemSmiley1: [Bool] = []
    var foodItemSmiley2: [Bool] = []
    var foodItemSmiley3: [Bool] = []
    var cafeRating: [Int] = []

    
    
    // static var sharedInstance = Restaurant()
    
    init() {
    }
    
    func getSizeofData() -> Int {
        return cafeName.count
    }
    
}
