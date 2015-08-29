//
//  ViewController.swift
//  SafariTrack
//
//  Created by Sean McMains on 8/29/15.
//  Copyright © 2015 McMains. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var noServicesContainerView: UIView!
    
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView.setRegion(MapRegions.entireSafariRegion(), animated: false)
        self.registerForNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    
    @IBAction func didTapSettings(sender: UIButton) {
        if let url = NSURL( string: UIApplicationOpenSettingsURLString ) {
            UIApplication.sharedApplication().openURL( url )
        }
    }
    
    // MARK: Supporting Methods
    
    func registerForNotifications() {
        self.notificationCenter.addObserver(self, selector: "locationAccessWasGranted", name: NotificationIdentifier.LocationAuthorized.rawValue, object: nil)
        self.notificationCenter.addObserver(self, selector: "locationAccessWasDenied", name: NotificationIdentifier.LocationDenied.rawValue, object: nil)
        
    }
    
    // MARK: Respond to notifications
    
    func locationAccessWasGranted() {
        self.noServicesContainerView.hidden = true
        self.mapView.showsUserLocation = true
    }
    
    func locationAccessWasDenied() {
        self.noServicesContainerView.hidden = false
        self.mapView.showsUserLocation = false
    }


}

