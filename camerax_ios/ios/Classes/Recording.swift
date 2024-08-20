//
//  Recording.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/20.
//

import Foundation
import AVFoundation

@objc public class Recording: NSObject {
    let output: AVCaptureMovieFileOutput
    
    init(output: AVCaptureMovieFileOutput) {
        self.output = output
    }
    
    @objc public func stop() {
        output.stopRecording()
    }
}
