//
//  CaptureVideoDataOutputSampleBufferDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation
import AVFoundation
import CoreMotion
import Accelerate

class CaptureVideoDataOutputSampleBufferDelegate: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    private let analyzer: ImageAnalysis.Analyzer
    private var rotationProvider: RotationProvider
    private var analyzingImage: ImageProxy?
    private var cachedImage: ImageProxy?
    
    init(analyzer: ImageAnalysis.Analyzer, rotationProvider: RotationProvider) {
        self.analyzer = analyzer
        self.rotationProvider = rotationProvider
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        debugPrint("captureOutput didOutput")
        guard let rotation = try? rotationProvider.getRotation() else { return }
        let relativeRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(rotation)
        let sensorOrientation = 90
        let isOppositeFacing = connection.isOppositeFacing
        let rotationDegrees = CameraOrientationUtil.getRelativeImageRotation(destRotationDegrees: relativeRotationDegrees, sourceRotationDegrees: sensorOrientation, isOppositeFacing: isOppositeFacing)
        let image = SampleBufferProxy(sampleBuffer: sampleBuffer, rotationDegrees: rotationDegrees) {
            DispatchQueue.main.async {
                guard let cachedImage = self.cachedImage else { return }
                self.analyzer.analyze(cachedImage)
                self.analyzingImage = cachedImage
                self.cachedImage = nil
            }
        }
        DispatchQueue.main.async {
            if let analyzingImage = self.analyzingImage, !analyzingImage.isClosed {
                self.cachedImage = image
            } else {
                self.analyzer.analyze(image)
                self.analyzingImage = image
                self.cachedImage = nil
            }
        }
    }
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        debugPrint("captureOutput didDrop")
    }
}

fileprivate extension AVCaptureConnection {
    var isOppositeFacing: Bool {
        guard let input = inputPorts.map({ $0.input }).filter({ $0 is AVCaptureDeviceInput }).first as? AVCaptureDeviceInput else {
            debugPrint("input is nil")
            return true
        }
        let device = input.device
        return device.position == .back
    }
}
