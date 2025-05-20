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
            fatalError()
        }
    }
    
    class StartDelegate: PigeonApiDelegateVideoRecordStartEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordStartEventApi, pigeonInstance: VideoRecordEvent.Start) throws -> RecordingStats {
            fatalError()
        }
    }
    
    class PauseDelegate: PigeonApiDelegateVideoRecordPauseEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordPauseEventApi, pigeonInstance: VideoRecordEvent.Pause) throws -> RecordingStats {
            fatalError()
        }
    }
    
    class ResumeDelegate: PigeonApiDelegateVideoRecordResumeEventApi {
        func recordingStats(pigeonApi: PigeonApiVideoRecordResumeEventApi, pigeonInstance: VideoRecordEvent.Resume) throws -> RecordingStats {
            fatalError()
        }
    }
    
    class FinalizeDelegate: PigeonApiDelegateVideoRecordFinalizeEventApi {
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
