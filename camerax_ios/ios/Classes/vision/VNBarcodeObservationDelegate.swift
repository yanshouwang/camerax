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
    func getPayloadStringValue(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> String? {
        return pigeonInstance.payloadStringValue
    }
    
    func getPayloadData(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> FlutterStandardTypedData? {
        guard #available(iOS 17.0, *) else { throw CameraXError(code: "unsupported-error", message: "payloadData is not available before iOS 17.0", details: nil) }
        guard let bytes = pigeonInstance.payloadData else { return nil }
        return FlutterStandardTypedData(bytes: bytes)
    }
    
    func getSupplementalPayloadString(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> String? {
        guard #available(iOS 17.0, *) else { throw CameraXError(code: "unsupported-error", message: "supplementalPayloadString is not available before iOS 17.0", details: nil) }
        return pigeonInstance.supplementalPayloadString
    }
    
    func getSupplementalPayloadData(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> FlutterStandardTypedData? {
        guard #available(iOS 17.0, *) else { throw CameraXError(code: "unsupported-error", message: "supplementalPayloadData is not available before iOS 17.0", details: nil) }
        guard let bytes = pigeonInstance.supplementalPayloadData else { return nil }
        return FlutterStandardTypedData(bytes: bytes)
    }
    
    func getSupplementalCompositeType(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> VNBarcodeCompositeTypeApi {
        guard #available(iOS 17.0, *) else { throw CameraXError(code: "unsupported-error", message: "supplementalCompositeType is not available before iOS 17.0", details: nil) }
        return pigeonInstance.supplementalCompositeType.api
    }
    
    func isGS1DataCarrier(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> Bool {
        guard #available(iOS 17.0, *) else { throw CameraXError(code: "unsupported-error", message: "isGS1DataCarrier is not available before iOS 17.0", details: nil) }
        return pigeonInstance.isGS1DataCarrier
    }
    
    func getSymbology(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> VNBarcodeSymbologyApi {
        return try pigeonInstance.symbology.api
    }
    
    func isColorInverted(pigeonApi: PigeonApiVNBarcodeObservationApi, pigeonInstance: VNBarcodeObservation) throws -> Bool {
        guard #available(iOS 17.0, *) else { throw CameraXError(code: "unsupported-error", message: "isColorInverted is not available before iOS 17.0", details: nil) }
        return pigeonInstance.isColorInverted
    }
}
