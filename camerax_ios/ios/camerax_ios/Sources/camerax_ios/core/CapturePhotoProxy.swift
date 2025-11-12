//
//  AVCapturePhotoImageProxy.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/22.
//

import Foundation
import AVFoundation

class CapturePhotoProxy: ImageProxy {
    private let photo: AVCapturePhoto
    
    init(photo: AVCapturePhoto, onClosed: @escaping () -> Void) {
        self.photo = photo
        super.init(onClosed: onClosed)
    }
    
    override func getFormat() throws -> ImageFormat {
        return .jpeg
    }
    
    override func getWidth() throws -> Int {
        let exif = try self.photo.getExif()
        guard let width = exif[kCGImagePropertyExifPixelXDimension as String] as? Int else {
            throw CameraXError(code: "nil-error", message: "width is nil", details: nil)
        }
        return width
    }
    
    override func getHeight() throws -> Int {
        let exif = try self.photo.getExif()
        guard let height = exif[kCGImagePropertyExifPixelYDimension as String] as? Int else {
            throw CameraXError(code: "nil-error", message: "height is nil", details: nil)
        }
        return height
    }
    
    override func getPlanes() throws -> [ImageProxy.PlaneProxy] {
        return [JPEGPlaneProxy(photo: self.photo)]
    }
    
    override func getImageInfo() throws -> ImageInfo {
        let timestamp = self.photo.timestamp
        guard let orientationValue = self.photo.metadata[kCGImagePropertyOrientation as String] as? UInt32, let orientation = CGImagePropertyOrientation(rawValue: orientationValue) else {
            throw CameraXError(code: "nil-error", message: "orientation is nil", details: nil)
        }
        let rotationDegrees = orientation.degrees
        return ImageInfo(timestamp: timestamp, rotationDegrees: rotationDegrees)
    }
    
    override func getImage() -> CGImage? {
        return self.photo.cgImageRepresentation()
    }
    
    class JPEGPlaneProxy: PlaneProxy {
        private let photo: AVCapturePhoto
        
        init(photo: AVCapturePhoto) {
            self.photo = photo
        }
        
        override func getValue() throws -> Data {
            guard let value = self.photo.fileDataRepresentation() else {
                throw CameraXError(code: "nil-error", message: "fileDataRepresentation is nil", details: nil)
            }
            return value
        }
        
        override func getRowStride() throws -> Int {
            return 0
        }
        
        override func getPixelStride() throws -> Int {
            return 0
        }
    }
}

fileprivate extension AVCapturePhoto {
    func getExif() throws -> [String : Any] {
        guard let exif = self.metadata[kCGImagePropertyExifDictionary as String] as? [String: Any] else {
            throw CameraXError(code: "nil-error", message: "exif is nil", details: nil)
        }
        return exif
    }
}

fileprivate extension CGImagePropertyOrientation {
    var degrees: Int {
        switch self {
        case .up, .upMirrored:
            return 0
        case .down, .downMirrored:
            return 180
        case .leftMirrored, .right:
            return 90
        case .rightMirrored, .left:
            return 270
        }
    }
}
