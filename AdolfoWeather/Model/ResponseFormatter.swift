//
//  ResponseFormatter.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-10.
//
import Foundation
struct GeneralWeather: Codable{
    let feelsLike: Double
    let windKph: Double
    let windDir: String
    let humidity: Int
    let uv: Double
    let visKm: Double
}
struct Location: Codable{
    let name: String
    let region: String
    let lat: Double
    let lon: Double
}
struct Current: Codable{
    let lastUpdated: String
    let tempC: Double
    let isDay: Bool
    let condition: Condition
}
struct Condition: Codable{
    let text: String
    let icon: String
}

