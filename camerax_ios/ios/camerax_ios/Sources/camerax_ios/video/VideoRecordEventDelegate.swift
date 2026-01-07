//
//  VideoRecordEventDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class VideoRecordEventDelegate: PigeonApiDelegateVideoRecordEventProxyApi {
    class StatusDelegate: PigeonApiDelegateVideoRecordEventStatusProxyApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordEventStatusProxyApi, pigeonInstance: VideoRecordEvent.Status) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class StartDelegate: PigeonApiDelegateVideoRecordEventStartProxyApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordEventStartProxyApi, pigeonInstance: VideoRecordEvent.Start) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class PauseDelegate: PigeonApiDelegateVideoRecordEventPauseProxyApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordEventPauseProxyApi, pigeonInstance: VideoRecordEvent.Pause) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class ResumeDelegate: PigeonApiDelegateVideoRecordEventResumeProxyApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordEventResumeProxyApi, pigeonInstance: VideoRecordEvent.Resume) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
    }
    
    class FinalizeDelegate: PigeonApiDelegateVideoRecordEventFinalizeProxyApi {
        func hasError(pigeonApi: PigeonApiVideoRecordEventFinalizeProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> Bool {
            return pigeonInstance.hasError
        }
        
        func recordingStats(pigeonApi: PigeonApiVideoRecordEventFinalizeProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> RecordingStats {
            return pigeonInstance.recordingStats
        }
        
        func cause(pigeonApi: PigeonApiVideoRecordEventFinalizeProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> [Any?]? {
            return if let cause = pigeonInstance.cause { wrap(cause) }
            else { nil }
        }
        
        func error(pigeonApi: PigeonApiVideoRecordEventFinalizeProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> VideoRecordEventFinalizeErrorApi {
            return pigeonInstance.error.api
        }
        
        func outputResults(pigeonApi: PigeonApiVideoRecordEventFinalizeProxyApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> OutputResults {
            return pigeonInstance.outputResults
        }
    }
}

extension VideoRecordEvent.Finalize.Error {
    var api: VideoRecordEventFinalizeErrorApi {
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
