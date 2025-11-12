//
//  AVMetadataMachineReadableCodeObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataMachineReadableCodeObjectDelegate: PigeonApiDelegateAVMetadataMachineReadableCodeObjectProxyApi {
    func getCorners(pigeonApi: PigeonApiAVMetadataMachineReadableCodeObjectProxyApi, pigeonInstance: AVMetadataMachineReadableCodeObject) throws -> [PointF] {
        return pigeonInstance.corners.map { $0.cxPointF }
    }
    
    func getStringValue(pigeonApi: PigeonApiAVMetadataMachineReadableCodeObjectProxyApi, pigeonInstance: AVMetadataMachineReadableCodeObject) throws -> String? {
        return pigeonInstance.stringValue
    }
}
