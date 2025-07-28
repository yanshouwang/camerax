//
//  ConsumerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import AVFoundation

class VideoRecordEventConsumerDelegate: PigeonApiDelegateVideoRecordEventConsumerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVideoRecordEventConsumerApi) throws -> VideoRecordEventConsumer {
        return VideoRecordEventConsumer(pigeonApi)
    }
}

class AVAnalyzerResultConsumerDelegate: PigeonApiDelegateAVAnalyzerResultConsumerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiAVAnalyzerResultConsumerApi) throws -> AVAnalyzerResultConsumer {
        return AVAnalyzerResultConsumer(pigeonApi)
    }
}

class VideoRecordEventConsumer: NSObject, Consumer {
    private let api: PigeonApiVideoRecordEventConsumerApi
    
    init(_ api: PigeonApiVideoRecordEventConsumerApi) {
        self.api = api
    }
    
    func accept(_ value: VideoRecordEvent) {
        self.api.accept(pigeonInstance: self, value: value) { _ in }
    }
}

class AVAnalyzerResultConsumer: NSObject, Consumer {
    private let api: PigeonApiAVAnalyzerResultConsumerApi
    
    init(_ api: PigeonApiAVAnalyzerResultConsumerApi) {
        self.api = api
    }
    
    func accept(_ value: AVAnalyzer.Result) {
        self.api.accept(pigeonInstance: self, value: value) { _ in }
    }
}
