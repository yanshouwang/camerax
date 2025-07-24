//
//  VNBarcodeSymbologyDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

extension VNBarcodeSymbology {
    var api: VNBarcodeSymbologyApi? {
        if #available(iOS 17.0, *) {
            switch self {
            case .msiPlessey:
                return .msiPlessey
            default:
                break
            }
        }
        if #available(iOS 15.0, *) {
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
        switch self {
        case .aztec:
            return .aztec
        case .code39:
            return .code39
        case .code39Checksum:
            return .code39Checksum
        case .code39FullASCII:
            return .code39FullASCII
        case .code39FullASCIIChecksum:
            return .code39FullASCIIChecksum
        case .code93:
            return .code93
        case .code93i:
            return .code93i
        case .code128:
            return .code128
        case .dataMatrix:
            return .dataMatrix
        case .ean8:
            return .ean8
        case .ean13:
            return .ean13
        case .i2of5:
            return .i2of5
        case .i2of5Checksum:
            return .i2of5Checksum
        case .itf14:
            return .itf14
        case .pdf417:
            return .pdf417
        case .qr:
            return .qr
        case .upce:
            return .upce
        default:
            return nil
        }
    }
}

extension VNBarcodeSymbologyApi {
    var delegate: VNBarcodeSymbology? {
        if #available(iOS 17.0, *) {
            switch self {
            case .msiPlessey:
                return .msiPlessey
            default:
                break
            }
        }
        if #available(iOS 15.0, *) {
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
        switch self {
        case .aztec:
            return .aztec
        case .code39:
            return .code39
        case .code39Checksum:
            return .code39Checksum
        case .code39FullASCII:
            return .code39FullASCII
        case .code39FullASCIIChecksum:
            return .code39FullASCIIChecksum
        case .code93:
            return .code93
        case .code93i:
            return .code93i
        case .code128:
            return .code128
        case .dataMatrix:
            return .dataMatrix
        case .ean8:
            return .ean8
        case .ean13:
            return .ean13
        case .i2of5:
            return .i2of5
        case .i2of5Checksum:
            return .i2of5Checksum
        case .itf14:
            return .itf14
        case .pdf417:
            return .pdf417
        case .qr:
            return .qr
        case .upce:
            return .upce
        default:
            return nil
        }
    }
}
