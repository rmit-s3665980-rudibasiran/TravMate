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
        about = "John Michael Ariola Tubera (s3682951), "
        about += "Wan Yi Beh (s3368772), "
        about += "Rudi Basiran (s3665980)"
    }
    
    func getAbout() -> String {
        return about
    }
}
