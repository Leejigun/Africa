//
//  AnimalDetailView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/26.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: Animal
    let location: Location? = {
        let locations: [Location] = Bundle.main.decode(from: .locations) ?? []
        return locations.first
    }()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // MARK: - hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // MARK: - title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // MARK: - headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // MARK: - gallery
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // MARK: - fact
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // MARK: - description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "Did you know?")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // MARK: - Map
                if let location = self.location {
                    Group {
                        HeadingView(headingImage: "map", headingText: "National Parks")
                        InsetMapView(location: location)
                    }
                    .padding(.horizontal)
                }
                
                // MARK: - link
                Group {
                    HeadingView(headingImage: "book.vertical", headingText: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animalData: [Animal] = Bundle.main.decode(from: .animals) ?? []
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animalData[0])
        }
        .previewDevice("iPhone 11 Pro Max")
    }
}
