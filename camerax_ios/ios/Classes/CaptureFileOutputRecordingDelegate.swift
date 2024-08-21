//
//  MyCaptureFileOutputRecordingDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/20.
//

import Foundation
import AVFoundation

class CaptureFileOutputRecordingDelegate: NSObject, AVCaptureFileOutputRecordingDelegate {
    let listener: (VideoRecordEvent) -> Void
    
    init(listener: @escaping (VideoRecordEvent) -> Void) {
        self.listener = listener
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        debugPrint("did start recording to \(fileURL)")
        let event = VideoRecordStartEvent()
        listener(event)
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: (any Error)?) {
        debugPrint("did finish recording to \(outputFileURL)")
        let event = VideoRecordFinalizeEvent(savedUri: outputFileURL, error: error)
        listener(event)
    }
}
