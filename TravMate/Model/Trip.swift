//
//  Trip.swift
//  TravMate
//
//  Created by Rudi Basiran on 13/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct Trip {
    
    static var sharedInstance = Trip()
    
    var myCurrentTrip = 0
    var myCurrentTab = TripTabController.flight
    var useCoreData = false

    var locationName = ["LONDON, ENGLAND", "NEW YORK, USA", "PARIS, FRANCE", "MEBOURNE, AUSTRALIA"]
    var locationDays = ["10 Days", "11 Days", "14 Days", "5 Days"]
    var locationCost = ["$5,000" , "$7,000", "$8,000", "$500" ]
    
    var flight:Flight = Flight ()
    var hotel:Hotel = Hotel()
    var restaurant:Restaurant = Restaurant ()
    
    var dbTrip = [DBTrip]()
    var dbFlight = [DBFlight]()
    var dbHotel = [DBHotel]()
    var dbCafe = [DBCafe]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext: NSManagedObjectContext
    
  
    init() {
        myCurrentTrip = -1
        managedContext = appDelegate.persistentContainer.viewContext
        
        if (useCoreData) {
            populateDB()
            getTripFromCoreData()
            deleteAllData()
        }
    }
    
    mutating func populateDB() {
        for (index, value) in locationName.enumerated() {
            saveTrip(pLocationName: (value), pLocationDay: locationDays[(index)], pLocationCost: locationCost[(index)], existing: nil)
        }
    }
    
    func geFlight() -> Flight {
        return flight
    }
    
    func geHotel() -> Hotel {
        return hotel
    }
    
    func getRestaurant() -> Restaurant {
        return restaurant
    }
    
    func getSizeofData() -> Int {
        return locationName.count
    }
    
    func clearEmptyData() {
        var i = -1
        for string in Trip.sharedInstance.locationName {
            i = i + 1
            if (string == "") {
                deleteArray(i)
            }
        }
    }
    
    func clearData() {
        Trip.sharedInstance.locationName[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.locationDays[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.locationCost[Trip.sharedInstance.myCurrentTrip] = ""
        
        Trip.sharedInstance.flight.flightDepartNo[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightReturnNo[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightPortFrom[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightPortTo[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightDepartDate[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightDepartTime[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightReturnDate[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightReturnTime[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightCost[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightType[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.flight.flightDuration[Trip.sharedInstance.myCurrentTrip] = ""
        
        
        Trip.sharedInstance.hotel.hotelName[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.hotel.hotelCheckIn[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.hotel.hotelCheckOut[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.hotel.hotelCost[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.hotel.hotelAddress[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.hotel.roomType[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.hotel.hotelNotes[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.hotel.hotelRating[Trip.sharedInstance.myCurrentTrip] = 0
        
        Trip.sharedInstance.restaurant.cafeName[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.cafeAddress[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.cafeType[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.cafeCost[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.cafePax[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.cafeNotes[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.foodItem1[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.foodItem2[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.foodItem3[Trip.sharedInstance.myCurrentTrip] = ""
        Trip.sharedInstance.restaurant.foodItemSmiley1[Trip.sharedInstance.myCurrentTrip] = true
        Trip.sharedInstance.restaurant.foodItemSmiley2[Trip.sharedInstance.myCurrentTrip] = true
        Trip.sharedInstance.restaurant.foodItemSmiley3[Trip.sharedInstance.myCurrentTrip] = true
        Trip.sharedInstance.restaurant.cafeRating[Trip.sharedInstance.myCurrentTrip] = 0
    }
    
    func deleteArray (_ i:Int) {
        // remove empty data
        Trip.sharedInstance.locationName.remove(at: i)
        Trip.sharedInstance.locationDays.remove(at: i)
        Trip.sharedInstance.locationCost.remove(at: i)
        
        Trip.sharedInstance.flight.flightDepartNo.remove(at: i)
        Trip.sharedInstance.flight.flightReturnNo.remove(at: i)
        Trip.sharedInstance.flight.flightPortFrom.remove(at: i)
        Trip.sharedInstance.flight.flightPortTo.remove(at: i)
        Trip.sharedInstance.flight.flightDepartDate.remove(at: i)
        Trip.sharedInstance.flight.flightDepartTime.remove(at: i)
        Trip.sharedInstance.flight.flightReturnDate.remove(at: i)
        Trip.sharedInstance.flight.flightReturnTime.remove(at: i)
        Trip.sharedInstance.flight.flightCost.remove(at: i)
        Trip.sharedInstance.flight.flightType.remove(at: i)
        Trip.sharedInstance.flight.flightDuration.remove(at: i)
        
        Trip.sharedInstance.hotel.hotelName.remove(at: i)
        Trip.sharedInstance.hotel.hotelCheckIn.remove(at: i)
        Trip.sharedInstance.hotel.hotelCheckOut.remove(at: i)
        Trip.sharedInstance.hotel.hotelCost.remove(at: i)
        Trip.sharedInstance.hotel.hotelAddress.remove(at: i)
        Trip.sharedInstance.hotel.roomType.remove(at: i)
        Trip.sharedInstance.hotel.hotelNotes.remove(at: i)
        Trip.sharedInstance.hotel.hotelRating.remove(at: i)
        
        Trip.sharedInstance.restaurant.cafeName.remove(at: i)
        Trip.sharedInstance.restaurant.cafeAddress.remove(at: i)
        Trip.sharedInstance.restaurant.cafeType.remove(at: i)
        Trip.sharedInstance.restaurant.cafeCost.remove(at: i)
        Trip.sharedInstance.restaurant.cafePax.remove(at: i)
        Trip.sharedInstance.restaurant.cafeNotes.remove(at: i)
        Trip.sharedInstance.restaurant.foodItem1.remove(at: i)
        Trip.sharedInstance.restaurant.foodItem2.remove(at: i)
        Trip.sharedInstance.restaurant.foodItem3.remove(at: i)
        Trip.sharedInstance.restaurant.foodItemSmiley1.remove(at: i)
        Trip.sharedInstance.restaurant.foodItemSmiley2.remove(at: i)
        Trip.sharedInstance.restaurant.foodItemSmiley3.remove(at: i)
        Trip.sharedInstance.restaurant.cafeRating.remove(at: i)
    }

    mutating func deleteAllData() {
        // let fetchRequest = NSFetchRequest(entityName: "Vacation")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DBTrip")
        
        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]

            for item in items {
                managedContext.delete(item)
            }
            
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not delete all \(error), \(error.userInfo)")
        }
        
    }
    
    func updateDatabase() {
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    mutating func deleteTrip(_ indexPath: IndexPath) {
        let vacation = dbTrip[indexPath.item]
        dbTrip.remove(at: indexPath.item)
        managedContext.delete(vacation)
        updateDatabase()
    }
    
    mutating func deleteFlight(_ indexPath: IndexPath) {
        let flight = dbFlight[indexPath.item]
        dbFlight.remove(at: indexPath.item)
        managedContext.delete(flight)
        updateDatabase()
    }
    
    mutating func deleteHotel(_ indexPath: IndexPath) {
        let hotel = dbHotel[indexPath.item]
        dbHotel.remove(at: indexPath.item)
        managedContext.delete(hotel)
        updateDatabase()
    }
    
    mutating func deleteCafe(_ indexPath: IndexPath) {
        let cafe = dbCafe[indexPath.item]
        dbCafe.remove(at: indexPath.item)
        managedContext.delete(cafe)
        updateDatabase()
    }
    
    mutating func getTripFromCoreData () {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DBTrip")
            let results = try managedContext.fetch(fetchRequest)
            dbTrip = results as! [DBTrip]
        }
        catch let error as NSError {
            print("Could not fetch trip info: \(error), \(error.userInfo)")
        }
    }
    
    mutating func getFlightFromCoreData () {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DBFlight")
            let results = try managedContext.fetch(fetchRequest)
            dbFlight = results as! [DBFlight]
        }
        catch let error as NSError {
            print("Could not fetch flight info: \(error), \(error.userInfo)")
        }
    }
    
    mutating func getHotelFromCoreData () {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DBHotel")
            let results = try managedContext.fetch(fetchRequest)
            dbHotel = results as! [DBHotel]
        }
        catch let error as NSError {
            print("Could not fetch hotel info: \(error), \(error.userInfo)")
        }
    }
    
    mutating func getCafeFromCoreData () {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DBCafe")
            let results = try managedContext.fetch(fetchRequest)
            dbCafe = results as! [DBCafe]
        }
        catch let error as NSError {
            print("Could not fetch cafe info: \(error), \(error.userInfo)")
        }
    }
    
    mutating func saveTrip(
        pLocationName: String,
        pLocationDay: String,
        pLocationCost: String,
        existing: DBTrip?) {
        
        let entity = NSEntityDescription.entity(forEntityName: "DBTrip", in: managedContext)
        
        if let _ = existing {
            existing!.dbLocationName = pLocationName
            existing!.dbLocationDays = pLocationDay
            existing!.dbLocationCost = pLocationCost
        }
        else {
            let vacation = NSManagedObject(entity: entity!, insertInto: managedContext) as! DBTrip
            vacation.setValue(pLocationName, forKey: "dbLocationName")
            vacation.setValue(pLocationDay, forKey: "dbLocationDays")
            vacation.setValue(pLocationCost, forKey: "dbLocationCost")
            dbTrip.append(vacation)
        }
        updateDatabase()
    }
    
    mutating func saveFlight(
        pFlightDepartNo: String,
        pFlightReturnNo: String,
        pFlightPortFrom: String,
        pFlightPortTo: String,
        pFlightDepartDate: String,
        pFlightDepartTime: String,
        pFlightReturnDate: String,
        pFlightReturnTime: String,
        pFlightCost: String,
        pFlightType: String,
        pFlightDuration: String,
        existing: DBFlight?) {
        
        let entity = NSEntityDescription.entity(forEntityName: "DBFlight", in: managedContext)
        
        if let _ = existing {
            existing!.dbFlightDepartNo = pFlightDepartNo
            existing!.dbFlightReturnNo = pFlightReturnNo
            existing!.dbFlightPortFrom = pFlightPortFrom
            existing!.dbFlightPortTo = pFlightPortTo
            existing!.dbFlightDepartDate = pFlightDepartDate
            existing!.dbFlightDepartTime = pFlightDepartTime
            existing!.dbFlightReturnDate = pFlightReturnDate
            existing!.dbFlightReturnTime = pFlightReturnTime
            existing!.dbFlightCost = pFlightCost
            existing!.dbFlightType = pFlightType
            existing!.dbFlightDuration = pFlightDuration
        }
        else {
            let flight = NSManagedObject(entity: entity!, insertInto: managedContext) as! DBFlight
            flight.setValue(pFlightDepartNo, forKey: "dbFlightDepartNo")
            flight.setValue(pFlightReturnNo, forKey: "dbFlightReturnNo")
            flight.setValue(pFlightPortFrom, forKey: "dbFlightPortFrom")
            flight.setValue(pFlightPortTo, forKey: "dbFlightPortTo")
            flight.setValue(pFlightDepartDate, forKey: "dbFlightDepartDate")
            flight.setValue(pFlightDepartTime, forKey: "dbFlightDepartTime")
            flight.setValue(pFlightReturnDate, forKey: "dbFlightReturnDate")
            flight.setValue(pFlightReturnTime, forKey: "dbFlightReturnTime")
            flight.setValue(pFlightCost, forKey: "dbFlightCost")
            flight.setValue(pFlightType, forKey: "dbFlightType")
            flight.setValue(pFlightDuration, forKey: "dbFlightDuration")
            
            dbFlight.append(flight)
        }
        updateDatabase()
    }

    
    func getTrip(_ indexPath: IndexPath) -> DBTrip {
        return dbTrip[indexPath.row]
    }
    
    func getFlight(_ indexPath: IndexPath) -> DBFlight {
        return dbFlight[indexPath.row]
    }
    
    func getHotel(_ indexPath: IndexPath) -> DBHotel {
        return dbHotel[indexPath.row]
    }
    
    func getCafe(_ indexPath: IndexPath) -> DBCafe {
        return dbCafe[indexPath.row]
    }
    
}


enum TripTabController: Int {
    case flight = 0
    case hotel = 1
    case restaurant = 2
}

