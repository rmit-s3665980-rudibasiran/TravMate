//
//  Model.swift
//  TravMate
//
//  Created by Rudi Basiran on 12/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.


// IMPORTANT Notes | Start
// change var startUpType in Trip.swift according to either of these:
// Option (A)
// 1. startUpType = StartUpType.loadDummyData
// 2. run app
// 3. make changes
// 4. exit app
// 5. startUpType = StartUpType.doPersistence
// 6. run app again
// Option (B)
// 1. startUpType = StartUpType.spankingNew
// 2. run app
// 3. make changes
// 4. exit app
// 5. startUpType = StartUpType.doPersistence
// 6. run app again
// IMPORTANT Notes | End

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



