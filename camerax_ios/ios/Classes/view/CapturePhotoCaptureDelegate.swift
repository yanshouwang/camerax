//
//  CapturePhotoCaptureToMemoryDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/16.
//

import Foundation
import AVFoundation

class CapturePhotoCaptureDelegate: NSObject, AVCapturePhotoCaptureDelegate {
    private let callback: ImageCapture.OnImageCapturedCallback
    
    init(_ callback: ImageCapture.OnImageCapturedCallback) {
        self.callback = callback
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
        debugPrint("will begin capture.")
        callback.onCaptureStarted()
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
        debugPrint("will capture photo.")
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
        debugPrint("did capture photo.")
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings, error: (any Error)?) {
        debugPrint("did finish capture.")
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
        debugPrint("did finish processing photo.")
        do {
            if let error { throw error }
            guard let data = photo.fileDataRepresentation() else { throw CameraXError(code: "nil-error", message: "photo is nil", details: nil) }
            guard let exif = photo.metadata[kCGImagePropertyExifDictionary as String] as? [String: Any] else { throw CameraXError(code: "nil-error", message: "exif is nil", details: nil) }
            guard let width = exif[kCGImagePropertyExifPixelXDimension as String] as? Int else { throw CameraXError(code: "nil-error", message: "width is nil", details: nil) }
            guard let height = exif[kCGImagePropertyExifPixelYDimension as String] as? Int else { throw CameraXError(code: "nil-error", message: "height is nil", details: nil) }
            guard let orientationValue = photo.metadata[kCGImagePropertyOrientation as String] as? UInt32, let orientation = CGImagePropertyOrientation(rawValue: orientationValue) else { throw CameraXError(code: "nil-error", message: "orientation is nil", details: nil) }
            let planes = [ ImageProxy.PlaneProxy(data: data, rowStride: 0, pixelStride: 0) ]
            let timestamp = photo.timestamp
            let rotationDegrees = orientation.degrees
            let imageInfo = ImageInfo(timestamp: timestamp, rotationDegrees: rotationDegrees)
            let image = ImageProxy(format: .jpeg, width: width, height: height, planes: planes, imageInfo: imageInfo) {}
            callback.onCaptureSuccess(image)
        } catch {
            callback.onError(error)
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishRecordingLivePhotoMovieForEventualFileAt outputFileURL: URL, resolvedSettings: AVCaptureResolvedPhotoSettings) {
        debugPrint("did finish recording live photo movie for eventual file.")
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingLivePhotoToMovieFileAt outputFileURL: URL, duration: CMTime, photoDisplayTime: CMTime, resolvedSettings: AVCaptureResolvedPhotoSettings, error: (any Error)?) {
        debugPrint("did finish processing live photo to movie file.")
    }
    
    @available(iOS 17.0, *)
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishCapturingDeferredPhotoProxy deferredPhotoProxy: AVCaptureDeferredPhotoProxy?, error: (any Error)?) {
        debugPrint("did finish capturing deferred photo proxy.")
    }
}

fileprivate extension CGImagePropertyOrientation {
    var degrees: Int {
        switch self {
        case .up, .upMirrored:
            return 0
        case .down, .downMirrored:
            return 180
        case .leftMirrored, .right:
            return 90
        case .rightMirrored, .left:
            return 270
        }
    }
}
