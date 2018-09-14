//
//  Trip.swift
//  TravMate
//
//  Created by Rudi Basiran on 13/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit

enum Trip:Int
{
    case first=1, second, third, fourth
    
    init() {
        self = .first
    }
    
    init?(number:Int)
    {
        switch number {
        case 1: self = .first
        case 2: self = .second
        case 3: self = .third
        case 4: self = .fourth
        default: return nil
        }
    }
    
    var rank:Int
    {
        get {
            return self.rawValue
        }
    }
    
    var name:String
    {
        get {
            switch self {
            case .first:    return "First"
            case .second:   return "Second"
            case .third:    return "Third"
            case .fourth:   return "Fourth"
            }
        }
    }
    
    var imageName:String
    {
        get {
            return self.name.replacingOccurrences(of: " ", with: "")
        }
    }
    
    var interpretation:String
    {
        get {
            switch self {
            case .first:    return "Melbourne"
            case .second:   return "Perth"
            case .third:    return "Sydney"
            case .fourth:   return "Brisbane"
            }
        }
    }
    
    static func getTrip() ->[Trip]
    {
        return [first, second, third, fourth]
    }
    
    static func getTripDictionary() ->[String:Trip]
    {
        var allTrips:[String:Trip] = [:]
        for trip in getTrip() {
            allTrips.updateValue(trip, forKey: trip.name)
        }
        return allTrips
    }
    
    func getTripDescription() ->String {
        let interpretationMinusFullStop = String(self.interpretation.dropLast())
        var description = "My " + self.name
        description +=  " Trip: " + interpretationMinusFullStop
        return description
    }
}
