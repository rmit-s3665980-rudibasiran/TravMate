//
//  Vacation+CoreDataProperties.swift
//  TravMate
//
//  Created by Rudi Basiran on 5/10/18.
//  Copyright © 2018 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension Vacation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vacation> {
        return NSFetchRequest<Vacation>(entityName: "Vacation")
    }

    @NSManaged public var vacationName: String?
    @NSManaged public var vacationDays: String?
    @NSManaged public var vacationCost: String?

}
