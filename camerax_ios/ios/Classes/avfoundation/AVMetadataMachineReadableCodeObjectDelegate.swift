//
//  AVMetadataMachineReadableCodeObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataMachineReadableCodeObjectDelegate: PigeonApiDelegateAVMetadataMachineReadableCodeObjectApi {
    func type(pigeonApi: PigeonApiAVMetadataMachineReadableCodeObjectApi, pigeonInstance: AVMetadataMachineReadableCodeObject) throws -> AVMetadataObjectTypeApi {
        guard let api = pigeonInstance.type.api else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return api
    }
    
    func time(pigeonApi: PigeonApiAVMetadataMachineReadableCodeObjectApi, pigeonInstance: AVMetadataMachineReadableCodeObject) throws -> Int64 {
        return pigeonInstance.time.api
    }
    
    func duration(pigeonApi: PigeonApiAVMetadataMachineReadableCodeObjectApi, pigeonInstance: AVMetadataMachineReadableCodeObject) throws -> Int64 {
        return pigeonInstance.duration.api
    }
    
    func bounds(pigeonApi: PigeonApiAVMetadataMachineReadableCodeObjectApi, pigeonInstance: AVMetadataMachineReadableCodeObject) throws -> RectF {
        return pigeonInstance.bounds.cxRectF
    }
    
    func corners(pigeonApi: PigeonApiAVMetadataMachineReadableCodeObjectApi, pigeonInstance: AVMetadataMachineReadableCodeObject) throws -> [PointF] {
        return pigeonInstance.corners.map { $0.cxPointF }
    }
    
    func stringValue(pigeonApi: PigeonApiAVMetadataMachineReadableCodeObjectApi, pigeonInstance: AVMetadataMachineReadableCodeObject) throws -> String? {
        return pigeonInstance.stringValue
    }
}
