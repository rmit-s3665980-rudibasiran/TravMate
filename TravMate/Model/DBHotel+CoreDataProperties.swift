//
//  DBHotel+CoreDataProperties.swift
//  TravMate
//
//  Created by Rudi Basiran on 6/10/18.
//  Copyright © 2018 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension DBHotel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBHotel> {
        return NSFetchRequest<DBHotel>(entityName: "DBHotel")
    }

    @NSManaged public var dbHotelName: String?
    @NSManaged public var dbHotelCheckIn: String?
    @NSManaged public var dbHotelCheckOut: String?
    @NSManaged public var dbHotelCost: String?
    @NSManaged public var dbHotelAddress: String?
    @NSManaged public var dbHotelroomType: String?
    @NSManaged public var dbHotelNotes: String?
    @NSManaged public var dbHotelRating: Int16

}
