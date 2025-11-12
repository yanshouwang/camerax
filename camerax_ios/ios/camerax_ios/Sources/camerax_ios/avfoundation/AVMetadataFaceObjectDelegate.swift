//
//  AVMetadataFaceObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataFaceObjectDelegate: PigeonApiDelegateAVMetadataFaceObjectProxyApi {
    func getFaceID(pigeonApi: PigeonApiAVMetadataFaceObjectProxyApi, pigeonInstance: AVMetadataFaceObject) throws -> Int64 {
        return Int64(pigeonInstance.faceID)
    }
    
    func hasRollAngle(pigeonApi: PigeonApiAVMetadataFaceObjectProxyApi, pigeonInstance: AVMetadataFaceObject) throws -> Bool {
        return pigeonInstance.hasRollAngle
    }
    
    func getRollAngle(pigeonApi: PigeonApiAVMetadataFaceObjectProxyApi, pigeonInstance: AVMetadataFaceObject) throws -> Double {
        return pigeonInstance.rollAngle
    }
    
    func hasYawAngle(pigeonApi: PigeonApiAVMetadataFaceObjectProxyApi, pigeonInstance: AVMetadataFaceObject) throws -> Bool {
        return pigeonInstance.hasYawAngle
    }
    
    func getYawAngle(pigeonApi: PigeonApiAVMetadataFaceObjectProxyApi, pigeonInstance: AVMetadataFaceObject) throws -> Double {
        return pigeonInstance.yawAngle
    }
}
