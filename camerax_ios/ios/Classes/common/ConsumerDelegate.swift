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

class AVMetadataObjectsConsumerDelegate: PigeonApiDelegateAVMetadataObjectsConsumerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiAVMetadataObjectsConsumerApi) throws -> AVMetadataObjectsConsumer {
        return AVMetadataObjectsConsumer(pigeonApi)
    }
}

class VNAnalyzerResultConsumerDelegate: PigeonApiDelegateVNAnalyzerResultConsumerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVNAnalyzerResultConsumerApi) throws -> VNAnalyzerResultConsumer {
        return VNAnalyzerResultConsumer(pigeonApi)
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

class AVMetadataObjectsConsumer: NSObject, Consumer {
    private let api: PigeonApiAVMetadataObjectsConsumerApi
    
    init(_ api: PigeonApiAVMetadataObjectsConsumerApi) {
        self.api = api
    }
    
    func accept(_ value: [AVMetadataObject]) {
        self.api.accept(pigeonInstance: self, value: value) { _ in }
    }
}

class VNAnalyzerResultConsumer: NSObject, Consumer {
    private let api: PigeonApiVNAnalyzerResultConsumerApi
    
    init(_ api: PigeonApiVNAnalyzerResultConsumerApi) {
        self.api = api
    }
    
    func accept(_ value: VNAnalyzer.Result) {
        self.api.accept(pigeonInstance: self, value: value) { _ in }
    }
}
