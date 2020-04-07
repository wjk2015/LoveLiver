//
//  AVKitExtension.swift
//  LoveLiver
//
//  Created by BAN Jun on 2016/03/20.
//  Copyright © 2016年 mzp. All rights reserved.
//

import AVFoundation
import AppKit

extension CMTime {
    var msS: (Int, Int, Int) {
        let duration = CMTimeGetSeconds(self)
        let minutes = Int(floor(duration / 60))
        let seconds = Int(floor(duration - Double(minutes) * 60))
        let milliseconds = Int((duration - floor(duration)) * 100)
        return (minutes, seconds, milliseconds)
    }

    var stringInsSS: String {
        let (minutes, seconds, milliseconds) = msS
        return String(format: "%d.%02d", minutes * 60 + seconds, milliseconds)
    }

    var stringInmmssSS: String {
        let (minutes, seconds, milliseconds) = msS
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }

    var stringInmmmsssSS: String {
        let (minutes, seconds, milliseconds) = msS
        return String(format: "%02dm%02ds%02d", minutes, seconds, milliseconds)
    }
}


extension AVAssetImageGenerator {
    func copyImage(at time: CMTime) -> NSImage? {
        guard let cgImage = try? copyCGImage(at: time, actualTime: nil) else { return nil }
        return NSImage(cgImage: cgImage, size: CGSize(width: cgImage.width, height: cgImage.height))
    }
}


extension AVPlayerItem {
    var naturalSize: CGSize? {
        return asset.tracks(withMediaType: AVMediaType.video).first?.naturalSize
    }

    var minFrameDuration: CMTime? {
        return asset.tracks(withMediaType: AVMediaType.video).first?.minFrameDuration
    }
}
