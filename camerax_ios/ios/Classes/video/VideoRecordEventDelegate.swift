//
//  VideoRecordEventDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class VideoRecordEventDelegate: PigeonApiDelegateVideoRecordEventApi {
    class StatusDelegate: PigeonApiDelegateVideoRecordStatusEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordStatusEventApi, pigeonInstance: VideoRecordEvent.Status) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class StartDelegate: PigeonApiDelegateVideoRecordStartEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordStartEventApi, pigeonInstance: VideoRecordEvent.Start) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class PauseDelegate: PigeonApiDelegateVideoRecordPauseEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordPauseEventApi, pigeonInstance: VideoRecordEvent.Pause) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class ResumeDelegate: PigeonApiDelegateVideoRecordResumeEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordResumeEventApi, pigeonInstance: VideoRecordEvent.Resume) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class FinalizeDelegate: PigeonApiDelegateVideoRecordFinalizeEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordFinalizeEventApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
        
        func cause(pigeonApi: PigeonApiVideoRecordFinalizeEventApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> [Any?]? {
            return if let cause = pigeonInstance.cause { wrap(cause) }
            else { nil }
        }
        
        func error(pigeonApi: PigeonApiVideoRecordFinalizeEventApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> VideoRecordFinalizeEventErrorApi {
            return pigeonInstance.error.api
        }
        
        func outputResults(pigeonApi: PigeonApiVideoRecordFinalizeEventApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> OutputResults {
            return pigeonInstance.outputResults
        }
    }
}

extension VideoRecordEvent.Finalize.Error {
    var api: VideoRecordFinalizeEventErrorApi {
        return switch self {
        case .none: .none
        case .unknown: .unknown
        case .fileSizeLimitReached: .fileSizeLimitReached
        case .insufficientStorage: .insufficientStorage
        case .sourceInactive: .sourceInactive
        case .invalidOuputOptions: .invalidOuputOptions
        case .encodingFailed: .encodingFailed
        case .recorderError: .recorderError
        case .noValidData: .noValidData
        case .durationLimitReached: .durationLimitReached
        case .recordingGarbageCollected: .recordingGarbageCollected
        }
    }
}
