//
//  WeatherViewModel.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-10.
//

import Foundation
import SwiftUI
import CoreLocation
// API KEY -> "dc7553a3d26141f18e6201809241011"
class WeatherViewModel: ObservableObject{
    @Published var weatherInfo : [GeneralWeather] = []
    @Published var locationInfo : [Location] = []
    @Published var errorMessage: String? = nil
    @Published var showError = false
    private let lm = LocationManager()
    
    //API/URL Info
    let apiKey = "key=dc7553a3d26141f18e6201809241011&"
    let baseUrl = "https://api.weatherapi.com/v1/current.json?"
    
    
    func getGeneralWeatherResponse() async{
        guard let latitude = lm.latitude,
              let longitude = lm.longitude else{
            errorMessage = "Location unavailable"
            showError = true
            return
        }
        
        let urlStr = baseUrl + apiKey + ("q=\(String(lm.latitude!)),\(String(lm.longitude!))&aqi=yes")
        print("WeatherViewModel getGeneralWeatherResponse(): URL -> \(urlStr)")
        let url = URL(string: urlStr)
        guard let url = URL(string: urlStr) else{
            errorMessage = "Invalid URL"
            showError = true
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let info = try JSONDecoder().decode([GeneralWeather].self, from: data)
            
            DispatchQueue.main.async {
                self.weatherInfo = info
            }
        } catch {
                    errorMessage = "Failed to fetch weather data: \(error.localizedDescription)"
                    showError = true
                }
        }
}
