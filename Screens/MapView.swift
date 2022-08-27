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
                MapAnnotationMarker(location: item)
            }//: MapAnnotation
        } //: Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .opacity(0.6)
                        .cornerRadius(8)
                )
                .padding()
            , alignment: .top
        )//: overlay
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
