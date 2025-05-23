//
//  RecordingStatsDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class RecordingStatsDelegate: PigeonApiDelegateRecordingStatsApi {
    func audioStats(pigeonApi: PigeonApiRecordingStatsApi, pigeonInstance: RecordingStats) throws -> AudioStats {
        return pigeonInstance.audioStats
    }
    
    func numBytesRecorded(pigeonApi: PigeonApiRecordingStatsApi, pigeonInstance: RecordingStats) throws -> Int64 {
        return pigeonInstance.numBytesRecorded
    }
    
    func recordedDurationNanos(pigeonApi: PigeonApiRecordingStatsApi, pigeonInstance: RecordingStats) throws -> Int64 {
        return pigeonInstance.recorderedDurationNanos
    }
}
