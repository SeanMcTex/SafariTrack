//
//  DatabaseManager.swift
//  SafariTrack
//
//  Created by Sean McMains on 8/29/15.
//  Copyright © 2015 McMains. All rights reserved.
//

import Foundation

class DatabaseManager: NSObject {
    static let sharedInstance = DatabaseManager()
    
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    override init() {
        super.init()
        self.registerForNotifications()
    }
    
    func registerForNotifications() {
        self.notificationCenter.addObserver( self, selector: "receivedLocationNotification:", name: NotificationIdentifier.RecievedLocation.rawValue, object: nil )
    }
    
    // MARK: Respond to notifications
    func receivedLocationNotification( notification: NSNotification ) {
        print( notification.object! )
    }
}
