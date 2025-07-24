//
//  VNBarcodeObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Flutter
import Vision

class VNBarcodeObservationDelegate: PigeonApiDelegateVNBarcodeObservationApi {
    func uuid(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> String {
        return pigeonInstance.uuid.uuidString
    }
    
    func confidence(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> Double {
        return Double(pigeonInstance.confidence)
    }
    
    func boundingBox(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> RectF {
        return pigeonInstance.boundingBox.cxRectF
    }
    
    func bottomLeft(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> PointF {
        return pigeonInstance.bottomLeft.cxPointF
    }
    
    func bottomRight(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> PointF {
        return pigeonInstance.bottomRight.cxPointF
    }
    
    func topLeft(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> PointF {
        return pigeonInstance.topLeft.cxPointF
    }
    
    func topRight(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> PointF {
        return pigeonInstance.topRight.cxPointF
    }
    
    func payloadStringValue(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> String? {
        return pigeonInstance.payloadStringValue
    }
    
    func payloadData(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> FlutterStandardTypedData? {
        guard #available(iOS 17.0, *), let bytes = pigeonInstance.payloadData else { return nil }
        return FlutterStandardTypedData(bytes: bytes)
    }
    
    func supplementalPayloadString(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> String? {
        guard #available(iOS 17.0, *) else { return nil }
        return pigeonInstance.supplementalPayloadString
    }
    
    func supplementalPayloadData(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> FlutterStandardTypedData? {
        guard #available(iOS 17.0, *), let bytes = pigeonInstance.supplementalPayloadData else { return nil }
        return FlutterStandardTypedData(bytes: bytes)
    }
    
    func supplementalCompositeType(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> VNBarcodeCompositeTypeApi {
        guard #available(iOS 17.0, *) else { return .none }
        return pigeonInstance.supplementalCompositeType.api
    }
    
    func isGS1DataCarrier(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> Bool {
        guard #available(iOS 17.0, *) else { return false }
        return pigeonInstance.isGS1DataCarrier
    }
    
    func symbology(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> VNBarcodeSymbologyApi {
        guard let api = pigeonInstance.symbology.api else { throw CameraXError(code: "nil-error", message: "symbology is nil", details: nil) }
        return api
    }
    
    func isColorInverted(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> Bool {
        guard #available(iOS 17.0, *) else { return false }
        return pigeonInstance.isColorInverted
    }
}
