//
//  ContentView.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-07.
//

import SwiftUI

struct ContentView: View {
//    @State private var temp_c: String = "hello"
//    @State private var feelslike_c: String = ""
//    @State private var wind_kph: String = ""
//    @State private var wind_dir: String = ""
//    @State private var humidity: String = ""
//    @State private var uv: String = ""
//    @State private var vis_km: String = ""
//    @State private var condition: String = ""
//    @State private var city_name: String = ""
//    @State private var country_name: String = ""
    @StateObject private var vm = WeatherViewModel()

    var body: some View {
        NavigationStack{
            VStack {
                Button(
                    action: {
                        print("Button Pressed")
                        Task{
                            do{
                                try await
                                vm.getGeneralWeatherResponse()
                            }catch {
                                
                                print("Button Pressed: Error \(error)")
                            }
                        }
                        
                    },
                    label: {
                        Text("Retrieve Weather").font(.headline).foregroundStyle(.white)
                    }).padding(.all).background(Color(.blue)).clipShape(.capsule)
                List{
                    Section("Tempature Data:"){
                        
                        
                        
                    }
                    Section("Location Data"){
                        
                    }
                    
                }.listStyle(.automatic).clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 50, topTrailing: 50))).ignoresSafeArea()
                
            }.navigationTitle("Adolfo Weather")
            
        }
    }
}

#Preview {
    ContentView().environmentObject(WeatherViewModel())
}
