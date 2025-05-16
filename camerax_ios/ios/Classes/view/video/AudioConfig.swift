//
//  AudioConfig.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class AudioConfig: NSObject {
    static let audioDisabled = AudioConfig(audioEnabled: false)
    
    public let audioEnabled: Bool
    
    init(audioEnabled: Bool) {
        self.audioEnabled = audioEnabled
    }
}
