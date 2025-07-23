//
//  VNRectangleObservationDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

class VNRectangleObservationDelegate: PigeonApiDelegateVNRectangleObservationApi {
    func getBottomLeft(pigeonApi: PigeonApiVNRectangleObservationApi, pigeonInstance: VNRectangleObservation) throws -> Point {
        return pigeonInstance.bottomLeft.cxPoint
    }
    
    func getBottomRight(pigeonApi: PigeonApiVNRectangleObservationApi, pigeonInstance: VNRectangleObservation) throws -> Point {
        return pigeonInstance.bottomRight.cxPoint
    }
    
    func getTopLeft(pigeonApi: PigeonApiVNRectangleObservationApi, pigeonInstance: VNRectangleObservation) throws -> Point {
        return pigeonInstance.topLeft.cxPoint
    }
    
    func getTopRight(pigeonApi: PigeonApiVNRectangleObservationApi, pigeonInstance: VNRectangleObservation) throws -> Point {
        return pigeonInstance.topRight.cxPoint
    }
}
