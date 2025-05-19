//
//  RecordingStatsImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class RecordingStatsImpl: PigeonApiDelegateRecordingStatsApi {
    func audioStats(pigeonApi: PigeonApiRecordingStatsApi, pigeonInstance: RecordingStats) throws -> AudioStats {
        fatalError()
    }
    
    func numBytesRecorded(pigeonApi: PigeonApiRecordingStatsApi, pigeonInstance: RecordingStats) throws -> Int64 {
        fatalError()
    }
    
    func recordedDurationNanos(pigeonApi: PigeonApiRecordingStatsApi, pigeonInstance: RecordingStats) throws -> Int64 {
        fatalError()
    }
}
