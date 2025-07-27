//
//  AVMetadataDogBodyObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataDogBodyObjectDelegate: PigeonApiDelegateAVMetadataDogBodyObjectApi {
    @available(iOS 13.0, *)
    func type(pigeonApi: PigeonApiAVMetadataDogBodyObjectApi, pigeonInstance: AVMetadataDogBodyObject) throws -> AVMetadataObjectTypeApi {
        guard let api = pigeonInstance.type.api else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return api
    }
    
    @available(iOS 13.0, *)
    func time(pigeonApi: PigeonApiAVMetadataDogBodyObjectApi, pigeonInstance: AVMetadataDogBodyObject) throws -> Int64 {
        return pigeonInstance.time.api
    }
    
    @available(iOS 13.0, *)
    func duration(pigeonApi: PigeonApiAVMetadataDogBodyObjectApi, pigeonInstance: AVMetadataDogBodyObject) throws -> Int64 {
        return pigeonInstance.duration.api
    }
    
    @available(iOS 13.0, *)
    func bounds(pigeonApi: PigeonApiAVMetadataDogBodyObjectApi, pigeonInstance: AVMetadataDogBodyObject) throws -> RectF {
        return pigeonInstance.bounds.cxRectF
    }
    
    @available(iOS 13.0, *)
    func bodyID(pigeonApi: PigeonApiAVMetadataDogBodyObjectApi, pigeonInstance: AVMetadataDogBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.bodyID)
    }
}
