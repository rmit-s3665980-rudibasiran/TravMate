//
//  Restaurant.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

struct Restaurant {
    
    var cafeName = ["Flirting Shadows", "Angels", "Coup du Nandos", "McDonalds"]
    var cafeAddress = ["2 Coburg", "3 Times Square", "Champ Elyse","Hay Street"]
    var cafeType = ["Good Coffee", "Best Golzame", "Le Poullet" , "McMuffin"]
    var cafeCost = ["$100", "$50", "$45", "$10"]
    var cafePax = ["5", "3", "1", "2"]
    var cafeNotes = ["Gordon Ramsey","Born in the USA","Bon Appetite","Maccas"]
    var foodItem1 = ["Snail","Steak","Un Chicken Finger","Burger"]
    var foodItem2 = ["Quail","Wedges","Le Petit Coke","Coke"]
    var foodItem3 = ["Ale","Beer","Frites","Fries"]
    
    
    // static var sharedInstance = Restaurant()
    
    init() {
    }
    
    func getSizeofData() -> Int {
        return cafeName.count
    }
    
}
