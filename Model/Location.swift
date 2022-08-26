//
//  Location.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/26.
//

import Foundation

struct Location: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
}
