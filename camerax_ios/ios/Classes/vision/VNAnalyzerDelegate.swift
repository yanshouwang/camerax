//
//  VNAnalyzerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

class VNAnalyzerDelegate: PigeonApiDelegateVNAnalyzerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVNAnalyzerApi, detectors: [VNDetector], consumer: VNAnalyzerResultConsumer) throws -> VNAnalyzer {
        return VNAnalyzer(detectors: detectors, consumer: consumer)
    }
    
    class ResultDelegate: PigeonApiDelegateVNAnalyzerResultApi {
        func timestamp(pigeonApi: PigeonApiVNAnalyzerResultApi, pigeonInstance: VNAnalyzer.Result) throws -> Int64 {
            let timestamp = pigeonInstance.getTimestamp()
            return Int64(timestamp.seconds * 1000)
        }
        
        func getBarcodes(pigeonApi: PigeonApiVNAnalyzerResultApi, pigeonInstance: VNAnalyzer.Result, detector: VNBarcodeScanner) throws -> [VNBarcodeObservation]? {
            return try pigeonInstance.getValue(detector) as? [VNBarcodeObservation]
        }
        
        func getError(pigeonApi: PigeonApiVNAnalyzerResultApi, pigeonInstance: VNAnalyzer.Result, detector: VNDetector) throws -> [Any?]? {
            guard let error = try pigeonInstance.getError(detector) else { return nil }
            return wrap(error)
        }
    }
}
