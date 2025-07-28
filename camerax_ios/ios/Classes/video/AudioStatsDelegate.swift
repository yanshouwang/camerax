//
//  AudioStatsDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class AudioStatsDelegate: PigeonApiDelegateAudioStatsApi {
    func audioAmplitude(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> Double {
        return pigeonInstance.audioAmplitude
    }
    
    func audioState(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> AudioStateApi {
        return pigeonInstance.audioState.api
    }
    
    func errorCause(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> [Any?]? {
        return if let errorCause = pigeonInstance.errorCause { wrap(errorCause) }
        else { nil }
    }
    
    func hasAudio(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> Bool {
        return pigeonInstance.hasAudio
    }
    
    func hasError(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> Bool {
        return pigeonInstance.hasError
    }
}

extension AudioStats.AudioState {
    var api: AudioStateApi {
        switch self {
        case .active:
            return .active
        case .disabled:
            return .disabled
        case .sourceSilenced:
            return .sourceSilenced
        case .encoderError:
            return .encoderError
        case .sourceError:
            return .sourceError
        case .muted:
            return .muted
        }
    }
}
