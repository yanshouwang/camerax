//
//  AVMetadataObjectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation
import AVFoundation

extension AVMetadataObject.ObjectType {
    var api: AVMetadataObjectTypeApi? {
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
