//
//  InsetMapView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/26.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    let location: NationalParkLocation
    @State private var region: MKCoordinateRegion
    
    init(location: NationalParkLocation) {
        self.location = location
        self.region = MKCoordinateRegion(center: location.location, span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(height: 256)
            .cornerRadius(12)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Location")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 14)
                        .background(
                            Color.black
                                .opacity(0.4)
                                .cornerRadius(8)
                    )
                }//: NavigationLink
                    .padding(12)
                ,alignment: .topTrailing
            )
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static let locations: [NationalParkLocation] = Bundle.main.decode(from: .locations) ?? []
    static var previews: some View {
        InsetMapView(location: locations[0])
            .previewLayout(.sizeThatFits)
    }
}
