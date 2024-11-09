//
//  LocationManager.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-08.
//
import Foundation
import MapKit
class LocationManager : NSObject , ObservableObject , CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    
    override init() {
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
    
    
}
