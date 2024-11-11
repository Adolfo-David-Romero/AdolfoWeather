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
    @Published var latitude: Double? = nil
    @Published var longitude: Double? = nil
    @Published var errorMessage: String? = nil
    
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
            errorMessage = "Location Manager: Failed to retrieve location"
            return
        }
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
        print("Location Manager: Latitude -> \(String(describing: latitude)), Longitude -> \(String(describing: longitude))")
        locationManager.stopUpdatingLocation()
    }
    
    //hanling error on fail
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
         errorMessage = "Location Manager error: \(error.localizedDescription)"
    }
    
    //Manage permission changes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
            case .authorizedWhenInUse, .authorizedAlways:
                print("Location Manager: Authorized")
                startUpdatingLocation()
                break
            case .denied, .restricted:
                errorMessage = "Location Manager: Location access denied. Please enable location permissions in settings."
            default:
                break
            }
    }
    
}
