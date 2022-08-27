//
//  MapAnnotationMarker.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/28.
//

import SwiftUI

struct MapAnnotationMarker: View {
    
    let location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + animation)
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationMarker_Previews: PreviewProvider {
    
    static let locations: [NationalParkLocation] = Bundle.main.decode(from: .locations) ?? []
    static var previews: some View {
        MapAnnotationMarker(location: locations[0])
            .previewLayout(.sizeThatFits)
    }
}
