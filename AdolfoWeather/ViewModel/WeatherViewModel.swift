//
//  WeatherViewModel.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-10.
//

import Foundation
import SwiftUI
import CoreLocation

class WeatherViewModel: ObservableObject{
    @Published var weatherDataList: [WeatherModel] = []
    @Published var currentLink: URL?
    @Published var errorMessage: String?
    
    //API/URL Info
    let apiKey = "dc7553a3d26141f18e6201809241011"
    let baseUrl = "https://api.weatherapi.com/v1/current.json"
    
    
    func fetchWeatherData(latitude: Double, longitude: Double) {
        weatherDataList = [] // Clear the current list to avoid duplication
        
        // Construct the URL string to match the exact format
        let urlStr = "\(baseUrl)?key=\(apiKey)&q=\(latitude),\(longitude)&aqi=yes"
        guard let url = URL(string: urlStr) else {
            DispatchQueue.main.async {
                self.errorMessage = "Invalid URL"
            }
            return
        }
        currentLink = url
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Error: \(error.localizedDescription)"
                }
                return
            }
            // Check if response is a valid HTTPURLResponse and log the status code
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
                if response.statusCode != 200 {
                    DispatchQueue.main.async {
                        self.errorMessage = "Invalid response: Status Code \(response.statusCode)"
                    }
                    return
                }
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received from server."
                }
                return
            }
            
            //For debugging
            if let rawResponse = String(data: data, encoding: .utf8) {
                print("Raw Response: \(rawResponse)")
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.weatherDataList.append(weather)
                    self.errorMessage = nil
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
