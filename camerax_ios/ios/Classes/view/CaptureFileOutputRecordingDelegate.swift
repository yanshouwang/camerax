//
//  MyCaptureFileOutputRecordingDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/20.
//

import Foundation
import AVFoundation

class CaptureFileOutputRecordingDelegate: NSObject, AVCaptureFileOutputRecordingDelegate {
    let listener: any Consumer<VideoRecordEvent>
    
    init(listener: any Consumer<VideoRecordEvent>) {
        self.listener = listener
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        debugPrint("did start recording to \(fileURL)")
        let audioStats = output.audioStats
        let recordingStats = RecordingStats(audioStats: audioStats, numBytesRecorded: 0, recorderedDurationNanos: 0)
        let event = VideoRecordEvent.Start(recordingStats: recordingStats)
        listener.accept(event)
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: (any Error)?) {
        debugPrint("did finish recording to \(outputFileURL)")
        let audioStats = output.audioStats
        let recordingStats = RecordingStats(audioStats: audioStats, numBytesRecorded: 0, recorderedDurationNanos: 0)
        let outputResults = OutputResults(outputUri: outputFileURL)
        let event = VideoRecordEvent.Finalize(recordingStats: recordingStats, outputResults: outputResults, cause: error, error: .none)
        listener.accept(event)
    }
}

extension AVCaptureFileOutput {
    var audioStats: AudioStats {
        let audioAmplitudeNone = 0.0
        guard let connection = connection(with: .audio) else { return AudioStats(audioAmplitude: audioAmplitudeNone, audioState: .disabled, errorCause: nil, hasAudio: false, hasError: false) }
        return AudioStats(audioAmplitude: connection.audioAmplitude, audioState: connection.audioState, errorCause: nil, hasAudio: true, hasError: false)
    }
}

extension AVCaptureConnection {
    var audioAmplitude: Double {
        guard let value = audioChannels.map({ $0.averagePowerLevel / $0.peakHoldLevel }).max() else { return 0.0 }
        return Double(value)
    }
    
    var audioState: AudioStats.AudioState {
        return audioChannels.isEmpty ? .disabled : .active
    }
}
