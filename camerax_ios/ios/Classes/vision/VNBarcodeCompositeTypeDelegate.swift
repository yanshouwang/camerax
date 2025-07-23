//
//  VNBarcodeCompositeTypeDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

@available(iOS 17.0, *)
extension VNBarcodeCompositeType {
    var api: VNBarcodeCompositeTypeApi {
        switch self {
        case .none:
            return .none
        case .linked:
            return .linked
        case .gs1TypeA:
            return .gs1TypeA
        case .gs1TypeB:
            return .gs1TypeB
        case .gs1TypeC:
            return .gs1TypeC
        }
    }
}

@available(iOS 17.0, *)
extension VNBarcodeCompositeTypeApi {
    var delegate: VNBarcodeCompositeType {
        switch self {
        case .none:
            return .none
        case .linked:
            return .linked
        case .gs1TypeA:
            return .gs1TypeA
        case .gs1TypeB:
            return .gs1TypeB
        case .gs1TypeC:
            return .gs1TypeC
        }
    }
}
