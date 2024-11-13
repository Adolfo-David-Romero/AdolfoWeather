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
    let geocoder = CLGeocoder() // using reverse geocoding only for the .onChange, to know if i left the area
    @Published var latitude: Double? = nil
    @Published var longitude: Double? = nil
    @Published var area: String? = nil
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
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        
    }
    
    //manage location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{
            errorMessage = "Location Manager: Failed to retrieve location"
            return
        }
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
        
        // Perform reverse geocoding to get area name
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let error = error {
                self?.errorMessage = "Geocoding error: \(error.localizedDescription)"
            } else if let placemark = placemarks?.first {
                self?.area = placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country
            }
        }
        
        print("Location Manager: Area -> \(String(describing: area)) Latitude -> \(String(describing: latitude)), Longitude -> \(String(describing: longitude))")
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
