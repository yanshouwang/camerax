//
//  AudioStatsImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class AudioStatsImpl: PigeonApiDelegateAudioStatsApi {
    func audioAmplitude(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> Double {
        fatalError()
    }
    
    func audioState(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> AudioStateApi {
        fatalError()
    }
    
    func errorCause(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> [Any?]? {
        fatalError()
    }
    
    func hasAudio(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> Bool {
        fatalError()
    }
    
    func hasError(pigeonApi: PigeonApiAudioStatsApi, pigeonInstance: AudioStats) throws -> Bool {
        fatalError()
    }
}
