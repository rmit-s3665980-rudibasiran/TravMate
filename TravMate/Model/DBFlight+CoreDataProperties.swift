//
//  DBFlight+CoreDataProperties.swift
//  TravMate
//
//  Created by Rudi Basiran on 6/10/18.
//  Copyright © 2018 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension DBFlight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBFlight> {
        return NSFetchRequest<DBFlight>(entityName: "DBFlight")
    }

    @NSManaged public var dbFlightDepartNo: String?
    @NSManaged public var dbFlightReturnNo: String?
    @NSManaged public var dbFlightPortFrom: String?
    @NSManaged public var dbFlightPortTo: String?
    @NSManaged public var dbFlightDepartDate: String?
    @NSManaged public var dbFlightDepartTime: String?
    @NSManaged public var dbFlightReturnDate: String?
    @NSManaged public var dbFlightReturnTime: String?
    @NSManaged public var dbFlightCost: String?
    @NSManaged public var dbFlightType: String?
    @NSManaged public var dbFlightDuration: String?

}
