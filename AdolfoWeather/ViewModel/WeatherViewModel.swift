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
    @Published var locationInfo : [Location] = []
    @Published var currentWeatherInfo : [Current] = []
    let lm = LocationManager()
    
    //API/URL Info
    let apiKey = "key=dc7553a3d26141f18e6201809241011&"
    let baseUrl = "https://api.weatherapi.com/v1/current.json?"
    
    
    func fetchWeatherData() async throws -> [WeatherModel]{
        //get Lat and Long values from user using location manager
        guard let latitude = lm.latitude,
              let longitude = lm.longitude else{
            throw ErrorCases.invalidCoordinates
        }
        
        let urlStr = "\(baseUrl)\(apiKey)q=\(latitude),\(longitude)&aqi=yes"
        guard let url = URL(string: urlStr) else{
            throw ErrorCases.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw ErrorCases.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            return try decoder.decode([WeatherModel].self, from: data)
        }catch{
            throw ErrorCases.invalidData
        }
        
    }
}
enum ErrorCases: LocalizedError{
    case invalidCoordinates
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String?{
        switch self{
        case .invalidCoordinates:
            return "Invalid User Coordinates"
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidData:
            return "Invalid Data"
        }
    }
}
