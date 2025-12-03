//
//  VNDetectedObjectObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNDetectedObjectObservationDelegate: PigeonApiDelegateVNDetectedObjectObservationProxyApi {
    func getBoundingBox(pigeonApi: PigeonApiVNDetectedObjectObservationProxyApi, pigeonInstance: VNDetectedObjectObservation) throws -> RectF {
        return pigeonInstance.boundingBox.cxRectF
    }
}
