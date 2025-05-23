//
//  CapturePhotoToMemoryDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/14.
//

import Foundation
import AVFoundation

class CapturePhotoCaptureDelegate: NSObject, AVCapturePhotoCaptureDelegate {
    private let options: ImageCapture.OutputFileOptions
    private let callback: ImageCapture.OnImageSavedCallback
    
    init(_ options: ImageCapture.OutputFileOptions, _ callback: ImageCapture.OnImageSavedCallback) {
        self.options = options
        self.callback = callback
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
        debugPrint("will begin capture.")
        callback.onCaptureStarted()
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
        debugPrint("will capture photo.")
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
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
        debugPrint("did finish processing photo.")
        do {
            if let error { throw error }
            let url = options.url
            guard let data = photo.fileDataRepresentation() else { throw CameraXError(code: "nil-error", message: "photo is nil", details: nil) }
            try data.write(to: url, options: .atomic)
            let results = ImageCapture.OutputFileResults(savedUri: url)
            callback.onImageSaved(results)
        } catch {
            callback.onError(error)
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings, error: (any Error)?) {
        debugPrint("did finish capture.")
    }
}
