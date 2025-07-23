//
//  VNObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

class VNObservationDelegate: PigeonApiDelegateVNObservationApi {
    func getUUID(pigeonApi: PigeonApiVNObservationApi, pigeonInstance: VNObservation) throws -> String {
        return pigeonInstance.uuid.uuidString
    }
    
    func getConfidence(pigeonApi: PigeonApiVNObservationApi, pigeonInstance: VNObservation) throws -> Double {
        return Double(pigeonInstance.confidence)
    }
}
