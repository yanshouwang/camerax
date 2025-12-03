//
//  VNBarcodeObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNBarcodeObservationDelegate: PigeonApiDelegateVNBarcodeObservationProxyApi {
    func getPayloadStringValue(pigeonApi: PigeonApiVNBarcodeObservationProxyApi, pigeonInstance: VNBarcodeObservation) throws -> String? {
        return pigeonInstance.payloadStringValue
    }
    
    func getSymbology(pigeonApi: PigeonApiVNBarcodeObservationProxyApi, pigeonInstance: VNBarcodeObservation) throws -> VNBarcodeSymbologyApi {
        guard let api = pigeonInstance.symbology.api else {
            throw CameraXError(code: "nil-error", message: "symbology is nil", details: nil)
        }
        return api
    }
}

extension VNBarcodeSymbology {
    var api: VNBarcodeSymbologyApi? {
        if #available(iOS 17.0, *) {
            switch self {
            case .msiPlessey: return .msiPlessey
            default: break
            }
        }
        if #available(iOS 15.0, *) {
            switch self {
            case .codabar: return .codabar
            case .gs1DataBar: return .gs1DataBar
            case .gs1DataBarExpanded: return .gs1DataBarExpanded
            case .gs1DataBarLimited: return .gs1DataBarLimited
            case .microPDF417: return .microPDF417
            case .microQR: return .microQR
            default: break
            }
        }
        return switch self {
        case .aztec: .aztec
        case .code39: .code39
        case .code39Checksum: .code39Checksum
        case .code39FullASCII: .code39FullASCII
        case .code39FullASCIIChecksum: .code39FullASCIIChecksum
        case .code93: .code93
        case .code93i: .code93i
        case .code128: .code128
        case .dataMatrix: .dataMatrix
        case .ean8: .ean8
        case .ean13: .ean13
        case .i2of5: .i2of5
        case .i2of5Checksum: .i2of5Checksum
        case .itf14: .itf14
        case .pdf417: .pdf417
        case .qr: .qr
        case .upce: .upce
        default: nil
        }
    }
}

extension VNBarcodeSymbologyApi {
    var delegate: VNBarcodeSymbology? {
        return switch self {
        case .aztec: .aztec
        case .codabar: if #available(iOS 15.0, *) { .codabar } else { nil }
        case .code39: .code39
        case .code39Checksum: .code39Checksum
        case .code39FullASCII: .code39FullASCII
        case .code39FullASCIIChecksum: .code39FullASCIIChecksum
        case .code93: .code93
        case .code93i: .code93i
        case .code128: .code128
        case .dataMatrix: .dataMatrix
        case .ean8: .ean8
        case .ean13: .ean13
        case .gs1DataBar: if #available(iOS 15.0, *) { .gs1DataBar } else { nil }
        case .gs1DataBarExpanded: if #available(iOS 15.0, *) { .gs1DataBarExpanded } else { nil }
        case .gs1DataBarLimited: if #available(iOS 15.0, *) { .gs1DataBarLimited } else { nil }
        case .i2of5: .i2of5
        case .i2of5Checksum: .i2of5Checksum
        case .itf14: .itf14
        case .microPDF417: if #available(iOS 15.0, *) { .microPDF417 } else { nil }
        case .microQR: if #available(iOS 15.0, *) { .microQR } else { nil }
        case .msiPlessey: if #available(iOS 17.0, *) { .msiPlessey } else { nil }
        case .pdf417: .pdf417
        case .qr: .qr
        case .upce: .upce
        }
    }
}
