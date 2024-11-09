//
//  LocationManager.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-08.
//
import Foundation
import CoreLocation

class LocationManager : NSObject , ObservableObject , CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    
    override init() {
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
            locationManager.startUpdatingLocation()
    }
    
    //manage location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{
            print("Location Manager: error")
            return
        }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        print("Location Manager:")
        print("Latitude: \(latitude), Longitude: \(longitude)")
        locationManager.stopUpdatingLocation()
    }
    
    //hanling error on fail
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location Manager: error \(error)")
    }
    
    //Manage permission changes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
            case .authorizedWhenInUse, .authorizedAlways:
                print("Location Manager: authorized ")
                locationManager.startUpdatingLocation()
                break
            case .denied, .restricted:
                print("Location Manager: Location access N/A.")
            default:
                break
            }
    }
    
}
