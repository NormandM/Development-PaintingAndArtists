//
//  Coordinate.swift
//  FiveDaysWeatherForeCast
//
//  Created by Normand Martin on 17-06-24.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import CoreLocation

struct Coordinate {
    func findUserLocation() -> String {
        let locManager = CLLocationManager()
        var latitude: Double = 0
        var longitude: Double = 0
        
        locManager.requestWhenInUseAuthorization()
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            
            if let currentLocation = locManager.location {
                latitude = currentLocation.coordinate.latitude
                longitude = currentLocation.coordinate.longitude
            }else{
                //let error = DarkSkyError.couldNotguetCoordinates
                latitude = 46.8138
                longitude = -71.2079
            }
            
        }
        return "\(latitude),\(longitude)?lang=fr&units=si"
    }
}
