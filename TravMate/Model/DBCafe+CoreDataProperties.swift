//
//  DBCafe+CoreDataProperties.swift
//  TravMate
//
//  Created by Rudi Basiran on 6/10/18.
//  Copyright © 2018 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension DBCafe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBCafe> {
        return NSFetchRequest<DBCafe>(entityName: "DBCafe")
    }

    @NSManaged public var dbCafeName: String?
    @NSManaged public var dbCafeAddress: String?
    @NSManaged public var dbCafeType: String?
    @NSManaged public var dbCafeCost: String?
    @NSManaged public var dbCafePax: String?
    @NSManaged public var dbCafeNotes: String?
    @NSManaged public var dbCafefoodItem1: String?
    @NSManaged public var dbCafefoodItem2: String?
    @NSManaged public var dbCafefoodItem3: String?
    @NSManaged public var dbCafefoodItemSmiley1: Bool
    @NSManaged public var dbCafefoodItemSmiley2: Bool
    @NSManaged public var dbCafefoodItemSmiley3: Bool
    @NSManaged public var dbCafeRating: Int16

}
