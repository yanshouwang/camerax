//
//  AVMetadataFaceObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataFaceObjectDelegate: PigeonApiDelegateAVMetadataFaceObjectApi {
    func type(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> AVMetadataObjectTypeApi {
        guard let api = pigeonInstance.type.api else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return api
    }
    
    func time(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> Int64 {
        return Int64(pigeonInstance.time.seconds * 1000)
    }
    
    func duration(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> Int64 {
        return Int64(pigeonInstance.duration.seconds * 1000)
    }
    
    func bounds(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> RectF {
        return pigeonInstance.bounds.cxRectF
    }
    
    func faceID(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> Int64 {
        return Int64(pigeonInstance.faceID)
    }
    
    func hasRollAngle(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> Bool {
        return pigeonInstance.hasRollAngle
    }
    
    func rollAngle(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> Double {
        return pigeonInstance.rollAngle
    }
    
    func hasYawAngle(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> Bool {
        return pigeonInstance.hasYawAngle
    }
    
    func yawAngle(pigeonApi: PigeonApiAVMetadataFaceObjectApi, pigeonInstance: AVMetadataFaceObject) throws -> Double {
        return pigeonInstance.yawAngle
    }
}
