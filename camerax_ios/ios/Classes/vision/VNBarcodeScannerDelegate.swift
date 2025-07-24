//
//  VNBarcodeScannerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

class VNBarcodeScannerDelegate: PigeonApiDelegateVNBarcodeScannerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVNBarcodeScannerApi, symbologies: [VNBarcodeSymbologyApi]?) throws -> VNBarcodeScanner {
        return VNBarcodeScanner(symbologies: symbologies?.map { $0.delegate }.compactMap { $0 })
    }
}
