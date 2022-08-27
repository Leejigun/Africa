//
//  NationalParkLocation.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/26.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
}

extension NationalParkLocation {
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
