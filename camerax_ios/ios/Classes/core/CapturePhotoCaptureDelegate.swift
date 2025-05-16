//
//  CapturePhotoToMemoryDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/14.
//

import Foundation
import AVFoundation

class CapturePhotoCaptureDelegate: NSObject, AVCapturePhotoCaptureDelegate {
    let url: URL
    let handler: (Error?) -> Void
    
    init(url: URL, completionHandler handler: @escaping ((any Error)?) -> Void) {
        self.url = url
        self.handler = handler
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
        debugPrint("will begin capture.")
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
            guard let data = photo.fileDataRepresentation() else {
                throw CameraXError(code: "nil-error", message: "fileDataRepresentation is nil", details: nil)
            }
            try data.write(to: url, options: .atomic)
            handler(nil)
        } catch {
            handler(error)
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings, error: (any Error)?) {
        debugPrint("did finish capture.")
    }
}
