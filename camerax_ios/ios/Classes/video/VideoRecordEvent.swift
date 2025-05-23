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
        public let outputResults: OutputResults
        public let cause: Any?
        public let error: Error
        public var hasError: Bool {
            return error != .none
        }
        
        init(recordingStats: RecordingStats, outputResults: OutputResults, cause: Any?, error: Error) {
            self.outputResults = outputResults
            self.cause = cause
            self.error = error
            super.init(recordingStats: recordingStats)
        }
        
        public enum Error {
            case none,
                 unknown,
                 fileSizeLimitReached,
                 insufficientStorage,
                 sourceInactive,
                 invalidOuputOptions,
                 encodingFailed,
                 recorderError,
                 noValidData,
                 durationLimitReached,
                 recordingGarbageCollected
        }
    }
}
