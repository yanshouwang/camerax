//
//  CaptureMetadataObjectsDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class CaptureMetadataOutputObjectsDelegate: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    private let analyzer: AVAnalyzer
    private let controller: CameraController
    
    init(analyzer: AVAnalyzer, controller: CameraController) {
        self.analyzer = analyzer
        self.controller = controller
    }
    
    private var consumer: any Consumer<AVAnalyzer.Result> { analyzer.consumer }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let videoPreviewLayer = controller.videoPreviewLayer else {
            debugPrint("videoPreviewLayer is nil")
            return
        }
        let objects = metadataObjects.compactMap { videoPreviewLayer.transformedMetadataObject(for: $0) }
        let value = AVAnalyzer.Result(objects: objects)
        DispatchQueue.main.async { self.consumer.accept(value) }
    }
}
