//
//  ConsumerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

class VideoRecordEventConsumerDelegate: PigeonApiDelegateVideoRecordEventConsumerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVideoRecordEventConsumerApi) throws -> VideoRecordEventConsumer {
        return VideoRecordEventConsumer(pigeonApi)
    }
}

class VideoRecordEventConsumer: NSObject, Consumer {
    private let api: PigeonApiVideoRecordEventConsumerApi
    
    init(_ api: PigeonApiVideoRecordEventConsumerApi) {
        self.api = api
    }
    
    func accept(_ value: VideoRecordEvent) {
        api.accept(pigeonInstance: self, value: value) { _ in }
    }
}
