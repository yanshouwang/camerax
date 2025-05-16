//
//  ImageCapture.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation
import AVFoundation
import CoreLocation

public class ImageCapture: NSObject {
    public class Metadata: NSObject {
        let isReversedHorizontal: Bool
        let isReversedVertical: Bool
        let location: CLLocation?
        
        init(isReversedHorizontal: Bool, isReversedVertical: Bool, location: CLLocation?) {
            self.isReversedHorizontal = isReversedHorizontal
            self.isReversedVertical = isReversedVertical
            self.location = location
        }
    }
    
    public class OutputFileOptions: NSObject {
        let file: String
        let metadata: Metadata?
        
        init(file: String, metadata: Metadata?) {
            self.file = file
            self.metadata = metadata
        }
    }
    
    public class OutputFileResults: NSObject {
        let savedUri: URL
        
        init(savedUri: URL) {
            self.savedUri = savedUri
        }
    }
    
    public enum FlashMode: Int {
        case auto, on, off
    }
    
    protocol OnImageCapturedCallback: NSObjectProtocol {
        func onCaptureStarted()
        func onCaptureProcessProgressed(progress: Int)
        func onPostviewBitmapAvailable(bitmap: Data)
        func onCaptureSuccess(image: ImageProxy)
        func onError(exception: Error)
    }
    
    protocol OnImageSavedCallback: NSObjectProtocol {
        func onCaptureStarted()
        func onCaptureProcessProgressed(progress: Int)
        func onPostviewBitmapAvailable(bitmap: Data)
        func onImageSaved(outputFileResults: OutputFileResults)
        func onError(Error exception: Error)
    }
}

extension ImageCapture.FlashMode {
    var impl: AVCaptureDevice.FlashMode {
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

extension AVCaptureDevice.FlashMode {
    var api: ImageCapture.FlashMode {
        switch self {
        case .auto:
            return .auto
        case .on:
            return .on
        case .off:
            return .off
        @unknown default:
            fatalError()
        }
    }
}
