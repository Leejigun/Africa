//
//  ContentView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridColumnCount: Int = 2
    @State private var gridToolbarIcon: String = "square.grid.2x2"
    
    private let animals: [Animal] = Bundle.main.decode(from: .animals) ?? []
    private let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    private func switchGrid() {
        if isGridViewActive {
            gridColumnCount = (gridColumnCount % 3) + 1
            
            switch gridColumnCount {
            case 1:
                gridToolbarIcon = "rectangle.grid.1x2"
            case 2:
                gridToolbarIcon = "square.grid.2x2"
            case 3:
                gridToolbarIcon = "square.grid.3x2"
            default:
                gridToolbarIcon = "square.grid.2x2"
            }
            
            gridLayout = Array(repeating: GridItem(.flexible()), count: gridColumnCount)
        } else {
            isGridViewActive = true
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        // MARK: - Header
                        CoverImageView()
                            .frame(height: 300)
                        
                        // MARK: - List
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        HStack {
                            Spacer()
                            CreditsView()
                            Spacer()
                        }
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                    }
                    .animation(.easeIn, value: gridColumnCount)
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button {
                            isGridViewActive = false
                            haptic.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // Grid
                        Button {
                            switchGrid()
                            haptic.impactOccurred()
                        } label: {
                            Image(systemName: gridToolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
