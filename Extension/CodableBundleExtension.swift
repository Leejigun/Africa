//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImage] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            assertionFailure("Failed to locate \(file) in bundle")
            return []
        }
        
        guard let data = try? Data(contentsOf: url) else {
            assertionFailure("Failed to load \(file) from bundle")
            return []
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            assertionFailure("Failed to decode \(file) from bundle")
            return []
        }
        
        return loaded
    }
}
