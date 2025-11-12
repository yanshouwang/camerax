//
//  RecordingDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class RecordingDelegate: PigeonApiDelegateRecordingProxyApi {
    func isPersistent(pigeonApi: PigeonApiRecordingProxyApi, pigeonInstance: Recording) throws -> Bool {
        let isPersistent = try pigeonInstance.isPersistent()
        return isPersistent
    }
    
    func mute(pigeonApi: PigeonApiRecordingProxyApi, pigeonInstance: Recording, muted: Bool) throws {
        try pigeonInstance.mute(muted)
    }
    
    func pause(pigeonApi: PigeonApiRecordingProxyApi, pigeonInstance: Recording) throws {
        try pigeonInstance.pause()
    }
    
    func resume(pigeonApi: PigeonApiRecordingProxyApi, pigeonInstance: Recording) throws {
        try pigeonInstance.resume()
    }
    
    func stop(pigeonApi: PigeonApiRecordingProxyApi, pigeonInstance: Recording) throws {
        pigeonInstance.stop()
    }
}
