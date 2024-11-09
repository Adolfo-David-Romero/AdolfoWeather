//
//  ContentView.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-07.
//

import SwiftUI

struct ContentView: View {
    //
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    Section("Tempature Data:"){
                        Section(){
                            Text("Tempature in Cº:").fontWeight(.semibold)
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                        Section(":"){
                            
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                        Section("Wind Kph:"){
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                        Section("Wind Direction:"){
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                        Section("UV:"){
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                        Section("Vis Km:"){
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                        Section("Condition:"){
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                    }
                    Section("Location Data"){
                        Section("Feels like Cº:"){
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                        Section("Wind Kph:"){
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                        Section("Wind Direction:"){
                            Text("st").font(.subheadline).fontWeight(.light)
                        }
                    }
                    
                    
                }.listStyle(.automatic)
                
            }.navigationTitle("Adolfo Weather")
            
        }
    }
}

#Preview {
    ContentView()
}
