//
//  Model.swift
//  TravMate
//
//  Created by Rudi Basiran on 12/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Model {

    var about:String
    
    init(){
        about = "John Michael Ariola Tubera"
        about += "Wan Yi Beh"
        about += "Rudi Basiran"
    }
    
    func getAbout() -> String {
        return about
    }
}

enum TripTabController: Int {
    case flight = 0
    case hotel = 1
    case restaurant = 2
}

enum StartUpType : Int {
    case spankingNew = 0
    case loadDummyData = 1
    case doPersistence = 2

}



