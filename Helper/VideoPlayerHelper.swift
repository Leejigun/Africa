//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/27.
//

import Foundation
import AVKit

class VideoPlayerHelper {
    static let shared = VideoPlayerHelper()
    
    private var videoPlayer: AVPlayer?
    
    func playVideo(fileName: String) -> AVPlayer? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp4") {
            videoPlayer = AVPlayer(url: url)
            videoPlayer?.play()
        }
        return videoPlayer
    }
}
