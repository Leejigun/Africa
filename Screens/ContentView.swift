//
//  ContentView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json") ?? []
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - Header
                CoverImageView()
                    .frame(height: 300)
                
                // MARK: - List
                ForEach(animals) { item in
                    AnimalListItemView(animal: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
