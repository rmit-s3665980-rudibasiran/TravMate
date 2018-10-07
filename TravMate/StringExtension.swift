//
//  StringExtension.swift
//  TravMate
//
//  Created by Rudi Basiran on 7/10/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation

extension String {
    
    func escapedParameters() -> String {
        
        var urlVars = [String]()
        let parameters:[String: AnyObject] = [
            "query": self as AnyObject
        ]
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
        }
        
        return (!urlVars.isEmpty ? "" : "") + urlVars.joined(separator: "&")
    }
}
