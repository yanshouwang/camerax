//
//  CaptureVideoDataOutputSampleBufferDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation
import AVFoundation
import CoreMotion

class CaptureVideoDataOutputSampleBufferDelegate: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    private let analyzer: Analyzer
    private let rotationProvider: () -> Int
    
    init(analyzer: Analyzer, rotationProvider: @escaping () -> Int) {
        self.analyzer = analyzer
        self.rotationProvider = rotationProvider
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        debugPrint("Did output sample buffer.")
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            debugPrint("image buffer is nil.")
            return
        }
        CVPixelBufferLockBaseAddress(imageBuffer, .readOnly)
        let format = CVPixelBufferGetPixelFormatType(imageBuffer)
        let width = CVPixelBufferGetWidth(imageBuffer)
        let height = CVPixelBufferGetHeight(imageBuffer)
        let rotationDegrees = 90 - rotationProvider()
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
            var value = Data(bytes: baseAddress, count: count)
            repairValue(value: &value)
            let planeProxy = PlaneProxy(rowStride: rowStride, pixelStride: pixelStride, value: value)
            planeProxies.append(planeProxy)
        }
        let timestamp = CMSampleBufferGetPresentationTimeStamp(sampleBuffer).milliseconds
        let imageProxy = ImageProxy(imageBuffer: imageBuffer, format: format.ffiImageFormat, width: width, height: height, rotationDegrees: rotationDegrees, planeProxies: planeProxies, timestamp: timestamp)
        analyzer.analyze(imageProxy: imageProxy)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        debugPrint("Did drop sample buffer.")
    }
    
    private func repairValue(value: inout Data) {
        let bytesPerPixel = 4
        let count = value.count / bytesPerPixel
        value.withUnsafeMutableBytes { bytes in
            guard let baseAddress = bytes.baseAddress else {
                return
            }
            for i in 0 ..< count {
                let address = baseAddress.advanced(by: i * bytesPerPixel)
                let blue = address.load(as: UInt8.self)
                let red = address.advanced(by: 2).load(as: UInt8.self)
                address.storeBytes(of: red, as: UInt8.self)
                address.advanced(by: 2).storeBytes(of: blue, as: UInt8.self)
            }
        }
    }
}
