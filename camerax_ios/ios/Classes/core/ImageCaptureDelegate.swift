//
//  ImageCaptureDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import CoreLocation

class ImageCaptureDelegate {
    class MetadataDelegate: PigeonApiDelegateMetadataApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiMetadataApi, isReversedHorizontal: Bool, isReversedVertical: Bool, location: CLLocation?) throws -> ImageCapture.Metadata {
            return ImageCapture.Metadata(isReversedHorizontal: isReversedHorizontal, isReversedVertical: isReversedVertical, location: location)
        }
        
        func isReversedHorizontal(pigeonApi: PigeonApiMetadataApi, pigeonInstance: ImageCapture.Metadata) throws -> Bool {
            return pigeonInstance.isReversedHorizontal
        }
        
        func isReversedVertical(pigeonApi: PigeonApiMetadataApi, pigeonInstance: ImageCapture.Metadata) throws -> Bool {
            return pigeonInstance.isReversedVertical
        }
        
        func location(pigeonApi: PigeonApiMetadataApi, pigeonInstance: ImageCapture.Metadata) throws -> CLLocation? {
            return pigeonInstance.location
        }
    }
    
    class OutputFileOptionsDelegate: PigeonApiDelegateOutputFileOptionsApi {
        func build(pigeonApi: PigeonApiOutputFileOptionsApi, file: String, metadata: ImageCapture.Metadata?) throws -> ImageCapture.OutputFileOptions {
            let url = URL(fileURLWithPath: file)
            return ImageCapture.OutputFileOptions(url: url, metadata: metadata)
        }
    }
    
    class OutputFileResultsDelegate: PigeonApiDelegateOutputFileResultsApi {
        func savedUri(pigeonApi: PigeonApiOutputFileResultsApi, pigeonInstance: ImageCapture.OutputFileResults) throws -> String? {
            return pigeonInstance.savedUrl.absoluteString
        }
    }
    
    class OnImageCapturedCallbackDelegate: PigeonApiDelegateOnImageCapturedCallbackApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiOnImageCapturedCallbackApi) throws -> any ImageCapture.OnImageCapturedCallback {
            return OnImageCapturedCallback(pigeonApi)
        }
    }
    
    class OnImageSavedCallbackDelegate: PigeonApiDelegateOnImageSavedCallbackApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiOnImageSavedCallbackApi) throws -> any ImageCapture.OnImageSavedCallback {
            return OnImageSavedCallback(pigeonApi)
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
class OnImageSavedCallback: NSObject, ImageCapture.OnImageSavedCallback {
    private let api: PigeonApiOnImageSavedCallbackApi
    
    init(_ api: PigeonApiOnImageSavedCallbackApi) {
        self.api = api
    }
    
    func onCaptureStarted() {
        api.onCaptureStarted(pigeonInstance: self) { _ in }
    }
    
    func onCaptureProcessProgressed(_ progress: Int) {
        api.onCaptureProcessProgressed(pigeonInstance: self, progress: Int64(progress)) { _ in }
    }
    
    func onPostviewBitmapAvailable(_ bitmap: Data) {
        api.onPostviewBitmapAvailable(pigeonInstance: self, bitmap: bitmap.api)  { _ in }
    }
    
    func onImageSaved(_ outputFileResults: ImageCapture.OutputFileResults) {
        api.onImageSaved(pigeonInstance: self, outputFileResults: outputFileResults) { _ in }
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
