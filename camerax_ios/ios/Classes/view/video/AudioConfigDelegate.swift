//
//  AudioConfigDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class AudioConfigDelegate: PigeonApiDelegateAudioConfigApi {
    func create(pigeonApi: PigeonApiAudioConfigApi, enableAudio: Bool) throws -> AudioConfig {
        return AudioConfig.create(enableAudio)
    }
    
    func audioDisabled(pigeonApi: PigeonApiAudioConfigApi) throws -> AudioConfig {
        return AudioConfig.audioDisabled
    }
    
    func getAudioEnabled(pigeonApi: PigeonApiAudioConfigApi, pigeonInstance: AudioConfig) throws -> Bool {
        return pigeonInstance.audioEnabled
    }
}
