//
//  WeatherViewModel.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-10.
//

import Foundation
import SwiftUI
// API KEY -> "dc7553a3d26141f18e6201809241011"
class WeatherViewModel: ObservableObject{
    @StateObject var locationManager = LocationManager()
    @Published var weatherInfo : [GeneralWeather] = []
    @Published var locationInfo : [Location] = []
    @Published var showError = false
    
    //API/URL Info
    let apiKey = "key=dc7553a3d26141f18e6201809241011&"
    let baseUrl = "https://api.weatherapi.com/v1/current.json?"
    
    func getGeneralWeatherResponse (userCoordinate: String) async throws{
        let urlStr = baseUrl + apiKey + ("q=\(userCoordinate)&aqi=yes")
        print("WeatherViewModel: URL -> \(urlStr)")
        let url = URL(string: urlStr)
        
        let task = URLSession.shared.dataTask(with: url!){ data, response, error in
            
            guard error  == nil  else{
                
                print("WeatherViewModel getGeneralWeather(): ERROR -> \(String(describing: error))")
                return
            }
            
            guard let data = data else {
                print("WeatherViewModel getGeneralWeather(): ERROR data not found")
                return
            }
            
            do {
                
                let info = try JSONDecoder().decode([GeneralWeather].self, from: data)
                print(info.count)
                DispatchQueue.main.async {
                    self.weatherInfo = info
                }
                
            }catch {
                
                print("WeatherViewModel getGeneralWeather(): ERROR -> \(error)")
            }
        }
        
        task.resume()
    }
    
    func getLocationResponse() async throws {
        
//        let urlStr = baseUrl+"users"
//        print(urlStr)
//        let url = URL(string: urlStr)!
//        
//        let (data, _) =  try await URLSession.shared.data(for: URLRequest(url:url))
//        
//        let result = try JSONDecoder().decode([User].self, from: data)
//        print(result.count)
//        DispatchQueue.main.async {
//            self.users = result
//        }
    }
}
