//
//  RecordingStats.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class RecordingStats: NSObject {
    public let audioStats: AudioStats
    public let numBytesRecorded: Int64
    public let recorderedDurationNanos: Int64
    
    init(audioStats: AudioStats, numBytesRecorded: Int64, recorderedDurationNanos: Int64) {
        self.audioStats = audioStats
        self.numBytesRecorded = numBytesRecorded
        self.recorderedDurationNanos = recorderedDurationNanos
    }
}
