//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import Foundation

extension Bundle {
    private func decode<T: Codable>(_ file: String) -> T? {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            assertionFailure("Failed to locate \(file) in bundle")
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            assertionFailure("Failed to load \(file) from bundle")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            assertionFailure("Failed to decode \(file) from bundle")
            return nil
        }
        
        return loaded
    }
    
    func decode<T: Codable>(from localJsonData: LocalJsonData) -> T? {
        return self.decode(localJsonData.rawValue)
    }
}
