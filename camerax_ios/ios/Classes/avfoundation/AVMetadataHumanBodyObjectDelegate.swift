//
//  AVMetadataHumanBodyObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataHumanBodyObjectDelegate: PigeonApiDelegateAVMetadataHumanBodyObjectApi {
    @available(iOS 13.0, *)
    func type(pigeonApi: PigeonApiAVMetadataHumanBodyObjectApi, pigeonInstance: AVMetadataHumanBodyObject) throws -> AVMetadataObjectTypeApi {
        guard let api = pigeonInstance.type.api else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return api
    }
    
    @available(iOS 13.0, *)
    func time(pigeonApi: PigeonApiAVMetadataHumanBodyObjectApi, pigeonInstance: AVMetadataHumanBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.time.seconds * 1000)
    }
    
    @available(iOS 13.0, *)
    func duration(pigeonApi: PigeonApiAVMetadataHumanBodyObjectApi, pigeonInstance: AVMetadataHumanBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.duration.seconds * 1000)
    }
    
    @available(iOS 13.0, *)
    func bounds(pigeonApi: PigeonApiAVMetadataHumanBodyObjectApi, pigeonInstance: AVMetadataHumanBodyObject) throws -> RectF {
        return pigeonInstance.bounds.cxRectF
    }
    
    @available(iOS 13.0, *)
    func bodyID(pigeonApi: PigeonApiAVMetadataHumanBodyObjectApi, pigeonInstance: AVMetadataHumanBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.bodyID)
    }
    
}
