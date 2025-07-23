//
//  VNBarcodeScannerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation

class VNBarcodeScannerDelegate: PigeonApiDelegateVNBarcodeScannerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVNBarcodeScannerApi, symbologies: [VNBarcodeSymbologyApi]?) throws -> VNBarcodeScanner {
        return VNBarcodeScanner(symbologies: try symbologies?.map { try $0.delegate })
    }
}
