//
//  ContentView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode(from: .animals) ?? []
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - Header
                CoverImageView()
                    .frame(height: 300)
                
                // MARK: - List
                ForEach(animals) { item in
                    
                    NavigationLink(destination: AnimalDetailView(animal: item)) {
                        AnimalListItemView(animal: item)
                    }
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
