//
//  DBTrip+CoreDataProperties.swift
//  TravMate
//
//  Created by Rudi Basiran on 6/10/18.
//  Copyright © 2018 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension DBTrip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBTrip> {
        return NSFetchRequest<DBTrip>(entityName: "DBTrip")
    }

    @NSManaged public var dbLocationCost: String?
    @NSManaged public var dbLocationDays: String?
    @NSManaged public var dbLocationName: String?

}
