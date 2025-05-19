//
//  VideoRecordEventImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/19.
//

import Foundation

class VideoRecordEventImpl: PigeonApiDelegateVideoRecordEventApi {
    class StatusImpl: PigeonApiDelegateVideoRecordStatusEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordStatusEventApi, pigeonInstance: VideoRecordEvent.Status) throws -> RecordingStats {
            fatalError()
        }
    }
    
    class StartImpl: PigeonApiDelegateVideoRecordStartEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordStartEventApi, pigeonInstance: VideoRecordEvent.Start) throws -> RecordingStats {
            fatalError()
        }
    }
    
    class PauseImpl: PigeonApiDelegateVideoRecordPauseEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordPauseEventApi, pigeonInstance: VideoRecordEvent.Pause) throws -> RecordingStats {
            fatalError()
        }
    }
    
    class ResumeImpl: PigeonApiDelegateVideoRecordResumeEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordResumeEventApi, pigeonInstance: VideoRecordEvent.Resume) throws -> RecordingStats {
            fatalError()
        }
    }
    
    class FinalizeImpl: PigeonApiDelegateVideoRecordFinalizeEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordFinalizeEventApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> RecordingStats {
            fatalError()
        }
        
        func cause(pigeonApi: PigeonApiVideoRecordFinalizeEventApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> [Any?]? {
            fatalError()
        }
        
        func error(pigeonApi: PigeonApiVideoRecordFinalizeEventApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> VideoRecordFinalizeEventErrorApi {
            fatalError()
        }
        
        func outputResults(pigeonApi: PigeonApiVideoRecordFinalizeEventApi, pigeonInstance: VideoRecordEvent.Finalize) throws -> OutputResults {
            fatalError()
        }
    }
}
