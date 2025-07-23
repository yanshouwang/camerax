//
//  VNDetectedObjectObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

class VNDetectedObjectObservationDelegate: PigeonApiDelegateVNDetectedObjectObservationApi {
    func getBoundingBox(pigeonApi: PigeonApiVNDetectedObjectObservationApi, pigeonInstance: VNDetectedObjectObservation) throws -> Rect {
        return pigeonInstance.boundingBox.cxRect
    }
}
