//
//  VideoRecordEventDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class VideoRecordEventDelegate: PigeonApiDelegateVideoRecordEventProxyApi {
    class StatusDelegate: PigeonApiDelegateVideoRecordStatusEventProxyApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordStatusEventProxyApi, pigeonInstance: VideoRecordEvent.Status) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class StartDelegate: PigeonApiDelegateVideoRecordStartEventProxyApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordStartEventProxyApi, pigeonInstance: VideoRecordEvent.Start) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class PauseDelegate: PigeonApiDelegateVideoRecordPauseEventProxyApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordPauseEventProxyApi, pigeonInstance: VideoRecordEvent.Pause) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class ResumeDelegate: PigeonApiDelegateVideoRecordResumeEventProxyApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordResumeEventProxyApi, pigeonInstance: VideoRecordEvent.Resume) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class FinalizeDelegate: PigeonApiDelegateVideoRecordFinalizeEventProxyApi {
        func hasError(pigeonApi: PigeonApiVideoRecordFinalizeEventProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> Bool {
            return pigeonInstance.hasError
        }
        
        func recordingStats(pigeonApi: PigeonApiVideoRecordFinalizeEventProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
        
        func cause(pigeonApi: PigeonApiVideoRecordFinalizeEventProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> [Any?]? {
            return if let cause = pigeonInstance.cause { wrap(cause) }
            else { nil }
        }
        
        func error(pigeonApi: PigeonApiVideoRecordFinalizeEventProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> VideoRecordFinalizeEventErrorApi {
            return pigeonInstance.error.api
        }
        
        func outputResults(pigeonApi: PigeonApiVideoRecordFinalizeEventProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> OutputResults {
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
