//
//  AudioConfig.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class AudioConfig: NSObject {
    static let audioDisabled = AudioConfig.create(false)
    
    static func create(_ enableAudio: Bool) -> AudioConfig {
        return AudioConfig(enableAudio)
    }
    
    public let audioEnabled: Bool
    
    private init(_ audioEnabled: Bool) {
        self.audioEnabled = audioEnabled
    }
}
