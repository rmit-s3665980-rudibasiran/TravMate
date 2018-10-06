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
    var startFromScratch = true // change to true to init; false to test persistent data
    var myCurrentTrip = 0
    var myCurrentTab = TripTabController.flight
    var useCoreData = false
    
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
    
  
    init() {
        myCurrentTrip = -1
        managedContext = appDelegate.persistentContainer.viewContext
        
        if (debugMode) {
            print ("dbTrip [a]: " + String(dbTrip.count))
            print ("dbFlight [a]: " + String(dbFlight.count))
            print ("dbHotal [a]: " + String(dbHotel.count))
            print ("dbCafe [a]: " + String(dbCafe.count))
        }
  
        if (startFromScratch) {
            deleteDataFromDB("DBTrip")
            deleteDataFromDB("DBFlight")
            deleteDataFromDB("DBHotel")
            deleteDataFromDB("DBCafe")
            loadDatafromArrayforTesting()
            populateDBfromInitialArray()
            useCoreData = true
        }
        else {
            getTripFromCoreData()
            getFlightFromCoreData()
            getHotelFromCoreData()
            getCafeFromCoreData()
        }
        
        if (debugMode) {
            print ("dbTrip [b]: " + String(dbTrip.count))
            print ("dbFlight [b]: " + String(dbFlight.count))
            print ("dbHotal [b]: " + String(dbHotel.count))
            print ("dbCafe [b]: " + String(dbCafe.count))
        }
    }
    
    mutating func populateDBfromInitialArray() {
        for (index, value) in locationName.enumerated() {
            saveTrip(pLocationName: (value),
                     pLocationDay: locationDays[(index)],
                     pLocationCost: locationCost[(index)], existing: nil)
        }
   
        for (indexF, valueF) in flight.flightDepartNo.enumerated() {
            saveFlight(pFlightDepartNo: (valueF),
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
            saveHotel(pHotelName: (valueH),
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
            saveCafe(pCafeName: (valueC),
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

    mutating func saveHotel(
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
    
    
    mutating func saveCafe(
        
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
        print ("loading data 1")
        locationName.append(contentsOf: ["LONDON, ENGLAND", "NEW YORK, USA", "PARIS, FRANCE", "MEBOURNE, AUSTRALIA"])
        locationDays.append(contentsOf: ["10 Days", "11 Days", "14 Days", "5 Days"])
        locationCost.append(contentsOf: ["$5,000" , "$7,000", "$8,000", "$500"])
        
        print ("loading data 2")
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
        
        print ("loading data 3")
        hotel.hotelName.append(
            contentsOf:  ["Le Méridien", "IBIS NYC", "Crown Hotels", "Hays Apartment"])
        hotel.hotelCheckIn.append(
            contentsOf: ["15 May 2018", "14 Feb 2018", "4 Aug 2018" , "7 Oct 2018"])
        hotel.hotelCheckOut.append(
            contentsOf: ["25 May 2018", "21 Feb 2018", "8 Aug 2018" , "11 Oct 2018"])
        hotel.roomType.append(
            contentsOf: ["Deluxe" , "Single", "Triple" , "Suite"])
        hotel.hotelCost.append(
            contentsOf: ["$200", "$90", "$120", "$150"])
        hotel.hotelAddress.append(
            contentsOf: ["1 Cambridge Street", "2 Times Square", "3 Reu du Mar", "4 Hay Street"])
        hotel.hotelNotes.append(
            contentsOf: ["Stay at our chic Le Méridien made for the creative and inspired",
                         "Welcome to IBIS NYC!" ,
                         "Crown Hotels - a class of its own" ,
                         "Hays Apartment - Right at the doorstep of ..."])
        hotel.hotelRating.append(
            contentsOf:[1,2,3,4])
        
        print ("loading data 4")
        restaurant.cafeName.append(
            contentsOf:  ["Le Clec", "Spudbar", "Coup du Poullet", "McDonalds"])
        restaurant.cafeAddress.append(
            contentsOf:  ["727 Glenferrie Road", "36 Swanston Street", "45 Champ Elyse","2 Hay Street"])
        restaurant.cafeType.append(
            contentsOf:  ["Fusion, Coffee and Tea, Cafe Food",
                          "Healthy Food, Fast Food, Salad",
                          "French Nandos" ,
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
        print ("loading data 5")
    }
}



