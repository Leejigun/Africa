//
//  CoverImageView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.sizeThatFits)
            .frame(width: 400, height: 300)
    }
}
