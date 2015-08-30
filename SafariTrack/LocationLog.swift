//
//  LocationLog.swift
//  SafariTrack
//
//  Created by Sean McMains on 8/29/15.
//  Copyright © 2015 McMains. All rights reserved.
//

import Foundation

enum PowerState {
    case Unplugged
    case Charging
    case Full
    case Unknown
}

class LocationLog {
    let latitude: Double
    let longitude: Double
    let accuracy: Double
    let epoch: Double
    let userId: String
    let batteryCharge: Int
    let batteryStatus: PowerState
    
    init ( latitude: Double, longitude: Double, accuracy: Double, epoch: Double, userId: String, batteryCharge: Int, batteryStatus: PowerState ) {
        self.latitude = latitude
        self.longitude = longitude
        self.accuracy = accuracy
        self.epoch = epoch
        self.userId = userId
        self.batteryCharge = batteryCharge
        self.batteryStatus = batteryStatus
    }
    
    
}