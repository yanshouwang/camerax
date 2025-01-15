//
//  VideoRecordEvent.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/20.
//

import Foundation

@objc public protocol VideoRecordEvent: NSObjectProtocol {
}

@objc public class VideoRecordStartEvent: NSObject, VideoRecordEvent {
}

@objc public class VideoRecordFinalizeEvent: NSObject, VideoRecordEvent {
    @objc public let savedUri: URL
    @objc public let error: (any Error)?
    
    init(savedUri: URL, error: (any Error)?) {
        self.savedUri = savedUri
        self.error = error
    }
}
