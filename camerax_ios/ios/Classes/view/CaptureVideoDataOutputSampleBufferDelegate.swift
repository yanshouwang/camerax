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
    private let analyzer: ImageAnalysis.Analyzer
    private let rotationProvider: () -> Int
    
    init(analyzer: ImageAnalysis.Analyzer, rotationProvider: @escaping () -> Int) {
        self.analyzer = analyzer
        self.rotationProvider = rotationProvider
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        debugPrint("captureOutput didOutput")
        guard let buffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            debugPrint("CMSampleBufferGetImageBuffer is nil")
            return
        }
        CVPixelBufferLockBaseAddress(buffer, .readOnly)
        let format = CVPixelBufferGetPixelFormatType(buffer)
        let width = CVPixelBufferGetWidth(buffer)
        let height = CVPixelBufferGetHeight(buffer)
        var planes = [ImageProxy.PlaneProxy]()
        let isPlanar = CVPixelBufferIsPlanar(buffer)
        if isPlanar {
            for i in 0 ..< CVPixelBufferGetPlaneCount(buffer) {
                guard let baseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(buffer, i) else {
                    return
                }
                let widthOfPlane = CVPixelBufferGetWidthOfPlane(buffer, i)
                let heightOfPlane = CVPixelBufferGetHeightOfPlane(buffer, i)
                let rowStride = CVPixelBufferGetBytesPerRowOfPlane(buffer, i)
                let pixelStride = rowStride / widthOfPlane
                let data = Data(bytes: baseAddressOfPlane, count: rowStride * heightOfPlane)
                let plane = ImageProxy.PlaneProxy(data: data, rowStride: rowStride, pixelStride: pixelStride)
                planes.append(plane)
            }
        } else {
            guard let baseAddress = CVPixelBufferGetBaseAddress(buffer) else {
                return
            }
            let rowStride = CVPixelBufferGetBytesPerRow(buffer)
            let pixelStride = rowStride / width
            var data = Data(bytes: baseAddress, count: rowStride * height)
            bgraToRGBA(value: &data)
            let plane = ImageProxy.PlaneProxy(data: data, rowStride: rowStride, pixelStride: pixelStride)
            planes.append(plane)
        }
        let timestamp = CMSampleBufferGetPresentationTimeStamp(sampleBuffer).milliseconds
        let rotationDegrees = 90 - rotationProvider()
        let imageInfo = ImageInfo(timestamp: timestamp, rotationDegrees: rotationDegrees)
        let image = ImageProxy(buffer: buffer, format: format.imageFormatApi, width: width, height: height, planes: planes, imageInfo: imageInfo)
        analyzer.analyze(image)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        debugPrint("captureOutput didDrop")
    }
    
    private func bgraToRGBA(value: inout Data) {
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

extension CMTime {
    var milliseconds: Int {
        return Int(self.seconds * 1000)
    }
}
