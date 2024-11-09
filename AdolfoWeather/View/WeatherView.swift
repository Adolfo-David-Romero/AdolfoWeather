//
//  WeatherView.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-07.
//

import SwiftUI
import MapKit

struct WeatherView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var body: some View {
        Text("")
        //Map(coordinateRegion: $region)
    }
}

#Preview {
    WeatherView()
}
