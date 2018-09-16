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
    
    var cafeName = ["Le Clec", "Spudbar", "Coup du Nandos", "McDonalds"]
    var cafeAddress = ["727 Glenferrie Road", "36 Swanston Street", "45 Champ Elyse Road","2 Hay Street"]
    var cafeType = ["Fusion, Coffee and Tea, Cafe Food",
                    "Healthy Food, Fast Food, Salad",
                    "Portuguese" ,
                    "American, Fast Food"]
    var cafeCost = ["$100", "$50", "$45", "$10"]
    var cafePax = ["5", "3", "1", "2"]
    var cafeNotes = ["It is good! The staff were friendly and very attentive. Very polite and professional in their service.",
                     "Service was very quick. Student deals are available so bring your student card for a $7 spud!",
                     "Good food but the price was a bit high for a bowl of rice. Really enjoyed it tho! Would’ve loved it even more if it was less crowdy/ noisy.",
                     "Can't go wrong with maccas, best with fries and sundae."]
    var foodItem1 = ["Snail","Steak","Un Chicken Finger","Burger"]
    var foodItem2 = ["Quail","Wedges","Le Petit Coke","Coke"]
    var foodItem3 = ["Ale","Beer","Frites","Fries"]
    var foodItemSmiley1 = [true, true, true, true]
    var foodItemSmiley2 = [true, true, true, true]
    var foodItemSmiley3 = [true, true, true, true]
    var cafeRating = [1,2,3,4]

    
    
    // static var sharedInstance = Restaurant()
    
    init() {
    }
    
    func getSizeofData() -> Int {
        return cafeName.count
    }
    
}
