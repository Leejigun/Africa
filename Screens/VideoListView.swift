//
//  VideoListView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/25.
//

import SwiftUI

struct VideoListView: View {
    
    init() {
        self.videos = Bundle.main.decode(from: .videos) ?? []
        self.videosId = ""
        self.videosId = Self.getId(videos)
    }
    
    @State var videos: [Video]
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var videosId: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos, id: \.id) { item in
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }
            }//: List
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        videosId = Self.getId(videos)
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
            .animation(.spring(), value: videosId)
        }//: NavigationView
    }
    
    static func getId(_ videos: [Video]) -> String {
        return videos
            .map { $0.id }
            .reduce("") { partialResult, id -> String in
                return partialResult + id
            }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
