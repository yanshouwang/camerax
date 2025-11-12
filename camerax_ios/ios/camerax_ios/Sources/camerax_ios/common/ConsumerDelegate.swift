//
//  ConsumerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import AVFoundation

class AVAnalyzerResultConsumerDelegate: PigeonApiDelegateAVAnalyzerResultConsumerProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiAVAnalyzerResultConsumerProxyApi) throws -> AVAnalyzerResultConsumer {
        return AVAnalyzerResultConsumer(pigeonApi)
    }
}

class ImageProxyConsumerDelegate: PigeonApiDelegateImageProxyConsumerProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiImageProxyConsumerProxyApi) throws -> ImageProxyConsumer {
        return ImageProxyConsumer(pigeonApi)
    }
}

class VideoRecordEventConsumerDelegate: PigeonApiDelegateVideoRecordEventConsumerProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVideoRecordEventConsumerProxyApi) throws -> VideoRecordEventConsumer {
        return VideoRecordEventConsumer(pigeonApi)
    }
}

class AVAnalyzerResultConsumer: NSObject, Consumer {
    private let api: PigeonApiAVAnalyzerResultConsumerProxyApi
    
    init(_ api: PigeonApiAVAnalyzerResultConsumerProxyApi) {
        self.api = api
    }
    
    func accept(_ value: AVAnalyzer.Result) {
        self.api.accept(pigeonInstance: self, value: value) { _ in }
    }
}

class ImageProxyConsumer: NSObject, Consumer {
    private let api: PigeonApiImageProxyConsumerProxyApi
    
    init(_ api: PigeonApiImageProxyConsumerProxyApi) {
        self.api = api
    }
    
    func accept(_ value: ImageProxy) {
        self.api.accept(pigeonInstance: self, value: value) { _ in }
    }
}

class VideoRecordEventConsumer: NSObject, Consumer {
    private let api: PigeonApiVideoRecordEventConsumerProxyApi
    
    init(_ api: PigeonApiVideoRecordEventConsumerProxyApi) {
        self.api = api
    }
    
    func accept(_ value: VideoRecordEvent) {
        self.api.accept(pigeonInstance: self, value: value) { _ in }
    }
}
