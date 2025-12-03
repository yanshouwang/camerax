//
//  VNRectangleObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNRectangleObservationDelegate: PigeonApiDelegateVNRectangleObservationProxyApi {
    func getBottomLeft(pigeonApi: PigeonApiVNRectangleObservationProxyApi, pigeonInstance: VNRectangleObservation) throws -> PointF {
        return pigeonInstance.bottomLeft.cxPointF
    }
    
    func getBottomRight(pigeonApi: PigeonApiVNRectangleObservationProxyApi, pigeonInstance: VNRectangleObservation) throws -> PointF {
        return pigeonInstance.bottomRight.cxPointF
    }
    
    func getTopLeft(pigeonApi: PigeonApiVNRectangleObservationProxyApi, pigeonInstance: VNRectangleObservation) throws -> PointF {
        return pigeonInstance.topLeft.cxPointF
    }
    
    func getTopRight(pigeonApi: PigeonApiVNRectangleObservationProxyApi, pigeonInstance: VNRectangleObservation) throws -> PointF {
        return pigeonInstance.topRight.cxPointF
    }
}
