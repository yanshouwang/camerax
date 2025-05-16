//
//  AudioStats.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class AudioStats: NSObject {
    let audioAmplitude: Double
    let audioState: AudioState
    let errorCause: Error?
    let hasAudio: Bool
    let hasError: Bool
    
    init(audioAmplitude: Double, audioState: AudioState, errorCause: Error?, hasAudio: Bool, hasError: Bool) {
        self.audioAmplitude = audioAmplitude
        self.audioState = audioState
        self.errorCause = errorCause
        self.hasAudio = hasAudio
        self.hasError = hasError
    }
    
    public enum AudioState {
        case active, disabled, sourceSilenced, encoderError, sourceError, muted
    }
}
