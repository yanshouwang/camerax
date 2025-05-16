//
//  RecordingStats.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

public class RecordingStats: NSObject {
    let audioStats: AudioStats
    let numBytesRecorded: Int
    let recorderedDurationNanos: Int
    
    init(audioStats: AudioStats, numBytesRecorded: Int, recorderedDurationNanos: Int) {
        self.audioStats = audioStats
        self.numBytesRecorded = numBytesRecorded
        self.recorderedDurationNanos = recorderedDurationNanos
    }
}
