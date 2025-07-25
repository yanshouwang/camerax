//
//  AVMetadataCatBodyObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataCatBodyObjectDelegate: PigeonApiDelegateAVMetadataCatBodyObjectApi {
    @available(iOS 13.0, *)
    func type(pigeonApi: PigeonApiAVMetadataCatBodyObjectApi, pigeonInstance: AVMetadataCatBodyObject) throws -> AVMetadataObjectTypeApi {
        guard let api = pigeonInstance.type.api else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return api
    }
    
    @available(iOS 13.0, *)
    func time(pigeonApi: PigeonApiAVMetadataCatBodyObjectApi, pigeonInstance: AVMetadataCatBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.time.seconds * 1000)
    }
    
    @available(iOS 13.0, *)
    func duration(pigeonApi: PigeonApiAVMetadataCatBodyObjectApi, pigeonInstance: AVMetadataCatBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.duration.seconds * 1000)
    }
    
    @available(iOS 13.0, *)
    func bounds(pigeonApi: PigeonApiAVMetadataCatBodyObjectApi, pigeonInstance: AVMetadataCatBodyObject) throws -> RectF {
        return pigeonInstance.bounds.cxRectF
    }
    
    @available(iOS 13.0, *)
    func bodyID(pigeonApi: PigeonApiAVMetadataCatBodyObjectApi, pigeonInstance: AVMetadataCatBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.bodyID)
    }
}
