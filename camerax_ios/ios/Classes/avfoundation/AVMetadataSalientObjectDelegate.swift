//
//  AVMetadataSalientObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataSalientObjectDelegate: PigeonApiDelegateAVMetadataSalientObjectApi {
    @available(iOS 13.0, *)
    func type(pigeonApi: PigeonApiAVMetadataSalientObjectApi, pigeonInstance: AVMetadataSalientObject) throws -> AVMetadataObjectTypeApi {
        guard let api = pigeonInstance.type.api else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return api
    }
    
    @available(iOS 13.0, *)
    func time(pigeonApi: PigeonApiAVMetadataSalientObjectApi, pigeonInstance: AVMetadataSalientObject) throws -> Int64 {
        return Int64(pigeonInstance.time.seconds * 1000)
    }
    
    @available(iOS 13.0, *)
    func duration(pigeonApi: PigeonApiAVMetadataSalientObjectApi, pigeonInstance: AVMetadataSalientObject) throws -> Int64 {
        return Int64(pigeonInstance.duration.seconds * 1000)
    }
    
    @available(iOS 13.0, *)
    func bounds(pigeonApi: PigeonApiAVMetadataSalientObjectApi, pigeonInstance: AVMetadataSalientObject) throws -> RectF {
        return pigeonInstance.bounds.cxRectF
    }
    
    @available(iOS 13.0, *)
    func objectID(pigeonApi: PigeonApiAVMetadataSalientObjectApi, pigeonInstance: AVMetadataSalientObject) throws -> Int64 {
        return Int64(pigeonInstance.objectID)
    }
}
