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
        if let error {
            callback.onError(error)
        } else {
            let image = CapturePhotoProxy(photo: photo) {}
            callback.onCaptureSuccess(image)
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
