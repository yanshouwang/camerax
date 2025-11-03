//
//  ImageCaptureDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import CoreLocation

class ImageCaptureDelegate {
    class OnImageCapturedCallbackDelegate: PigeonApiDelegateImageCaptureOnImageCapturedCallbackApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiImageCaptureOnImageCapturedCallbackApi) throws -> any ImageCapture.OnImageCapturedCallback {
            return ImageCaptureOnImageCapturedCallback(pigeonApi)
        }
    }
}

class ImageCaptureOnImageCapturedCallback: NSObject, ImageCapture.OnImageCapturedCallback {
    private let api: PigeonApiImageCaptureOnImageCapturedCallbackApi
    
    init(_ api: PigeonApiImageCaptureOnImageCapturedCallbackApi) {
        self.api = api
    }
    
    func onCaptureStarted() {
        self.api.onCaptureStarted(pigeonInstance: self) { _ in }
    }
    
    func onCaptureProcessProgressed(_ progress: Int) {
        self.api.onCaptureProcessProgressed(pigeonInstance: self, progress: Int64(progress)) { _ in }
    }
    
    func onPostviewBitmapAvailable(_ bitmap: Data) {
        self.api.onPostviewBitmapAvailable(pigeonInstance: self, bitmap: bitmap.api) { _ in }
    }
    
    func onCaptureSuccess(_ image: ImageProxy) {
        self.api.onCaptureSuccess(pigeonInstance: self, image: image) { _ in }
    }
    
    func onError(_ error: any Error) {
        let exception = wrap(error)
        self.api.onError(pigeonInstance: self, exception: exception) { _ in }
    }
}

extension ImageCapture.FlashMode {
    var api: ImageCaptureFlashModeApi {
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

extension ImageCaptureFlashModeApi {
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
