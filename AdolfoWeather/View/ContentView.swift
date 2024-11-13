//
//  ContentView.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = WeatherViewModel()
    @State private var buttonState: Bool = false
    @StateObject var lm = LocationManager()
    
    var body: some View {
        NavigationStack{
            VStack {
                Button(
                    action: {
                        buttonState.toggle() //toggles on and off
                        if(buttonState){
                            lm.startUpdatingLocation()
                            print("Started Location Updates")
                            vm.fetchWeatherData(latitude: lm.latitude!, longitude: lm.longitude!)
                            
                        }else{
                            lm.stopUpdatingLocation()
                            print("Stopped Location Updates")
                        }
                        
                    },
                    label: {
                        if(buttonState){
                            Text("Stop Weather Service").font(.headline).foregroundStyle(.white)
                        }else{
                            Text("Retrieve Weather").font(.headline).foregroundStyle(.white)
                        }
                       
                    }).padding(.all).background(Color(.blue)).clipShape(.capsule)
                List {
                    if let errorMessage = vm.errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                    } else {
                        //Display if button is pressed
                        if(buttonState){
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
                        }else{
                            //screeen cleared
                        }
                        
                    }
                    
                }.listStyle(.automatic).clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 50, topTrailing: 50))).ignoresSafeArea()
                    
                
            }.navigationTitle("Adolfo Weather")
                .onChange(of: lm.area){
                    /*When the location manager (using reverse geocoding) detects change in the local area, the .onChange will fetch new WeatherData*/
                    /*Using area instead of lat or long, avoids constant api calls, as user coordinates constantly change slghtly*/
                print("Location has changed, fetching new data")
                vm.fetchWeatherData(latitude: lm.latitude!, longitude: lm.longitude!)
                
            }
                
            
        }
    }
}

#Preview {
    ContentView().environmentObject(WeatherViewModel())
}
