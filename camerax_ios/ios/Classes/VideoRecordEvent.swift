//
//  VideoRecordEvent.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/20.
//

import Foundation

@objc public class VideoRecordEvent: NSObject {
}

@objc public class VideoRecordStartEvent: VideoRecordEvent {
}

@objc public class VideoRecordFinalizeEvent: VideoRecordEvent {
    @objc public let savedUri: URL
    @objc public let error: (any Error)?
    
    init(savedUri: URL, error: (any Error)?) {
        self.savedUri = savedUri
        self.error = error
    }
}
