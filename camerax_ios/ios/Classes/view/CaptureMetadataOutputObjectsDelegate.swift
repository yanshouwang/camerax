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
    private let videoPreviewLayer: AVCaptureVideoPreviewLayer
    
    init(analyzer: AVAnalyzer, videoPreviewLayer: AVCaptureVideoPreviewLayer) {
        self.analyzer = analyzer
        self.videoPreviewLayer = videoPreviewLayer
    }
    
    private var consumer: any Consumer<AVAnalyzer.Result> { analyzer.consumer }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        let objects = metadataObjects.compactMap { videoPreviewLayer.transformedMetadataObject(for: $0) }
        let value = AVAnalyzer.Result(objects: objects)
        consumer.accept(value)
    }
}
