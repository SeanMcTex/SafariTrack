//
//  MapRegions.swift
//  SafariTrack
//
//  Created by Sean McMains on 8/29/15.
//  Copyright © 2015 McMains. All rights reserved.
//

import Foundation
import MapKit

struct MapRegions {
    static func entireSafariRegion() -> MKCoordinateRegion {
        let mapCenter = CLLocationCoordinate2D(latitude: 29.164728, longitude: -97.448005)
        let coordinateSpan = MKCoordinateSpanMake(2.5, 2.5)
        let coordinateRegion = MKCoordinateRegion(center: mapCenter, span: coordinateSpan)
        return coordinateRegion
    }
}