//
//  AudioConfigDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class AudioConfigDelegate: PigeonApiDelegateAudioConfigProxyApi {
    func create(pigeonApi: PigeonApiAudioConfigProxyApi, enableAudio: Bool) throws -> AudioConfig {
        return AudioConfig.create(enableAudio)
    }
    
    func audioDisabled(pigeonApi: PigeonApiAudioConfigProxyApi) throws -> AudioConfig {
        return AudioConfig.audioDisabled
    }
    
    func getAudioEnabled(pigeonApi: PigeonApiAudioConfigProxyApi, pigeonInstance: AudioConfig) throws -> Bool {
        return pigeonInstance.audioEnabled
    }
}
