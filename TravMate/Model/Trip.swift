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
    
    var debugMode = true
    var myCurrentTrip = 0
    var myCurrentTab = TripTabController.flight
  
    var locationName:[String] = []
    var locationDays:[String] = []
    var locationCost:[String] = []
 
    var flight:Flight = Flight ()
    var hotel:Hotel = Hotel()
    var restaurant:Restaurant = Restaurant ()
    
    var dbTrip = [DBTrip]()
    var dbFlight = [DBFlight]()
    var dbHotel = [DBHotel]()
    var dbCafe = [DBCafe]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext: NSManagedObjectContext
    
    var dCurrentTrip = DBTrip()
    var dCurrentFlight = DBFlight()
    var dCurrentHotel = DBHotel ()
    var dCurrentCafe = DBCafe ()
    
    var startUpType:StartUpType    // control what kind of startup to begin with
    
    var recommendedCafes = ""
    var newCafeImage = ""
  
    init() {
        myCurrentTrip = -1
        managedContext = appDelegate.persistentContainer.viewContext
        
        if (debugMode) {
            print ("dbTrip [a]: " + String(dbTrip.count))
            print ("dbFlight [a]: " + String(dbFlight.count))
            print ("dbHotal [a]: " + String(dbHotel.count))
            print ("dbCafe [a]: " + String(dbCafe.count))
        }
        // IMPORTANT Notes | Start
        // change var startUpType in Trip.swift according to either of these:
        // Option (A)
        // 1. startUpType = StartUpType.loadDummyData
        // 2. run app
        // 3. make changes
        // 4. exit app
        // 5. startUpType = StartUpType.doPersistence
        // 6. run app again
        // Option (B)
        // 1. startUpType = StartUpType.spankingNew
        // 2. run app
        // 3. make changes
        // 4. exit app
        // 5. startUpType = StartUpType.doPersistence
        // 6. run app again
        
        
        startUpType = StartUpType.loadDummyData
        
        /// IMPORTANT Notes | End
        
        if (startUpType == StartUpType.loadDummyData) {
            deleteDataFromDB("DBTrip")
            deleteDataFromDB("DBFlight")
            deleteDataFromDB("DBHotel")
            deleteDataFromDB("DBCafe")
            loadDatafromArrayforTesting()
            populateDBfromArray()
            
        }
        else if (startUpType == StartUpType.doPersistence) {
            getTripFromCoreData()
            getFlightFromCoreData()
            getHotelFromCoreData()
            getCafeFromCoreData()
            loadDataFromCoreToArray()
        }
        else if (startUpType == StartUpType.spankingNew) {
            deleteDataFromDB("DBTrip")
            deleteDataFromDB("DBFlight")
            deleteDataFromDB("DBHotel")
            deleteDataFromDB("DBCafe")
        }
        
        if (debugMode) {
            print ("dbTrip [b]: " + String(dbTrip.count))
            print ("dbFlight [b]: " + String(dbFlight.count))
            print ("dbHotal [b]: " + String(dbHotel.count))
            print ("dbCafe [b]: " + String(dbCafe.count))
        }
    }
    
    mutating func loadDataFromCoreToArray() {
        
        // clear array of data
        locationName.removeAll()
        locationCost.removeAll()
        locationDays.removeAll()
        
        flight.flightDepartNo.removeAll()
        flight.flightReturnNo.removeAll()
        flight.flightPortFrom.removeAll()
        flight.flightPortTo.removeAll()
        flight.flightDepartDate.removeAll()
        flight.flightDepartTime.removeAll()
        flight.flightReturnDate.removeAll()
        flight.flightReturnTime.removeAll()
        flight.flightCost.removeAll()
        flight.flightType.removeAll()
        flight.flightDuration.removeAll()
        
        hotel.hotelName.removeAll()
        hotel.hotelCheckIn.removeAll()
        hotel.hotelCheckOut.removeAll()
        hotel.hotelCost.removeAll()
        hotel.hotelAddress.removeAll()
        hotel.roomType.removeAll()
        hotel.hotelNotes.removeAll()
        hotel.hotelRating.removeAll()
        
        restaurant.cafeName.removeAll()
        restaurant.cafeAddress.removeAll()
        restaurant.cafeType.removeAll()
        restaurant.cafeCost.removeAll()
        restaurant.cafePax.removeAll()
        restaurant.cafeNotes.removeAll()
        restaurant.foodItem1.removeAll()
        restaurant.foodItem2.removeAll()
        restaurant.foodItem3.removeAll()
        restaurant.foodItemSmiley1.removeAll()
        restaurant.foodItemSmiley2.removeAll()
        restaurant.foodItemSmiley3.removeAll()
        restaurant.cafeRating.removeAll()
        
        for i in 0 ..< dbTrip.count {
            locationName.append(dbTrip[i].dbLocationName!)
            locationDays.append(dbTrip[i].dbLocationDays!)
            locationCost.append(dbTrip[i].dbLocationCost!)
        }
        
        for i in 0 ..< dbFlight.count {
            flight.flightDepartNo.append(dbFlight[i].dbFlightDepartNo!)
            flight.flightReturnNo.append(dbFlight[i].dbFlightReturnNo!)
            flight.flightPortFrom.append(dbFlight[i].dbFlightPortFrom!)
            flight.flightPortTo.append(dbFlight[i].dbFlightPortTo!)
            flight.flightDepartDate.append(dbFlight[i].dbFlightDepartDate!)
            flight.flightDepartTime.append(dbFlight[i].dbFlightDepartTime!)
            flight.flightReturnDate.append(dbFlight[i].dbFlightReturnDate!)
            flight.flightReturnTime.append(dbFlight[i].dbFlightReturnTime!)
            flight.flightCost.append(dbFlight[i].dbFlightCost!)
            flight.flightType.append(dbFlight[i].dbFlightType!)
            flight.flightDuration.append(dbFlight[i].dbFlightDuration!)
        }
        
        for i in 0 ..< dbHotel.count {
            hotel.hotelName.append(dbHotel[i].dbHotelName!)
            hotel.hotelCheckIn.append(dbHotel[i].dbHotelCheckIn!)
            hotel.hotelCheckOut.append(dbHotel[i].dbHotelCheckOut!)
            hotel.hotelCost.append(dbHotel[i].dbHotelCost!)
            hotel.hotelAddress.append(dbHotel[i].dbHotelAddress!)
            hotel.roomType.append(dbHotel[i].dbHotelroomType!)
            hotel.hotelNotes.append(dbHotel[i].dbHotelNotes!)
            hotel.hotelRating.append(Int(dbHotel[i].dbHotelRating))
        }
        for i in 0 ..< dbCafe.count {
            restaurant.cafeName.append(dbCafe[i].dbCafeName!)
            restaurant.cafeAddress.append(dbCafe[i].dbCafeAddress!)
            restaurant.cafeType.append(dbCafe[i].dbCafeType!)
            restaurant.cafeCost.append(dbCafe[i].dbCafeCost!)
            restaurant.cafePax.append(dbCafe[i].dbCafePax!)
            restaurant.cafeNotes.append(dbCafe[i].dbCafeNotes!)
            restaurant.foodItem1.append(dbCafe[i].dbCafefoodItem1!)
            restaurant.foodItem2.append(dbCafe[i].dbCafefoodItem2!)
            restaurant.foodItem3.append(dbCafe[i].dbCafefoodItem3!)
            restaurant.foodItemSmiley1.append(dbCafe[i].dbCafefoodItemSmiley1)
            restaurant.foodItemSmiley2.append(dbCafe[i].dbCafefoodItemSmiley2)
            restaurant.foodItemSmiley3.append(dbCafe[i].dbCafefoodItemSmiley3)
            restaurant.cafeRating.append(Int(dbCafe[i].dbCafeRating))
        }
    }
    
    mutating func saveTrip (
        tLocationName: String,
        tLocationDay: String,
        tLocationCost: String) {
        
        
        saveTripToDB(pLocationName: tLocationName, pLocationDay: tLocationDay, pLocationCost: tLocationCost, existing: dCurrentTrip)
  
        locationName[myCurrentTrip] = tLocationName
        locationDays[myCurrentTrip] = tLocationDay
        locationCost[myCurrentTrip] = tLocationCost
        
        
        
    }
    
    mutating func saveFlight(
        tFlightDepartNo: String,
        tFlightReturnNo: String,
        tFlightPortFrom: String,
        tFlightPortTo: String,
        tFlightDepartDate: String,
        tFlightDepartTime: String,
        tFlightReturnDate: String,
        tFlightReturnTime: String,
        tFlightCost: String,
        tFlightType: String,
        tFlightDuration: String) {
        
 
        saveFlightToDB(pFlightDepartNo: tFlightDepartNo,
                       pFlightReturnNo: tFlightReturnNo,
                       pFlightPortFrom: tFlightPortFrom,
                       pFlightPortTo: tFlightPortTo,
                       pFlightDepartDate: tFlightDepartDate,
                       pFlightDepartTime: tFlightDepartTime,
                       pFlightReturnDate: tFlightReturnDate,
                       pFlightReturnTime: tFlightReturnTime,
                       pFlightCost: tFlightCost,
                       pFlightType: tFlightType,
                       pFlightDuration: tFlightDuration,
                       existing: dCurrentFlight)
        
        
        flight.flightPortFrom[myCurrentTrip] = tFlightPortFrom
        flight.flightDepartNo[myCurrentTrip] = tFlightDepartNo
        flight.flightReturnNo[myCurrentTrip] = tFlightReturnNo
        flight.flightPortTo[myCurrentTrip] = tFlightPortTo
        flight.flightDepartDate[myCurrentTrip] = tFlightDepartDate
        flight.flightReturnDate[myCurrentTrip] = tFlightReturnDate
        flight.flightDepartTime[myCurrentTrip] = tFlightDepartTime
        flight.flightReturnTime[myCurrentTrip] = tFlightReturnTime
        flight.flightCost[myCurrentTrip] = tFlightCost
        flight.flightDuration[myCurrentTrip] = tFlightDuration
        flight.flightType[myCurrentTrip] = tFlightType
    }
    
    mutating func saveHotel(
        tHotelName: String,
        tHotelCheckIn: String,
        tHotelCheckOut: String,
        tHotelCost: String,
        tHotelAddress: String,
        tHotelroomType: String,
        tHotelNotes: String,
        tHotelRating: Int16) {
        
        
        saveHotelToDB(
            pHotelName: tHotelName,
            pHotelCheckIn: tHotelCheckIn,
            pHotelCheckOut: tHotelCheckOut,
            pHotelCost: tHotelCost,
            pHotelAddress: tHotelAddress,
            pHotelroomType: tHotelroomType,
            pHotelNotes: tHotelNotes,
            pHotelRating: tHotelRating,
            existing: dCurrentHotel)
        

        
        hotel.hotelNotes[myCurrentTrip] = tHotelNotes
        hotel.roomType[myCurrentTrip] = tHotelroomType
        hotel.hotelName[myCurrentTrip] = tHotelName
        hotel.hotelCheckIn[myCurrentTrip] = tHotelCheckIn
        hotel.hotelCheckOut[myCurrentTrip] = tHotelCheckOut
        hotel.hotelAddress[myCurrentTrip] = tHotelAddress
        hotel.hotelCost[myCurrentTrip] = tHotelCost
        hotel.hotelRating[myCurrentTrip] = Int(tHotelRating)
        
    }
    
    mutating func saveCafe(
        tCafeName: String,
        tCafeAddress: String,
        tCafeType: String,
        tCafeCost: String,
        tCafePax: String,
        tCafeNotes: String,
        tCafefoodItem1: String,
        tCafefoodItem2: String,
        tCafefoodItem3: String,
        tCafefoodItemSmiley1: Bool,
        tCafefoodItemSmiley2: Bool,
        tCafefoodItemSmiley3: Bool,
        tCafeRating: Int16) {
        
        
        saveCafeToDB(
            pCafeName: tCafeName,
            pCafeAddress: tCafeAddress,
            pCafeType: tCafeType,
            pCafeCost: tCafeCost,
            pCafePax: tCafePax,
            pCafeNotes: tCafeNotes,
            pCafefoodItem1: tCafefoodItem1,
            pCafefoodItem2: tCafefoodItem2,
            pCafefoodItem3: tCafefoodItem3,
            pCafefoodItemSmiley1: tCafefoodItemSmiley1,
            pCafefoodItemSmiley2: tCafefoodItemSmiley2,
            pCafefoodItemSmiley3: tCafefoodItemSmiley3,
            pCafeRating: tCafeRating,
            existing: dCurrentCafe)
        
        restaurant.cafeName[myCurrentTrip] = tCafeName
        restaurant.cafeAddress[myCurrentTrip] = tCafeAddress
        
        restaurant.cafeType[myCurrentTrip] = tCafeType
        restaurant.cafeCost[myCurrentTrip] = tCafeCost
        
        restaurant.cafePax[myCurrentTrip] = tCafePax
        
        restaurant.foodItem1[myCurrentTrip] = tCafefoodItem1
        restaurant.foodItem2[myCurrentTrip] = tCafefoodItem2
        restaurant.foodItem3[myCurrentTrip] = tCafefoodItem3
        
        restaurant.cafeNotes[myCurrentTrip] = tCafeNotes
        restaurant.foodItemSmiley1[myCurrentTrip] = tCafefoodItemSmiley1
        restaurant.foodItemSmiley2[myCurrentTrip] = tCafefoodItemSmiley2
        restaurant.foodItemSmiley3[myCurrentTrip] = tCafefoodItemSmiley3
        
        restaurant.cafeRating[myCurrentTrip] = Int(tCafeRating)
        
        
    }
    
    mutating func populateDBfromArray() {
        for (index, value) in locationName.enumerated() {
            saveTripToDB(
                pLocationName: (value),
                pLocationDay: locationDays[(index)],
                pLocationCost: locationCost[(index)], existing: nil)
        }
   
        for (indexF, valueF) in flight.flightDepartNo.enumerated() {
            saveFlightToDB(pFlightDepartNo: (valueF),
                       pFlightReturnNo: flight.flightReturnNo[(indexF)],
                       pFlightPortFrom: flight.flightPortFrom[(indexF)],
                       pFlightPortTo: flight.flightPortTo[(indexF)],
                       pFlightDepartDate: flight.flightDepartDate[(indexF)],
                       pFlightDepartTime: flight.flightDepartTime[(indexF)],
                       pFlightReturnDate: flight.flightReturnDate[(indexF)],
                       pFlightReturnTime: flight.flightReturnTime[(indexF)],
                       pFlightCost: flight.flightCost[(indexF)],
                       pFlightType: flight.flightType[(indexF)],
                       pFlightDuration: flight.flightDuration[(indexF)],
                       existing: nil)
        }
       
        for (indexH, valueH) in hotel.hotelName.enumerated() {
            saveHotelToDB(pHotelName: (valueH),
                      pHotelCheckIn: hotel.hotelCheckIn[(indexH)],
                      pHotelCheckOut: hotel.hotelCheckOut[(indexH)],
                      pHotelCost: hotel.hotelCost[(indexH)],
                      pHotelAddress: hotel.hotelAddress[(indexH)],
                      pHotelroomType: hotel.roomType[(indexH)],
                      pHotelNotes: hotel.hotelNotes[(indexH)],
                      pHotelRating: Int16(hotel.hotelRating[(indexH)]),
                      existing: nil)
        }
        
        for (indexC, valueC) in restaurant.cafeName.enumerated() {
            saveCafeToDB(pCafeName: (valueC),
                     pCafeAddress: restaurant.cafeAddress[(indexC)],
                     pCafeType: restaurant.cafeType[(indexC)],
                     pCafeCost: restaurant.cafeCost[(indexC)],
                     pCafePax: restaurant.cafePax[(indexC)],
                     pCafeNotes: restaurant.cafeNotes[(indexC)],
                     pCafefoodItem1: restaurant.foodItem1[(indexC)],
                     pCafefoodItem2: restaurant.foodItem2[(indexC)],
                     pCafefoodItem3: restaurant.foodItem3[(indexC)],
                     pCafefoodItemSmiley1: restaurant.foodItemSmiley1[(indexC)],
                     pCafefoodItemSmiley2: restaurant.foodItemSmiley2[(indexC)],
                     pCafefoodItemSmiley3: restaurant.foodItemSmiley3[(indexC)],
                     pCafeRating: Int16(restaurant.cafeRating[(indexC)]),
                     existing: nil)
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
    
    mutating func clearEmptyData() {
        var i = -1
        for string in locationName {
            i = i + 1
            if (string == "") {
                deleteArray(i)
            }
        }
    }
    
    mutating func clearDBofItem() {
        
        if (debugMode) {
            print ("dbTrip [del i]: " + String(dbTrip.count))
            print ("dbFlight [del i]: " + String(dbFlight.count))
            print ("dbHotal [del i]: " + String(dbHotel.count))
            print ("dbCafe [del i]: " + String(dbCafe.count))
        }

        managedContext.delete(dCurrentTrip)
        updateDatabase()
       
        managedContext.delete(dCurrentFlight)
        updateDatabase()
        
        managedContext.delete(dCurrentHotel)
        updateDatabase()
        
        managedContext.delete(dCurrentCafe)
        updateDatabase()
        
        getTripFromCoreData()
        getFlightFromCoreData()
        getHotelFromCoreData()
        getCafeFromCoreData()
        loadDataFromCoreToArray()
        
        if (debugMode) {
            print ("dbTrip [del ii]: " + String(dbTrip.count))
            print ("dbFlight [del ii]: " + String(dbFlight.count))
            print ("dbHotal [del ii]: " + String(dbHotel.count))
            print ("dbCafe [del ii]: " + String(dbCafe.count))
        }
    }
    
    mutating func clearData() {
        
        locationName[myCurrentTrip] = ""
        locationDays[myCurrentTrip] = ""
        locationCost[myCurrentTrip] = ""

        
        flight.flightDepartNo[myCurrentTrip] = ""
        flight.flightReturnNo[myCurrentTrip] = ""
        flight.flightPortFrom[myCurrentTrip] = ""
        flight.flightPortTo[myCurrentTrip] = ""
        flight.flightDepartDate[myCurrentTrip] = ""
        flight.flightDepartTime[myCurrentTrip] = ""
        flight.flightReturnDate[myCurrentTrip] = ""
        flight.flightReturnTime[myCurrentTrip] = ""
        flight.flightCost[myCurrentTrip] = ""
        flight.flightType[myCurrentTrip] = ""
        flight.flightDuration[myCurrentTrip] = ""
        
        
        hotel.hotelName[myCurrentTrip] = ""
        hotel.hotelCheckIn[myCurrentTrip] = ""
        hotel.hotelCheckOut[myCurrentTrip] = ""
        hotel.hotelCost[myCurrentTrip] = ""
        hotel.hotelAddress[myCurrentTrip] = ""
        hotel.roomType[myCurrentTrip] = ""
        hotel.hotelNotes[myCurrentTrip] = ""
        hotel.hotelRating[myCurrentTrip] = 0
        
        restaurant.cafeName[myCurrentTrip] = ""
        restaurant.cafeAddress[myCurrentTrip] = ""
        restaurant.cafeType[myCurrentTrip] = ""
        restaurant.cafeCost[myCurrentTrip] = ""
        restaurant.cafePax[myCurrentTrip] = ""
        restaurant.cafeNotes[myCurrentTrip] = ""
        restaurant.foodItem1[myCurrentTrip] = ""
        restaurant.foodItem2[myCurrentTrip] = ""
        restaurant.foodItem3[myCurrentTrip] = ""
        restaurant.foodItemSmiley1[myCurrentTrip] = true
        restaurant.foodItemSmiley2[myCurrentTrip] = true
        restaurant.foodItemSmiley3[myCurrentTrip] = true
        restaurant.cafeRating[myCurrentTrip] = 0
    }
    
    mutating func deleteArray (_ i:Int) {
        // remove empty data
        locationName.remove(at: i)
        locationDays.remove(at: i)
        locationCost.remove(at: i)
        
        flight.flightDepartNo.remove(at: i)
        flight.flightReturnNo.remove(at: i)
        flight.flightPortFrom.remove(at: i)
        flight.flightPortTo.remove(at: i)
        flight.flightDepartDate.remove(at: i)
        flight.flightDepartTime.remove(at: i)
        flight.flightReturnDate.remove(at: i)
        flight.flightReturnTime.remove(at: i)
        flight.flightCost.remove(at: i)
        flight.flightType.remove(at: i)
        flight.flightDuration.remove(at: i)
        
        hotel.hotelName.remove(at: i)
        hotel.hotelCheckIn.remove(at: i)
        hotel.hotelCheckOut.remove(at: i)
        hotel.hotelCost.remove(at: i)
        hotel.hotelAddress.remove(at: i)
        hotel.roomType.remove(at: i)
        hotel.hotelNotes.remove(at: i)
        hotel.hotelRating.remove(at: i)
        
        restaurant.cafeName.remove(at: i)
        restaurant.cafeAddress.remove(at: i)
        restaurant.cafeType.remove(at: i)
        restaurant.cafeCost.remove(at: i)
        restaurant.cafePax.remove(at: i)
        restaurant.cafeNotes.remove(at: i)
        restaurant.foodItem1.remove(at: i)
        restaurant.foodItem2.remove(at: i)
        restaurant.foodItem3.remove(at: i)
        restaurant.foodItemSmiley1.remove(at: i)
        restaurant.foodItemSmiley2.remove(at: i)
        restaurant.foodItemSmiley3.remove(at: i)
        restaurant.cafeRating.remove(at: i)
    }

    mutating func deleteDataFromDB(_ eName:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: eName)
        fetchRequest.includesPropertyValues = false
        
        do { let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            for item in items {
                managedContext.delete(item)
            }
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not delete all \(eName) \(error), \(error.userInfo)")
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
        dbTrip.removeAll()
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
        dbFlight.removeAll()
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
        dbHotel.removeAll()
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
        dbCafe.removeAll()
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DBCafe")
            let results = try managedContext.fetch(fetchRequest)
            dbCafe = results as! [DBCafe]
        }
        catch let error as NSError {
            print("Could not fetch cafe info: \(error), \(error.userInfo)")
        }
    }
    
    mutating func saveTripToDB(
        pLocationName: String,
        pLocationDay: String,
        pLocationCost: String,
        existing: DBTrip?) {
        
        let entity = NSEntityDescription.entity(forEntityName: "DBTrip", in: managedContext)
        
        if let _ = existing {
            existing!.dbLocationName = pLocationName
            existing!.dbLocationDays = pLocationDay
            existing!.dbLocationCost = pLocationCost
           
            if (debugMode) {
                print ("Saving to DB (i): " + pLocationName)
            }
        }
        else {
            let vacation = NSManagedObject(entity: entity!, insertInto: managedContext) as! DBTrip
            vacation.setValue(pLocationName, forKey: "dbLocationName")
            vacation.setValue(pLocationDay, forKey: "dbLocationDays")
            vacation.setValue(pLocationCost, forKey: "dbLocationCost")
            dbTrip.append(vacation)
            if (debugMode) {
                print ("Saving to DB (ii): " + pLocationName)
            }
        }
        updateDatabase()
    }
    
    mutating func saveFlightToDB(
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

    mutating func saveHotelToDB(
        pHotelName: String,
        pHotelCheckIn: String,
        pHotelCheckOut: String,
        pHotelCost: String,
        pHotelAddress: String,
        pHotelroomType: String,
        pHotelNotes: String,
        pHotelRating: Int16,
        existing: DBHotel?) {
        
        let entity = NSEntityDescription.entity(forEntityName: "DBHotel", in: managedContext)
        
        if let _ = existing {
            existing!.dbHotelName = pHotelName
            existing!.dbHotelCheckIn = pHotelCheckIn
            existing!.dbHotelCheckOut = pHotelCheckOut
            existing!.dbHotelCost = pHotelCost
            existing!.dbHotelAddress = pHotelAddress
            existing!.dbHotelroomType = pHotelroomType
            existing!.dbHotelNotes = pHotelNotes
            existing!.dbHotelRating = pHotelRating
            
        }
        else {
            let hotel = NSManagedObject(entity: entity!, insertInto: managedContext) as! DBHotel
            hotel.setValue(pHotelName, forKey: "dbHotelName")
            hotel.setValue(pHotelCheckIn, forKey: "dbHotelCheckIn")
            hotel.setValue(pHotelCheckOut, forKey: "dbHotelCheckOut")
            hotel.setValue(pHotelCost, forKey: "dbHotelCost")
            hotel.setValue(pHotelAddress, forKey: "dbHotelAddress")
            hotel.setValue(pHotelroomType, forKey: "dbHotelroomType")
            hotel.setValue(pHotelNotes, forKey: "dbHotelNotes")
            hotel.setValue(pHotelRating, forKey: "dbHotelRating")
            
            dbHotel.append(hotel)
        }
        updateDatabase()
    }
    
    
    mutating func saveCafeToDB(
        
        pCafeName: String,
        pCafeAddress: String,
        pCafeType: String,
        pCafeCost: String,
        pCafePax: String,
        pCafeNotes: String,
        pCafefoodItem1: String,
        pCafefoodItem2: String,
        pCafefoodItem3: String,
        pCafefoodItemSmiley1: Bool,
        pCafefoodItemSmiley2: Bool,
        pCafefoodItemSmiley3: Bool,
        pCafeRating: Int16,
        existing: DBCafe?) {
        
        let entity = NSEntityDescription.entity(forEntityName: "DBCafe", in: managedContext)
        
        if let _ = existing {
            
            existing!.dbCafeName = pCafeName
            existing!.dbCafeAddress = pCafeAddress
            existing!.dbCafeType = pCafeType
            existing!.dbCafeCost = pCafeCost
            existing!.dbCafePax = pCafePax
            existing!.dbCafeNotes = pCafeNotes
            existing!.dbCafefoodItem1 = pCafefoodItem1
            existing!.dbCafefoodItem2 = pCafefoodItem2
            existing!.dbCafefoodItem3 = pCafefoodItem3
            existing!.dbCafefoodItemSmiley1 = pCafefoodItemSmiley1
            existing!.dbCafefoodItemSmiley2 = pCafefoodItemSmiley2
            existing!.dbCafefoodItemSmiley3 = pCafefoodItemSmiley3
            existing!.dbCafeRating = pCafeRating
        }
        else {
            let cafe = NSManagedObject(entity: entity!, insertInto: managedContext) as! DBCafe
            cafe.setValue(pCafeName, forKey: "dbCafeName")
            cafe.setValue(pCafeAddress, forKey: "dbCafeAddress")
            cafe.setValue(pCafeType, forKey: "dbCafeType")
            cafe.setValue(pCafeCost, forKey: "dbCafeCost")
            cafe.setValue(pCafePax, forKey: "dbCafePax")
            cafe.setValue(pCafeNotes, forKey: "dbCafeNotes")
            cafe.setValue(pCafefoodItem1, forKey: "dbCafefoodItem1")
            cafe.setValue(pCafefoodItem2, forKey: "dbCafefoodItem2")
            cafe.setValue(pCafefoodItem3, forKey: "dbCafefoodItem3")
            cafe.setValue(pCafefoodItemSmiley1, forKey: "dbCafefoodItemSmiley1")
            cafe.setValue(pCafefoodItemSmiley2, forKey: "dbCafefoodItemSmiley2")
            cafe.setValue(pCafefoodItemSmiley3, forKey: "dbCafefoodItemSmiley3")
            cafe.setValue(pCafeRating, forKey: "dbCafeRating")
            
            dbCafe.append(cafe)
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
    
    mutating func loadDatafromArrayforTesting() {
        locationName.append(contentsOf: ["LONDON, ENGLAND", "NEW YORK, USA", "PARIS, FRANCE", "MEBOURNE, AUSTRALIA"])
        locationDays.append(contentsOf: ["10 Days", "11 Days", "14 Days", "5 Days"])
        locationCost.append(contentsOf: ["$5,000" , "$7,000", "$8,000", "$500"])

        flight.flightDepartNo.append(
            contentsOf: ["BA 101", "PANAM 202", "AIR FRANCE 303", "VIRGIN 404"])
        flight.flightReturnNo.append(
            contentsOf: ["BA 102", "PANAM 203", "AIR FRANCE 304", "VIRGIN 405"])
        flight.flightPortFrom.append(
            contentsOf: ["MEL", "MEL", "MEL" , "SYD"])
        flight.flightPortTo.append(
            contentsOf: ["LDN", "NYC", "PAR" , "MEL"])
        flight.flightDepartDate.append(
            contentsOf: ["15 May 2018", "14 Feb 2018", "4 Aug 2018" , "7 Oct 2018"])
        flight.flightDepartTime.append(
            contentsOf: ["10:00" , "12:00", "06:00", "12:00"])
        flight.flightReturnDate.append(
            contentsOf: ["25 May 2018", "24 Feb 2018", "18 Aug 2018" , "12 Oct 2018"])
        flight.flightReturnTime.append(
            contentsOf: ["21:00" , "13:00", "05:00", "19:00"])
        flight.flightCost.append(
            contentsOf: ["$3,000", "$5,000", "$6,000", "$300"])
        flight.flightType.append(
            contentsOf: ["Return","Single","Return","Domestic"])
        flight.flightDuration.append(
            contentsOf: ["14 hrs", "12 hrs", "12 hrs", "3 hrs"])

        hotel.hotelName.append(
            contentsOf:  ["Park Plaza Westminster Bridge Hotel",
                          "The Empire Hotel",
                          "Hôtel Europe St Severin",
                          "Batman Apartments"])
        hotel.hotelCheckIn.append(
            contentsOf: ["15 May 2018", "14 Feb 2018", "4 Aug 2018" , "7 Oct 2018"])
        hotel.hotelCheckOut.append(
            contentsOf: ["25 May 2018", "21 Feb 2018", "8 Aug 2018" , "11 Oct 2018"])
        hotel.roomType.append(
            contentsOf: ["Deluxe" , "Single", "Triple" , "Suite"])
        hotel.hotelCost.append(
            contentsOf: ["$200", "$90", "$120", "$150"])
        hotel.hotelAddress.append(
            contentsOf: ["200 Westminster Bridge Road, SE1 7UT, London, United Kingdom",
                         "44 West 63rd Street, 10023, New York, USA",
                         "38-40, rue St Séverin, Paris 75005, France",
                         "53 Gaffney Street, Coburg 3058, Victoria, Australia"])
        hotel.hotelNotes.append(
            contentsOf: ["Stay at at Westminster Bridge Hotel to experience British hospitality",
                         "Welcome to Empire Hotel, minutes away from the Statue of Liberty" ,
                         "Europe St Severin - made for the creative and inspired" ,
                         "Batman Apartments - Right at the doorstep of ..."])
        hotel.hotelRating.append(
            contentsOf:[1,2,3,4])
        
        restaurant.cafeName.append(
            contentsOf:  ["Fischers", "Eleven Madison Park", "Le Cinq", "McDonalds"])
        restaurant.cafeAddress.append(
            contentsOf:  ["19 Fulham High St, Fulham, London SW6 3JH, UK",
                          "11 Madison Ave, New York, NY 10010, USA",
                          "31 Avenue George V, 75008 Paris, France",
                          "284/310 Lonsdale St, Melbourne VIC 3000, Australia"])
        restaurant.cafeType.append(
            contentsOf:  ["Fish & Chips",
                          "Fine Dining",
                          "Gourmet, Michelin" ,
                          "American, Fast Food"])
        restaurant.cafeCost.append(
            contentsOf:  ["$100", "$50", "$45", "$10"])
        restaurant.cafePax.append(
            contentsOf:  ["5", "3", "1", "2"])
        restaurant.cafeNotes.append(
            contentsOf:  [
                "It is good! The staff were friendly and very attentive. Very polite and professional in their service.",
                "Service was very quick. Student deals are available so bring your student card for a $7 spud!",
                "Bon Appetit. Good food but the price was a bit high for just chicken. Really enjoyed it tho!",
                "Can't go wrong with Maccas, best with fries and sundae."])
        restaurant.foodItem1.append(
            contentsOf:  ["Snail","Steak","Un Chicken Finger","Burger"])
        restaurant.foodItem2.append(
            contentsOf:  ["Quail","Wedges","Le Petit Coke","Coke"])
        restaurant.foodItem3.append(
            contentsOf:  ["Ale","Beer","Frites","Fries"])
        restaurant.foodItemSmiley1.append(
            contentsOf:  [true, true, true, true])
        restaurant.foodItemSmiley2.append(
            contentsOf:  [true, true, true, true])
        restaurant.foodItemSmiley3.append(
            contentsOf:  [true, true, true, true])
        restaurant.cafeRating.append(
            contentsOf:  [1,2,3,4])

    }
}



