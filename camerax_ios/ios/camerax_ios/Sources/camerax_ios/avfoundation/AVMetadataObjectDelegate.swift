//
//  AVMetadataObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

class AVMetadataObjectDelegate: PigeonApiDelegateAVMetadataObjectProxyApi {
    func getType(pigeonApi: PigeonApiAVMetadataObjectProxyApi, pigeonInstance: AVMetadataObject) throws -> AVMetadataObjectTypeApi {
        guard let type = pigeonInstance.type.apiOrNil else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return type
    }
    
    func getTime(pigeonApi: PigeonApiAVMetadataObjectProxyApi, pigeonInstance: AVMetadataObject) throws -> Int64 {
        return pigeonInstance.time.api
    }
    
    func getDuration(pigeonApi: PigeonApiAVMetadataObjectProxyApi, pigeonInstance: AVMetadataObject) throws -> Int64 {
        return pigeonInstance.duration.api
    }
    
    func getBounds(pigeonApi: PigeonApiAVMetadataObjectProxyApi, pigeonInstance: AVMetadataObject) throws -> RectF {
        return pigeonInstance.bounds.cxRectF
    }
    
    func isFixedFocus(pigeonApi: PigeonApiAVMetadataObjectProxyApi, pigeonInstance: AVMetadataObject) throws -> Bool {
        if #available(iOS 26.0, *) {
            return pigeonInstance.isFixedFocus
        } else {
            throw CameraXError(code: "unsupported-error", message: "isFixedFocus is only available in iOS 26.0 or newer", details: nil)
        }
    }
    
    func getCinematicVideoFocusMode(pigeonApi: PigeonApiAVMetadataObjectProxyApi, pigeonInstance: AVMetadataObject) throws -> AVCaptureDeviceCinematicVideoFocusModeApi {
        if #available(iOS 26.0, *) {
            guard let mode = pigeonInstance.cinematicVideoFocusMode.apiOrNil else {
                throw CameraXError(code: "nil-error", message: "cinematicVideoFocusMode is nil", details: nil)
            }
            return mode
        } else {
            throw CameraXError(code: "unsupported-error", message: "cinematicVideoFocusMode is only available in iOS 26.0 or newer", details: nil)
        }
    }
    
    func getGroupID(pigeonApi: PigeonApiAVMetadataObjectProxyApi, pigeonInstance: AVMetadataObject) throws -> Int64 {
        if #available(iOS 26.0, *) {
            return Int64(pigeonInstance.groupID)
        } else {
            throw CameraXError(code: "unsupported-error", message: "groupID is only available in iOS 26.0 or newer", details: nil)
        }
    }
    
    func getObjectID(pigeonApi: PigeonApiAVMetadataObjectProxyApi, pigeonInstance: AVMetadataObject) throws -> Int64 {
        if let salientObject = pigeonInstance as? AVMetadataSalientObject {
            return Int64(salientObject.objectID)
        } else if #available(iOS 26.0, *) {
            return Int64(pigeonInstance.objectID)
        } else {
            throw CameraXError(code: "unsupported-error", message: "groupID is only available in iOS 26.0 or newer", details: nil)
        }
    }
}

extension AVMetadataObject.ObjectType {
    var apiOrNil: AVMetadataObjectTypeApi? {
        if #available(iOS 26.0, *) {
            switch self {
            case .dogHead: return .dogHead
            case .catHead: return .catHead
            default: break
            }
        }
        if #available(iOS 17.0, *) {
            switch self {
            case .humanFullBody: return .humanFullBody
            default: break
            }
        }
        if #available(iOS 15.4, *) {
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
        case .humanBody: .humanBody
        case .dogBody: .dogBody
        case .catBody: .catBody
        case .salientObject: .salientObject
        case .code39: .code39
        case .code39Mod43: .code39Mod43
        case .code93: .code93
        case .code128: .code128
        case .ean8: .ean8
        case .ean13: .ean13
        case .interleaved2of5: .interleaved2of5
        case .itf14: .itf14
        case .upce:.upce
        case .aztec: .aztec
        case .dataMatrix: .dataMatrix
        case .pdf417: .pdf417
        case .qr: .qr
        case .face: .face
        default: nil
        }
    }
}

extension AVMetadataObjectTypeApi {
    var delegateOrNil: AVMetadataObject.ObjectType? {
        return switch self {
        case .codabar: if #available(iOS 15.4, *) { .codabar } else { nil }
        case .code39: .code39
        case .code39Mod43: .code39Mod43
        case .code93: .code93
        case .code128: .code128
        case .ean8: .ean8
        case .ean13: .ean13
        case .gs1DataBar: if #available(iOS 15.4, *) { .gs1DataBar } else { nil }
        case .gs1DataBarExpanded: if #available(iOS 15.4, *) { .gs1DataBarExpanded } else { nil }
        case .gs1DataBarLimited: if #available(iOS 15.4, *) { .gs1DataBarLimited } else { nil }
        case .interleaved2of5: .interleaved2of5
        case .itf14: .itf14
        case .upce: .upce
        case .aztec: .aztec
        case .dataMatrix: .dataMatrix
        case .microPDF417: if #available(iOS 15.4, *) { .microPDF417 } else { nil }
        case .microQR: if #available(iOS 15.4, *) { .microQR } else { nil }
        case .pdf417: .pdf417
        case .qr: .qr
        case .humanBody: .humanBody
        case .humanFullBody: if #available(iOS 17.0, *) { .humanFullBody } else { nil }
        case .dogHead: if #available(iOS 26.0, *) { .dogHead } else { nil }
        case .dogBody: .dogBody
        case .catHead: if #available(iOS 26.0, *) { .catHead } else { nil }
        case .catBody: .catBody
        case .face: .face
        case .salientObject: .salientObject
        }
    }
}
