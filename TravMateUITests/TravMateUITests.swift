//
//  TravMateUITests.swift
//  TravMateUITests
//
//  Created by Rudi Basiran on 16/9/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

import XCTest

class TravMateUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        let string = app.staticTexts.element(matching: .any, identifier: "TripName").textFields
        app.buttons["BtnDeleteTrip"].tap()
    }
    
    func testHotelDetails(){
        
        var HotelName: String?
        var HotelCheckIn: String?
        var HotelCheckOut: String?
        var HotelroomType: String?
        var HotelCost: String?
        var HotelAddress: String?
        var HotelNotes: String?
        var HotelRating: Int?
        
        XCTAssertNil(HotelName)
        XCTAssertNil(HotelCheckIn)
        XCTAssertNil(HotelCheckOut)
        XCTAssertNil(HotelroomType)
        XCTAssertNil(HotelCost)
        XCTAssertNil(HotelAddress)
        XCTAssertNil(HotelNotes)
        XCTAssertNil(HotelRating)
        
        HotelName = "Park Plaza West Minister Bridge Hotel"
        XCTAssertEqual(HotelName, "Park Plaza West Minister Bridge Hotel")
        
        HotelCheckIn = "15 May 2018"
        XCTAssertEqual(HotelCheckIn, "15 May 2018")
        
        HotelCheckOut = "25 May 2018"
        XCTAssertEqual(HotelCheckOut, "25 May 2018")
        
        HotelroomType = "Deluxe Suite"
        XCTAssertEqual(HotelroomType, "Deluxe Suite")
        
        HotelCost = "$300"
        XCTAssertEqual(HotelCost, "$300")
        
        HotelAddress = "200 Westminister London"
        XCTAssertEqual(HotelAddress, "200 Westminister London")
        
        HotelNotes = "Good location"
        XCTAssertEqual(HotelNotes, "Good location")
        
        HotelRating = 5
        XCTAssertEqual(HotelRating, 5)
        
    }
    
    func testRestaurantDetails(){
        
        var cafeName: String?
        var cafeAddress: String?
        var cafeType: String?
        var cafeCost: String?
        var cafePax: String?
        var cafeNotes: String?
        var foodItem1: String?
        var foodItem2: String?
        var foodItem3: String?
        var foodItemSmiley1: Bool?
        var foodItemSmiley2: Bool?
        var foodItemSmiley3: Bool?
        var cafeRating: Int?
        
        
        XCTAssertNil(cafeName)
        XCTAssertNil(cafeAddress)
        XCTAssertNil(cafeType)
        XCTAssertNil(cafeCost)
        XCTAssertNil(cafePax)
        XCTAssertNil(cafeNotes)
        XCTAssertNil(foodItem1)
        XCTAssertNil(foodItem2)
        XCTAssertNil(foodItem3)
        XCTAssertNil(foodItemSmiley1)
        XCTAssertNil(foodItemSmiley2)
        XCTAssertNil(foodItemSmiley3)
        XCTAssertNil(cafeRating)
        
        cafeName = "Le Clec"
        XCTAssertEqual(cafeName, "Le Clec")
        
        cafeAddress = "727 Glenferrie Road"
        XCTAssertEqual(cafeAddress, "727 Glenferrie Road")
        
        cafeType = "Fusion"
        XCTAssertEqual(cafeType, "Fusion")
        
        cafeCost = "$100"
        XCTAssertEqual(cafeCost, "$100")
        
        cafePax = "5"
        XCTAssertEqual(cafePax, "5")
        
        cafeNotes = "It is good, the staff was very friendly and attentive"
        XCTAssertEqual(cafeNotes, "It is good, the staff was very friendly and attentive")
        
        foodItem1 = "Grilled Chicken"
        XCTAssertEqual(foodItem1, "Grilled Chicken")
        
        foodItem2 = "Calamari"
        XCTAssertEqual(foodItem2, "Calamari")
        
        foodItem3 = "Beef Steak"
        XCTAssertEqual(foodItem3, "Beef Steak")
        
        foodItemSmiley1 = true
        XCTAssertEqual(foodItemSmiley1, true)
        
        foodItemSmiley2 = false
        XCTAssertEqual(foodItemSmiley2, false)
        
        foodItemSmiley3 = true
        XCTAssertEqual(foodItemSmiley3, true)
        
        cafeRating = 5
        XCTAssertEqual(cafeRating, 5)
        
        
    }
    
}
