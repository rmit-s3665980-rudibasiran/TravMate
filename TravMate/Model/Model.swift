//
//  Model.swift
//  TravMate
//
//  Created by Rudi Basiran on 12/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

class Model {
    
    var about:String
    
    init(){
        about = "\'John\' Michael Ariola Tubera\r\n"
        about += "\'Wan Yi\' Beh\r\n"
        about += "\'Rudi\' Basiran"
    }
    
    func getAbout() -> String {
        return about
    }
}
