//
//  VideoPlayerView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/27.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let videoSelected: String
    let videoTitle: String
    
    var body: some View {
        VStack {
            Group {
                if let player = VideoPlayerHelper.shared.playVideo(fileName: videoSelected) {
                    VideoPlayer(player: player)
                } else {
                    EmptyView()
                }
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                ,alignment: .topLeading
            )
        }
        .tint(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }//: VStack
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "cheetah", videoTitle: "Cheetah")
        }
        .previewLayout(.sizeThatFits)
    }
}
