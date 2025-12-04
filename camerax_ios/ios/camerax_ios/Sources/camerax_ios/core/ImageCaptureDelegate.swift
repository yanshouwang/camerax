//
//  ImageCaptureDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import CoreGraphics
import CoreLocation

class ImageCaptureDelegate {
    class OnImageCapturedCallbackDelegate: PigeonApiDelegateImageCaptureOnImageCapturedCallbackProxyApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiImageCaptureOnImageCapturedCallbackProxyApi) throws -> any ImageCapture.OnImageCapturedCallback {
            return ImageCaptureOnImageCapturedCallback(pigeonApi)
        }
    }
}

class ImageCaptureOnImageCapturedCallback: NSObject, ImageCapture.OnImageCapturedCallback {
    private let api: PigeonApiImageCaptureOnImageCapturedCallbackProxyApi
    
    init(_ api: PigeonApiImageCaptureOnImageCapturedCallbackProxyApi) {
        self.api = api
    }
    
    func onCaptureStarted() {
        self.api.onCaptureStarted(pigeonInstance: self) { _ in }
    }
    
    func onCaptureProcessProgressed(_ progress: Int) {
        self.api.onCaptureProcessProgressed(pigeonInstance: self, progress: Int64(progress)) { _ in }
    }
    
    func onPostviewBitmapAvailable(_ bitmap: CGImage) {
        // self.api.onPostviewBitmapAvailable(pigeonInstance: self, bitmap: bitmap) { _ in }
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
        return switch self {
        case .auto: .auto
        case .on: .on
        case .off: .off
        }
    }
}

extension ImageCaptureFlashModeApi {
    var delegateOrNil: ImageCapture.FlashMode? {
        return switch self {
        case .auto: .auto
        case .on: .on
        case .off: .off
        case .screen: nil
        }
    }
}
