//
//  ContentView.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = WeatherViewModel()

    var body: some View {
        NavigationStack{
            VStack {
                Button(
                    action: {
                        vm.lm.startUpdatingLocation()
                        print("Started Location Updates")
                        Task{
                            try await vm.fetchWeatherData()
                            print("Fetching weather data...")
                        }
                    },
                    label: {
                        Text("Retrieve Weather").font(.headline).foregroundStyle(.white)
                    }).padding(.all).background(Color(.blue)).clipShape(.capsule)
                List{
                    Section("Temperature Data") {
                        
                    }
                    
                    
                    Section("Location Data") {
                        
                    }
                    
                }.listStyle(.automatic).clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 50, topTrailing: 50))).ignoresSafeArea()
                
            }.navigationTitle("Adolfo Weather")
            
        }
    }
}

#Preview {
    ContentView().environmentObject(WeatherViewModel())
}
