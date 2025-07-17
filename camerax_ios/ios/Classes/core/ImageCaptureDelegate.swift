//
//  ImageCaptureDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import CoreLocation

class ImageCaptureDelegate {
    class OnImageCapturedCallbackDelegate: PigeonApiDelegateOnImageCapturedCallbackApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiOnImageCapturedCallbackApi) throws -> any ImageCapture.OnImageCapturedCallback {
            return OnImageCapturedCallback(pigeonApi)
        }
    }
}

class OnImageCapturedCallback: NSObject, ImageCapture.OnImageCapturedCallback {
    private let api: PigeonApiOnImageCapturedCallbackApi
    
    init(_ api: PigeonApiOnImageCapturedCallbackApi) {
        self.api = api
    }
    
    func onCaptureStarted() {
        api.onCaptureStarted(pigeonInstance: self) { _ in }
    }
    
    func onCaptureProcessProgressed(_ progress: Int) {
        api.onCaptureProcessProgressed(pigeonInstance: self, progress: Int64(progress)) { _ in }
    }
    
    func onPostviewBitmapAvailable(_ bitmap: Data) {
        api.onPostviewBitmapAvailable(pigeonInstance: self, bitmap: bitmap.api) { _ in }
    }
    
    func onCaptureSuccess(_ image: ImageProxy) {
        api.onCaptureSuccess(pigeonInstance: self, image: image) { _ in }
    }
    
    func onError(_ error: any Error) {
        let exception = wrap(error)
        api.onError(pigeonInstance: self, exception: exception) { _ in }
    }
}

extension ImageCapture.FlashMode {
    var api: FlashModeApi {
        switch self {
        case .auto:
            return .auto
        case .on:
            return .on
        case .off:
            return .off
        }
    }
}

extension FlashModeApi {
    var delegate: ImageCapture.FlashMode {
        switch self {
        case .auto:
            return .auto
        case .on:
            return .on
        case .off:
            return .off
        case .screen:
            fatalError()
        }
    }
}
