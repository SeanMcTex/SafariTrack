//
//  LocationManager.swift
//  SafariTrack
//
//  Created by Sean McMains on 8/29/15.
//  Copyright © 2015 McMains. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let sharedInstance = LocationManager()
    
    let locationManager = CLLocationManager()
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    func setUpCoreLocation() {
        self.locationManager.delegate = self
        
        self.locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedAlways:
            self.notificationCenter.postNotificationName(NotificationIdentifier.LocationAuthorized.rawValue,object: nil)
        case .Denied:
            self.notificationCenter.postNotificationName(NotificationIdentifier.LocationDenied.rawValue,object: nil)
        default:
            break
        }
    }
}