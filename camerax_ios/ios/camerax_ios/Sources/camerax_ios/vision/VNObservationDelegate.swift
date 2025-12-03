//
//  VNObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNObservationDelegate: PigeonApiDelegateVNObservationProxyApi {
    func getConfidence(pigeonApi: PigeonApiVNObservationProxyApi, pigeonInstance: VNObservation) throws -> Double {
        return Double(pigeonInstance.confidence)
    }
}
