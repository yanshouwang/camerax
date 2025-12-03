//
//  VNImageBasedRequestDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNImageBasedRequestDelegate: PigeonApiDelegateVNImageBasedRequestProxyApi {
    func getRegionOfInterest(pigeonApi: PigeonApiVNImageBasedRequestProxyApi, pigeonInstance: VNImageBasedRequest) throws -> RectF {
        return pigeonInstance.regionOfInterest.cxRectF
    }
    
    func setRegionOfInterest(pigeonApi: PigeonApiVNImageBasedRequestProxyApi, pigeonInstance: VNImageBasedRequest, value: RectF) throws {
        pigeonInstance.regionOfInterest = value.cgRect
    }
}
