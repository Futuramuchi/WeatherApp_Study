//
//  ContentView.swift
//  WeatherApp
//
//  Created by user on 19.10.2021.
//

import SwiftUI

struct CityData: Identifiable {
    let id = UUID()
    let name: String
}

private let cities = [
    CityData(name: "Moscow"),
    CityData(name: "Domodedovo"),
    CityData(name: "Ufa"),
    CityData(name: "Kazan"),
    CityData(name: "Tomsk")
]

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                List(cities){ city in
                    VStack(alignment: .leading) {
                    NavigationLink(
                        destination: DetailsView(city: city),
                        label: {
                            Text(city.name)
                        })
                    }
                }
                .navigationTitle("Cities")
            }
            
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
