//
//  HotelDetailsController.swift
//  TravMate
//
//  Created by Rudi Basiran on 14/9/18.
//  - Wan Yi Beh
//  - John Michael Ariola Tubera
//  Copyright © 2018 RMIT. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class HotelDetailsController: UIViewController {
  
    
    @IBOutlet weak var hotelRating: HotelRatingController!
    
    @IBOutlet weak var hotelNotes: UITextView!
    
    @IBOutlet weak var roomType: UITextField!
    
    @IBOutlet weak var hotelName: UITextField!
    
    @IBOutlet weak var checkInDate: UITextField!
    
    @IBOutlet weak var checkOutDate: UITextField!
    
    @IBOutlet weak var hotelCost: UITextField!
    
    @IBOutlet weak var hiddenHotelCost: UITextField!
    
    @IBOutlet weak var hiddenRoomType: UITextField!
    
    @IBOutlet weak var hotelAddress: UITextField!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func saveHotel(_ sender: Any) {
        
        let alert = UIAlertController(title: "HOTEL", message: "Save Data?", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            Trip.sharedInstance.saveHotel(
                tHotelName: self.hotelName.text!,
                tHotelCheckIn: self.checkInDate.text!,
                tHotelCheckOut: self.checkOutDate.text!,
                tHotelCost: self.hotelCost.text!,
                tHotelAddress: self.hotelAddress.text!,
                tHotelroomType: self.roomType.text!,
                tHotelNotes: self.hotelNotes.text!,
                tHotelRating: Int16(self.hotelRating.starsRating))
            
            
            
        })
        
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (_)in
            
            self.do_load ()
            
        })
        
        alert.addAction(CancelAction)
        alert.addAction(OKAction)
        
        self.present(alert, animated: true, completion: nil)

        
    }
    
    @IBAction func hotelShare(_ sender: Any) {
        print("Share image")
        
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let activityViewController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true, completion: nil)
    }
    
    func do_load () {
        let hotelData = Trip.sharedInstance.geHotel()
        let i = Trip.sharedInstance.myCurrentTrip
        
        if (Trip.sharedInstance.myCurrentTrip >= 0) {
            hotelName.text = hotelData.hotelName[i]
            checkInDate.text = hotelData.hotelCheckIn[i]
            checkOutDate.text = hotelData.hotelCheckOut[i]
            hotelCost.text = hotelData.hotelCost[i]
            hotelAddress.text = hotelData.hotelAddress[i]
            roomType.text = hotelData.roomType[i]
            hotelNotes.text = hotelData.hotelNotes[i]
            
            hiddenHotelCost.text = hotelData.hotelCost[i]
            hiddenRoomType.text = hotelData.roomType[i]
            
        }
    }
    
    
    func searchForLocation () {
        
        // Create a Coordinate Locator
        let geoCoder = CLGeocoder()
        var coords: CLLocationCoordinate2D?
        
        // Determine the zoom level of the map to display
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        geoCoder.geocodeAddressString (hotelAddress.text!, completionHandler: {(placemarks: [ CLPlacemark]?, error: Error?) -> Void in
            if let placemark = placemarks?[0]
            {
                // Convert the address to a coordinate
                let location = placemark.location
                coords = location!.coordinate
                
                // Set the map to the coordinate
                let region = MKCoordinateRegion (center: coords!, span: span)
                self.mapView.region = region
                
                // Add a pin to the address location
                self.mapView.addAnnotation( MKPlacemark (placemark: placemark))
            }
        })
        
    }
    fileprivate let locationManager = CLLocationManager()
    fileprivate var previousPoint: CLLocation?
    // How far do you move (in meters) before you receive an update.
    fileprivate var totalMovementDistance = CLLocationDistance(0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.do_load()
        Trip.sharedInstance.myCurrentTab = TripTabController.hotel
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // how often do you want to receive updates.
        locationManager.distanceFilter = 50
        
        if (hotelAddress.text != "") {
            searchForLocation()
        }
   
        
    }
}


extension HotelDetailsController: CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        print ( "Authorization status changed to \(status.rawValue) ")
        switch status
        {
        case .authorizedAlways, . authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            
        default:
            locationManager.stopUpdatingLocation()
            mapView.showsUserLocation = false
        }
    }
}
