//
//  LocationManager.swift
//  SafariTrack
//
//  Created by Sean McMains on 8/29/15.
//  Copyright © 2015 McMains. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let sharedInstance = LocationManager()
    
    let locationManager = CLLocationManager()
    let notificationCenter = NSNotificationCenter.defaultCenter()
    let device = UIDevice.currentDevice() // Note: not totally convinced this is the right place for UIKit stuff
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        
        self.device.batteryMonitoringEnabled = true
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedAlways:
            self.notificationCenter.postNotificationName(NotificationIdentifier.LocationAuthorized.rawValue,object: nil)
            self.locationManager.startUpdatingLocation()
        case .Denied:
            self.notificationCenter.postNotificationName(NotificationIdentifier.LocationDenied.rawValue,object: nil)
            self.locationManager.stopUpdatingLocation()
        default:
            break
        }
    }
    
    //MARK: Location Manager Delegate Methods
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let powerState: PowerState
        switch ( self.device.batteryState ) {
        case .Charging:
            powerState = .Charging
        case .Full:
            powerState = .Full
        case .Unplugged:
            powerState = .Unplugged
        case .Unknown:
            powerState = .Unknown
        }
        
        for location in locations {
            let log = LocationLog(latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude,
                accuracy: location.horizontalAccuracy,
                epoch: location.timestamp.timeIntervalSince1970,
                userId: "testUser",
                batteryCharge: Int( self.device.batteryLevel * 100.0 ),
                batteryStatus: powerState
        )
        
            self.notificationCenter.postNotificationName(NotificationIdentifier.RecievedLocation.rawValue, object: log)
        }
    }
}