//
//  ResponseComponentRowView.swift
//  AdolfoWeather
//
//  Created by David Romero on 2024-11-10.
//

import SwiftUI

struct ResponseComponentRowView: View {
    let title: String
    @Binding var response: String
    
    var body: some View {
        Section(){
            HStack{
                Text(title + ": ").fontWeight(.semibold)
                Text(response).font(.subheadline).fontWeight(.light)
            }
        }
    }
}

#Preview {
    ResponseComponentRowView(title: "Tempature in Cº", response:.constant("Example"))
}
