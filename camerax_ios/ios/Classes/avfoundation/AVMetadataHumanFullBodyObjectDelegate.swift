//
//  AVMetadataHumanFullBodyObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataHumanFullBodyObjectDelegate: PigeonApiDelegateAVMetadataHumanFullBodyObjectApi {
    @available(iOS 17.0, *)
    func type(pigeonApi: PigeonApiAVMetadataHumanFullBodyObjectApi, pigeonInstance: AVMetadataHumanFullBodyObject) throws -> AVMetadataObjectTypeApi {
        guard let api = pigeonInstance.type.api else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return api
    }
    
    @available(iOS 17.0, *)
    func time(pigeonApi: PigeonApiAVMetadataHumanFullBodyObjectApi, pigeonInstance: AVMetadataHumanFullBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.time.seconds * 1000)
    }
    
    @available(iOS 17.0, *)
    func duration(pigeonApi: PigeonApiAVMetadataHumanFullBodyObjectApi, pigeonInstance: AVMetadataHumanFullBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.duration.seconds * 1000)
    }
    
    @available(iOS 17.0, *)
    func bounds(pigeonApi: PigeonApiAVMetadataHumanFullBodyObjectApi, pigeonInstance: AVMetadataHumanFullBodyObject) throws -> Rect {
        return pigeonInstance.bounds.cxRect
    }
    
    @available(iOS 17.0, *)
    func bodyID(pigeonApi: PigeonApiAVMetadataHumanFullBodyObjectApi, pigeonInstance: AVMetadataHumanFullBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.bodyID)
    }
}
