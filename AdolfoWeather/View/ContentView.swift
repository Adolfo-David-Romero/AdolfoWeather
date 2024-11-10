//
//  ContentView.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-07.
//

import SwiftUI

struct ContentView: View {
    @State private var temp_c: String = "hello"
    @State private var feelslike_c: String = ""
    @State private var wind_kph: String = ""
    @State private var wind_dir: String = ""
    @State private var humidity: String = ""
    @State private var uv: String = ""
    @State private var vis_km: String = ""
    @State private var condition: String = ""
    @State private var city_name: String = ""
    @State private var country_name: String = ""
    var body: some View {
        
        NavigationStack{
            VStack {
                List{
                    Section("Tempature Data:"){
                        Section(){
                            HStack{
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("\(temp_c)").font(.subheadline).fontWeight(.light)
                            }
                        }
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("st").font(.subheadline).fontWeight(.light)
                            }
                        }
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("st").font(.subheadline).fontWeight(.light)
                            }
                        }
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("st").font(.subheadline).fontWeight(.light)
                            }
                        }
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("st").font(.subheadline).fontWeight(.light)
                            }
                        }
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("st").font(.subheadline).fontWeight(.light)
                            }
                        }
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("").font(.subheadline).fontWeight(.light)
                            }
                        }
                    }
                    Section("Location Data"){
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("st").font(.subheadline).fontWeight(.light)
                            }
                        }
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("st").font(.subheadline).fontWeight(.light)
                            }
                        }
                        Section(){
                            HStack(){
                                Text("Tempature in Cº:").fontWeight(.semibold)
                                Text("st").font(.subheadline).fontWeight(.light)
                            }
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
