//
//  CaptureVideoDataOutputSampleBufferDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation
import AVFoundation

class CaptureVideoDataOutputSampleBufferDelegate: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    let analyzer: Analyzer
    
    init(analyzer: Analyzer) {
        self.analyzer = analyzer
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        debugPrint("Did output sample buffer.")
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            debugPrint("image buffer is nil.")
            return
        }
        CVPixelBufferLockBaseAddress(imageBuffer, .readOnly)
        let format = CVPixelBufferGetPixelFormatType(imageBuffer).ffiImageFormat
        let width = CVPixelBufferGetWidth(imageBuffer)
        let height = CVPixelBufferGetHeight(imageBuffer)
        let rotationDegrees = getRotationDegrees()
        var planeProxies = [PlaneProxy]()
        let isPlanar = CVPixelBufferIsPlanar(imageBuffer)
        if isPlanar {
            let count = CVPixelBufferGetPlaneCount(imageBuffer)
            for i in 0 ..< count {
                guard let baseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, i) else {
                    return
                }
                let rowStrideOfPlane = CVPixelBufferGetBytesPerRowOfPlane(imageBuffer, i)
                let widthOfPlane = CVPixelBufferGetWidthOfPlane(imageBuffer, i)
                let heightOfPlane = CVPixelBufferGetHeightOfPlane(imageBuffer, i)
                let pixelStrideOfPlane = rowStrideOfPlane / widthOfPlane
                let countOfPlane = rowStrideOfPlane * heightOfPlane
                let valueOfPlane = Data(bytes: baseAddressOfPlane, count: countOfPlane)
                let planeProxy = PlaneProxy(rowStride: rowStrideOfPlane, pixelStride: pixelStrideOfPlane, value: valueOfPlane)
                planeProxies.append(planeProxy)
            }
        } else {
            guard let baseAddress = CVPixelBufferGetBaseAddress(imageBuffer) else {
                return
            }
            let rowStride = CVPixelBufferGetBytesPerRow(imageBuffer)
            let pixelStride = rowStride / width
            let count = rowStride * height
            let value = Data(bytes: baseAddress, count: count)
            let planeProxy = PlaneProxy(rowStride: rowStride, pixelStride: pixelStride, value: value)
            planeProxies.append(planeProxy)
        }
        let timestamp = CMSampleBufferGetPresentationTimeStamp(sampleBuffer).milliseconds
        let imageProxy = ImageProxy(imageBuffer: imageBuffer, format: format, width: width, height: height, rotationDegrees: rotationDegrees, planeProxies: planeProxies, timestamp: timestamp)
        analyzer.analyze(imageProxy: imageProxy)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        debugPrint("Did drop sample buffer.")
    }
    
    func getRotationDegrees() -> Int {
        let orientation = UIDevice.current.orientation
        switch orientation {
        case .landscapeLeft:
            return 0
        case .portrait:
            return 90
        case .landscapeRight:
            return 180
        case .portraitUpsideDown:
            return 270
        default:
            return 0
        }
    }
}
