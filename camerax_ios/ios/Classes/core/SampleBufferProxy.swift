//
//  CMSampleBufferImageProxy.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/22.
//

import Foundation
import AVFoundation
import Accelerate

class SampleBufferProxy: ImageProxy {
    private let sampleBuffer: CMSampleBuffer
    private let rotationDegrees: Int
    
    init(sampleBuffer: CMSampleBuffer, rotationDegrees: Int, onClosed: @escaping () -> Void) {
        self.sampleBuffer = sampleBuffer
        self.rotationDegrees = rotationDegrees
        super.init(onClosed: onClosed)
    }
    
    override func getFormat() throws -> ImageFormat {
        let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
        let type = CVPixelBufferGetPixelFormatType(pixelBuffer)
        return type.cxImageFormat
    }
    
    override func getWidth() throws -> Int {
        let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
        return CVPixelBufferGetWidth(pixelBuffer)
    }
    
    override func getHeight() throws -> Int {
        let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
        return CVPixelBufferGetHeight(pixelBuffer)
    }
    
    override func getPlanes() throws -> [PlaneProxy] {
        let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
        if CVPixelBufferIsPlanar(pixelBuffer) {
            var planes = [PlaneProxy]()
            for index in 0 ..< CVPixelBufferGetPlaneCount(pixelBuffer) {
                let plane = YUV420888PlaneProxy(sampleBuffer: self.sampleBuffer, index: index)
                planes.append(plane)
            }
            return planes
        } else {
            return [RGBA8888PlaneProxy(sampleBuffer: self.sampleBuffer)]
        }
    }
    
    override func getImageInfo() -> ImageInfo {
        let timestamp = CMSampleBufferGetPresentationTimeStamp(self.sampleBuffer)
        return ImageInfo(timestamp: timestamp, rotationDegrees: self.rotationDegrees)
    }
    
    override func getSampleBuffer() -> CMSampleBuffer? {
        return self.sampleBuffer
    }
    
    class YUV420888PlaneProxy: PlaneProxy {
        private let sampleBuffer: CMSampleBuffer
        private let index: Int
        
        init(sampleBuffer: CMSampleBuffer, index: Int) {
            self.sampleBuffer = sampleBuffer
            self.index = index
        }
        
        override func getValue() throws -> Data {
            let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
            CVPixelBufferLockBaseAddress(pixelBuffer, .readOnly)
            defer { CVPixelBufferUnlockBaseAddress(pixelBuffer, .readOnly) }
            guard let address = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, self.index) else {
                throw CameraXError(code: "nil-error", message: "CVPixelBufferGetBaseAddressOfPlane is nil", details: nil)
            }
            let width = CVPixelBufferGetWidthOfPlane(pixelBuffer, self.index)
            let height = CVPixelBufferGetHeightOfPlane(pixelBuffer, self.index)
            let bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, self.index)
            let bytesPerPixel = bytesPerRow / width
            var src = vImage_Buffer(data: address, height: vImagePixelCount(height), width: vImagePixelCount(width), rowBytes: bytesPerRow)
            let rowBytes = width * bytesPerPixel
            let byteCount = rowBytes * height
            let destAddress = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: 1)
            defer { destAddress.deallocate() }
            var dest = vImage_Buffer(data: destAddress, height: vImagePixelCount(height), width: vImagePixelCount(width), rowBytes: rowBytes)
            let error = vImageCopyBuffer(&src, &dest, bytesPerPixel, vImage_Flags(kvImageNoFlags))
            guard error == vImage_Error(kvImageNoError) else {
                throw CameraXError(code: "vimage-error", message: "vImageCopyBuffer failed with error \(error)", details: nil)
            }
            return Data(bytes: destAddress, count: byteCount)
        }
        
        override func getPixelStride() throws -> Int {
            let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
            let width = CVPixelBufferGetWidthOfPlane(pixelBuffer, self.index)
            let bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, self.index)
            return bytesPerRow / width
        }
        
        override func getRowStride() throws -> Int {
            let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
            let width = CVPixelBufferGetWidthOfPlane(pixelBuffer, self.index)
            let bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, self.index)
            let bytesPerPixel = bytesPerRow / width
            return width * bytesPerPixel
        }
    }
    
    class RGBA8888PlaneProxy: PlaneProxy {
        private let sampleBuffer: CMSampleBuffer
        
        init(sampleBuffer: CMSampleBuffer) {
            self.sampleBuffer = sampleBuffer
        }
        
        override func getValue() throws -> Data {
            let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
            CVPixelBufferLockBaseAddress(pixelBuffer, .readOnly)
            defer { CVPixelBufferUnlockBaseAddress(pixelBuffer, .readOnly) }
            guard let address = CVPixelBufferGetBaseAddress(pixelBuffer) else {
                throw CameraXError(code: "nil-error", message: "CVPixelBufferGetBaseAddress is nil", details: nil)
            }
            let width = CVPixelBufferGetWidth(pixelBuffer)
            let height = CVPixelBufferGetHeight(pixelBuffer)
            let bytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer)
            let bytesPerPixel = MemoryLayout<Pixel_8888>.stride
            let alignment = MemoryLayout<Pixel_8888>.alignment
            var src = vImage_Buffer(data: address, height: vImagePixelCount(height), width: vImagePixelCount(width), rowBytes: bytesPerRow)
            let rowBytes = width * bytesPerPixel
            let byteCount = rowBytes * height
            let destAddress = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)
            defer { destAddress.deallocate() }
            var dest = vImage_Buffer(data: destAddress, height: vImagePixelCount(height), width: vImagePixelCount(width), rowBytes: rowBytes)
            // B(0) G(1) R(2) A(3)
            // R(2) G(1) B(0) A(3)
            let error = vImagePermuteChannels_ARGB8888(&src, &dest, [2, 1, 0, 3], vImage_Flags(kvImageNoFlags))
            guard error == vImage_Error(kvImageNoError) else {
                throw CameraXError(code: "vimage-error", message: "vImagePermuteChannels_ARGB8888 failed with error \(error)", details: nil)
            }
            return Data(bytes: destAddress, count: byteCount)
        }
        
        override func getPixelStride() throws -> Int {
            return MemoryLayout<Pixel_8888>.stride
        }
        
        override func getRowStride() throws -> Int {
            let pixelBuffer = try self.sampleBuffer.getPixelBuffer()
            return CVPixelBufferGetBytesPerRow(pixelBuffer)
        }
    }
}

fileprivate extension CMSampleBuffer {
    func getPixelBuffer() throws -> CVPixelBuffer {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(self) else {
            throw CameraXError(code: "nil-error", message: "CMSampleBufferGetImageBuffer is nil", details: nil)
        }
        return pixelBuffer
    }
}
