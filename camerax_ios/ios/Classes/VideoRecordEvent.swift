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
    @objc public let uri: String
    @objc public let error: Error?
    
    init(uri: String, error: Error?) {
        self.uri = uri
        self.error = error
    }
}
