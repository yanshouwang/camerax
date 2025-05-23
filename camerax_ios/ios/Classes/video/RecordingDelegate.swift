//
//  RecordingDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class RecordingDelegate: PigeonApiDelegateRecordingApi {
    func isPersistent(pigeonApi: PigeonApiRecordingApi, pigeonInstance: Recording) throws -> Bool {
        let isPersistent = try pigeonInstance.isPersistent()
        return isPersistent
    }
    
    func mute(pigeonApi: PigeonApiRecordingApi, pigeonInstance: Recording, muted: Bool) throws {
        try pigeonInstance.mute(muted)
    }
    
    func pause(pigeonApi: PigeonApiRecordingApi, pigeonInstance: Recording) throws {
        try pigeonInstance.pause()
    }
    
    func resume(pigeonApi: PigeonApiRecordingApi, pigeonInstance: Recording) throws {
        try pigeonInstance.resume()
    }
    
    func stop(pigeonApi: PigeonApiRecordingApi, pigeonInstance: Recording) throws {
        pigeonInstance.stop()
    }
}
