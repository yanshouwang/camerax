//
//  CapturePhotoToMemoryDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/14.
//

import Foundation
import AVFoundation

class CapturePhotoToMemoryDelegate: NSObject, AVCapturePhotoCaptureDelegate {
    let handler: (Data?, (any Error)?) -> Void
    
    init(completionHandler handler: @escaping (Data?, (any Error)?) -> Void) {
        self.handler = handler
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings, error: (any Error)?) {
        
    }
}
