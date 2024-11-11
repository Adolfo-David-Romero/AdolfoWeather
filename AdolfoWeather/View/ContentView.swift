//
//  ContentView.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = WeatherViewModel()
    let lm = LocationManager()
    
    var body: some View {
        NavigationStack{
            VStack {
                Button(
                    action: {
                        lm.startUpdatingLocation()
                        print("Started Location Updates")
                        vm.fetchWeatherData(latitude: lm.latitude!, longitude: lm.longitude!)
                    },
                    label: {
                        Text("Retrieve Weather").font(.headline).foregroundStyle(.white)
                    }).padding(.all).background(Color(.blue)).clipShape(.capsule)
                List {
                    if let errorMessage = vm.errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                    } else {
                        ForEach(vm.weatherDataList, id: \.location.name) { weather in
                            Section("Weather Data:") {
                                AsyncImage(url: URL(string: "https:" + weather.current.condition.icon))
                                    .padding(.all)
                                ResponseComponentRowView(title: "Temperature (°C)", response: "\(weather.current.tempC)")
                                ResponseComponentRowView(title: "Feels Like (°C)", response: "\(weather.current.feelslikeC)")
                                ResponseComponentRowView(title: "Humidity", response: "\(weather.current.humidity)%")
                                ResponseComponentRowView(title: "Wind Speed (kph)", response: "\(weather.current.windKph)")
                                ResponseComponentRowView(title: "City", response: weather.location.name)
                                ResponseComponentRowView(title: "Region", response: weather.location.region)
                                ResponseComponentRowView(title: "Country", response: weather.location.country)
                                ResponseComponentRowView(title: "Local Time", response: weather.location.localtime)
                                
                            }
                        }
                        
                    }
                    
                }.listStyle(.automatic).clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 50, topTrailing: 50))).ignoresSafeArea()
                
            }.navigationTitle("Adolfo Weather")
            
        }
    }
}

#Preview {
    ContentView().environmentObject(WeatherViewModel())
}
