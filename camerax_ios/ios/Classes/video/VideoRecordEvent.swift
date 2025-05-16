//
//  VideoRecordEvent.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/20.
//

import Foundation

public class VideoRecordEvent: NSObject {
    public let recordingStats: RecordingStats
    
    private init(recordingStats: RecordingStats) {
        self.recordingStats = recordingStats
    }
    
    public class Status: VideoRecordEvent {
        internal override init(recordingStats: RecordingStats) {
            super.init(recordingStats: recordingStats)
        }
    }
    
    public class Start: VideoRecordEvent {
        internal override init(recordingStats: RecordingStats) {
            super.init(recordingStats: recordingStats)
        }
    }
    
    public class Pause: VideoRecordEvent {
        internal override init(recordingStats: RecordingStats) {
            super.init(recordingStats: recordingStats)
        }
    }
    
    public class Resume: VideoRecordEvent {
        internal override init(recordingStats: RecordingStats) {
            super.init(recordingStats: recordingStats)
        }
    }
    
    public class Finalize: VideoRecordEvent {
        public let savedUri: URL
        public let error: Error?
        
        internal init(recordingStats: RecordingStats, savedUri: URL, error: Error?) {
            self.savedUri = savedUri
            self.error = error
            super.init(recordingStats: recordingStats)
        }
    }
}
