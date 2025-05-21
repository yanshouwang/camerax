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
                    debugPrint("CVPixelBufferGetBaseAddressOfPlane is nil")
                    return
                }
                let widthOfPlane = CVPixelBufferGetWidthOfPlane(buffer, i)
                let heightOfPlane = CVPixelBufferGetHeightOfPlane(buffer, i)
                let bytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(buffer, i)
                let bytesPerPixelOfPlane = bytesPerRowOfPlane / widthOfPlane
                let dataOfPlane = Data(bytes: baseAddressOfPlane, count: bytesPerRowOfPlane * heightOfPlane)
                let plane = ImageProxy.PlaneProxy(data: dataOfPlane, rowStride: bytesPerRowOfPlane, pixelStride: bytesPerPixelOfPlane)
                planes.append(plane)
            }
        } else {
            guard let srcBaseAddress = CVPixelBufferGetBaseAddress(buffer) else {
                debugPrint("CVPixelBufferGetBaseAddress is nil")
                return
            }
            let bytesPerPixel = MemoryLayout<Pixel_8888>.stride
            let alignment = MemoryLayout<Pixel_8888>.alignment
            let srcBytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
            var src = vImage_Buffer(data: srcBaseAddress, height: vImagePixelCount(height), width: vImagePixelCount(width), rowBytes: srcBytesPerRow)
            let destBytesPerRow = width * bytesPerPixel
            let destCount = destBytesPerRow * height
            let destBaseAddress = UnsafeMutableRawPointer.allocate(byteCount: destCount, alignment: alignment)
            defer { destBaseAddress.deallocate() }
            var dest = vImage_Buffer(data: destBaseAddress, height: vImagePixelCount(height), width: vImagePixelCount(width), rowBytes: destBytesPerRow)
            // B(0) G(1) R(2) A(3)
            // R(2) G(1) B(0) A(3)
            let error = vImagePermuteChannels_ARGB8888(&src, &dest, [2, 1, 0, 3], vImage_Flags(kvImageNoFlags))
            guard error == vImage_Error(kvImageNoError) else {
                debugPrint("vImagePermuteChannels_ARGB8888 failed with error \(error)")
                return
            }
            let destData = Data(bytes: destBaseAddress, count: destCount)
            let plane = ImageProxy.PlaneProxy(data: destData, rowStride: destBytesPerRow, pixelStride: bytesPerPixel)
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
}

extension CMTime {
    var milliseconds: Int {
        return Int(self.seconds * 1000)
    }
}
