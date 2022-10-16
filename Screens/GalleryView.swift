//
//  GalleryView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: Animal?
    @State private var gridColumn: Float = 3
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    private let animals: [Animal] = Bundle.main.decode(from: .animals) ?? []
    private let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    private func switchGrid() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal?.image ?? "logo")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                    .padding(.horizontal, 30)
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding()
                    .onChange(of: gridColumn) { _ in
                        switchGrid()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center) {
                    
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal
                                haptic.impactOccurred()
                            }
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        .onAppear {
            switchGrid()
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
