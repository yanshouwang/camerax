//
//  ImageCaptureImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import CoreLocation

class ImageCaptureImpl {
    class MetadataImpl: PigeonApiDelegateMetadataApi {
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
    
    class OutputFileOptionsImpl: PigeonApiDelegateOutputFileOptionsApi {
        func build(pigeonApi: PigeonApiOutputFileOptionsApi, file: String, metadata: ImageCapture.Metadata?) throws -> ImageCapture.OutputFileOptions {
            return ImageCapture.OutputFileOptions(file: file, metadata: metadata)
        }
    }
    
    class OutputFileResultsImpl: PigeonApiDelegateOutputFileResultsApi {
        func savedUri(pigeonApi: PigeonApiOutputFileResultsApi, pigeonInstance: ImageCapture.OutputFileResults) throws -> String? {
            return pigeonInstance.savedUri.absoluteString
        }
    }
    
    class OnImageCapturedCallbackImpl: PigeonApiDelegateOnImageCapturedCallbackApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiOnImageCapturedCallbackApi) throws -> any ImageCapture.OnImageCapturedCallback {
            fatalError()
        }
    }
    
    class OnImageSavedCallbackImpl: PigeonApiDelegateOnImageSavedCallbackApi {
        func pigeonDefaultConstructor(pigeonApi: PigeonApiOnImageSavedCallbackApi) throws -> any ImageCapture.OnImageSavedCallback {
            fatalError()
        }
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
    var impl: ImageCapture.FlashMode {
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
