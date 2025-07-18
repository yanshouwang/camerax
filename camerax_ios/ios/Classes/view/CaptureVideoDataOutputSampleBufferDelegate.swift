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
        guard let buffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            debugPrint("CMSampleBufferGetImageBuffer is nil")
            return
        }
        CVPixelBufferLockBaseAddress(buffer, .readOnly)
        defer { CVPixelBufferUnlockBaseAddress(buffer, .readOnly) }
        let format = CVPixelBufferGetPixelFormatType(buffer)
        let width = CVPixelBufferGetWidth(buffer)
        let height = CVPixelBufferGetHeight(buffer)
        var planes = [ImageProxy.PlaneProxy]()
        let isPlanar = CVPixelBufferIsPlanar(buffer)
        if isPlanar {
            for index in 0 ..< CVPixelBufferGetPlaneCount(buffer) {
                guard let addressOfPlane = CVPixelBufferGetBaseAddressOfPlane(buffer, index) else {
                    debugPrint("CVPixelBufferGetBaseAddressOfPlane is nil")
                    return
                }
                let widthOfPlane = CVPixelBufferGetWidthOfPlane(buffer, index)
                let heightOfPlane = CVPixelBufferGetHeightOfPlane(buffer, index)
                let bytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(buffer, index)
                let bytesPerPixelOfPlane = bytesPerRowOfPlane / widthOfPlane
                var srcOfPlane = vImage_Buffer(data: addressOfPlane, height: vImagePixelCount(heightOfPlane), width: vImagePixelCount(widthOfPlane), rowBytes: bytesPerRowOfPlane)
                let destBytesPerRowOfPlane = widthOfPlane * bytesPerPixelOfPlane
                let destCountOfPlane = destBytesPerRowOfPlane * heightOfPlane
                let destAddressOfPlane = UnsafeMutableRawPointer.allocate(byteCount: destCountOfPlane, alignment: 1)
                defer { destAddressOfPlane.deallocate() }
                var destOfPlane = vImage_Buffer(data: destAddressOfPlane, height: vImagePixelCount(heightOfPlane), width: vImagePixelCount(widthOfPlane), rowBytes: destBytesPerRowOfPlane)
                let errorOfPlane = vImageCopyBuffer(&srcOfPlane, &destOfPlane, bytesPerPixelOfPlane, vImage_Flags(kvImageNoFlags))
                guard errorOfPlane == vImage_Error(kvImageNoError) else {
                    debugPrint("vImageCopyBuffer failed with error \(errorOfPlane)")
                    return
                }
                let dataOfPlane = Data(bytes: destAddressOfPlane, count: destCountOfPlane)
                let plane = ImageProxy.PlaneProxy(data: dataOfPlane, rowStride: destBytesPerRowOfPlane, pixelStride: bytesPerPixelOfPlane)
                planes.append(plane)
            }
        } else {
            guard let address = CVPixelBufferGetBaseAddress(buffer) else {
                debugPrint("CVPixelBufferGetBaseAddress is nil")
                return
            }
            let bytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
            let bytesPerPixel = MemoryLayout<Pixel_8888>.stride
            let alignment = MemoryLayout<Pixel_8888>.alignment
            var src = vImage_Buffer(data: address, height: vImagePixelCount(height), width: vImagePixelCount(width), rowBytes: bytesPerRow)
            let destBytesPerRow = width * bytesPerPixel
            let destCount = destBytesPerRow * height
            let destAddress = UnsafeMutableRawPointer.allocate(byteCount: destCount, alignment: alignment)
            defer { destAddress.deallocate() }
            var dest = vImage_Buffer(data: destAddress, height: vImagePixelCount(height), width: vImagePixelCount(width), rowBytes: destBytesPerRow)
            // B(0) G(1) R(2) A(3)
            // R(2) G(1) B(0) A(3)
            let error = vImagePermuteChannels_ARGB8888(&src, &dest, [2, 1, 0, 3], vImage_Flags(kvImageNoFlags))
            guard error == vImage_Error(kvImageNoError) else {
                debugPrint("vImagePermuteChannels_ARGB8888 failed with error \(error)")
                return
            }
            let data = Data(bytes: destAddress, count: destCount)
            let plane = ImageProxy.PlaneProxy(data: data, rowStride: destBytesPerRow, pixelStride: bytesPerPixel)
            planes.append(plane)
        }
        let timestamp = CMSampleBufferGetPresentationTimeStamp(sampleBuffer)
        let relativeRotationDegrees = rotationProvider.getRotation()
        let sensorOrientation = 90
        let isOppositeFacing = connection.isOppositeFacing
        let rotationDegrees = CameraOrientationUtil.getRelativeImageRotation(destRotationDegrees: relativeRotationDegrees, sourceRotationDegrees: sensorOrientation, isOppositeFacing: isOppositeFacing)
        let imageInfo = ImageInfo(timestamp: timestamp, rotationDegrees: rotationDegrees)
        let image = ImageProxy(format: format.cxImageFormat, width: width, height: height, planes: planes, imageInfo: imageInfo) {
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
