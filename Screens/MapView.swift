//
//  MapView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let locations: [NationalParkLocation] = Bundle.main.decode(from: .locations) ?? []
    
    @State var region: MKCoordinateRegion = {
        let location = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let span = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        return MKCoordinateRegion(center: location, span: span)
    }()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // OLD STYLE
//             MapPin(coordinate: item.location, tint: .accentColor)
            
            // NEW STYLE
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // CUSTOM STYLE
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }//: MapAnnotation
        } //: Map
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
