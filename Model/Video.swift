//
//  Video.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/27.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
}

extension Video {
    var thumbnail: String {
        return "video-\(id)"
    }
}
