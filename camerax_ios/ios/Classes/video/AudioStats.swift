//
//  AudioStats.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class AudioStats: NSObject {
    public let audioAmplitude: Double
    public let audioState: AudioState
    public let errorCause: Error?
    public let hasAudio: Bool
    public let hasError: Bool
    
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
