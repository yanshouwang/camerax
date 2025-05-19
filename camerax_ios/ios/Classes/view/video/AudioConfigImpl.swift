//
//  AudioConfigImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class AudioConfigImpl: PigeonApiDelegateAudioConfigApi {
    func create(pigeonApi: PigeonApiAudioConfigApi, enableAudio: Bool) throws -> AudioConfig {
        fatalError()
    }
    
    func audioDisabled(pigeonApi: PigeonApiAudioConfigApi) throws -> AudioConfig {
        fatalError()
    }
    
    func getAudioEnabled(pigeonApi: PigeonApiAudioConfigApi, pigeonInstance: AudioConfig) throws -> Bool {
        fatalError()
    }
}
