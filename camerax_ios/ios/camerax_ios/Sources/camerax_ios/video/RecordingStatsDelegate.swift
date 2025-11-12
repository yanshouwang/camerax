//
//  RecordingStatsDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class RecordingStatsDelegate: PigeonApiDelegateRecordingStatsProxyApi {
    func audioStats(pigeonApi: PigeonApiRecordingStatsProxyApi, pigeonInstance: RecordingStats) throws -> AudioStats {
        return pigeonInstance.audioStats
    }
    
    func numBytesRecorded(pigeonApi: PigeonApiRecordingStatsProxyApi, pigeonInstance: RecordingStats) throws -> Int64 {
        return pigeonInstance.numBytesRecorded
    }
    
    func recordedDurationNanos(pigeonApi: PigeonApiRecordingStatsProxyApi, pigeonInstance: RecordingStats) throws -> Int64 {
        return pigeonInstance.recorderedDurationNanos
    }
}
