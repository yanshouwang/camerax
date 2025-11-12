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
        guard let api = pigeonInstance.type.api else {
            throw CameraXError(code: "nil-error", message: "type is nil", details: nil)
        }
        return api
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
            return pigeonInstance.cinematicVideoFocusMode.api
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
        if #available(iOS 13.0, *), let instance = pigeonInstance as? AVMetadataSalientObject {
            return Int64(instance.objectID)
        } else if #available(iOS 26.0, *) {
            return Int64(pigeonInstance.objectID)
        } else {
            throw CameraXError(code: "unsupported-error", message: "groupID is only available in iOS 26.0 or newer", details: nil)
        }
    }
}

extension AVMetadataObject.ObjectType {
    var api: AVMetadataObjectTypeApi? {
        if #available(iOS 26.0, *) {
            switch self {
            case .dogHead:
                return .dogHead
            case .catHead:
                return .catHead
            default:
                break
            }
        }
        if #available(iOS 17.0, *) {
            switch self {
            case .humanFullBody:
                return .humanFullBody
            default:
                break
            }
        }
        if #available(iOS 15.4, *) {
            switch self {
            case .codabar:
                return .codabar
            case .gs1DataBar:
                return .gs1DataBar
            case .gs1DataBarExpanded:
                return .gs1DataBarExpanded
            case .gs1DataBarLimited:
                return .gs1DataBarLimited
            case .microPDF417:
                return .microPDF417
            case .microQR:
                return .microQR
            default:
                break
            }
        }
        if #available(iOS 13.0, *) {
            switch self {
            case .humanBody:
                return .humanBody
            case .dogBody:
                return .dogBody
            case .catBody:
                return .catBody
            case .salientObject:
                return .salientObject
            default:
                break
            }
        }
        switch self {
        case .code39:
            return .code39
        case .code39Mod43:
            return .code39Mod43
        case .code93:
            return .code93
        case .code128:
            return .code128
        case .ean8:
            return .ean8
        case .ean13:
            return .ean13
        case .interleaved2of5:
            return .interleaved2of5
        case .itf14:
            return .itf14
        case .upce:
            return .upce
        case .aztec:
            return .aztec
        case .dataMatrix:
            return .dataMatrix
        case .pdf417:
            return .pdf417
        case .qr:
            return .qr
        case .face:
            return .face
        default:
            return nil
        }
    }
}

extension AVMetadataObjectTypeApi {
    var impl: AVMetadataObject.ObjectType? {
        if #available(iOS 26.0, *) {
            switch self {
            case .dogHead:
                return .dogHead
            case .catHead:
                return .catHead
            default:
                break
            }
        }
        if #available(iOS 17.0, *) {
            switch self {
            case .humanFullBody:
                return .humanFullBody
            default:
                break
            }
        }
        if #available(iOS 15.4, *) {
            switch self {
            case .codabar:
                return .codabar
            case .gs1DataBar:
                return .gs1DataBar
            case .gs1DataBarExpanded:
                return .gs1DataBarExpanded
            case .gs1DataBarLimited:
                return .gs1DataBarLimited
            case .microPDF417:
                return .microPDF417
            case .microQR:
                return .microQR
            default:
                break
            }
        }
        if #available(iOS 13.0, *) {
            switch self {
            case .humanBody:
                return .humanBody
            case .dogBody:
                return .dogBody
            case .catBody:
                return .catBody
            case .salientObject:
                return .salientObject
            default:
                break
            }
        }
        switch self {
        case .code39:
            return .code39
        case .code39Mod43:
            return .code39Mod43
        case .code93:
            return .code93
        case .code128:
            return .code128
        case .ean8:
            return .ean8
        case .ean13:
            return .ean13
        case .interleaved2of5:
            return .interleaved2of5
        case .itf14:
            return .itf14
        case .upce:
            return .upce
        case .aztec:
            return .aztec
        case .dataMatrix:
            return .dataMatrix
        case .pdf417:
            return .pdf417
        case .qr:
            return .qr
        case .face:
            return .face
        default:
            return nil
        }
    }
}
