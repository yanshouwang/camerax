//
//  VNFaceObservationDelegate.swift
//  Pods
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNFaceLandmarkRegionDelegate: PigeonApiDelegateVNFaceLandmarkRegionProxyApi {
    func getPointCount(pigeonApi: PigeonApiVNFaceLandmarkRegionProxyApi, pigeonInstance: VNFaceLandmarkRegion) throws -> Int64 {
        return Int64(pigeonInstance.pointCount)
    }
}

class VNFaceLandmarkRegion2DDelegate: PigeonApiDelegateVNFaceLandmarkRegion2DProxyApi {
    func getNormalizedPoints(pigeonApi: PigeonApiVNFaceLandmarkRegion2DProxyApi, pigeonInstance: VNFaceLandmarkRegion2D) throws -> [PointF] {
        return pigeonInstance.normalizedPoints.map() { $0.cxPointF }
    }
    
    func getPrecisionEstimatesPerPoint(pigeonApi: PigeonApiVNFaceLandmarkRegion2DProxyApi, pigeonInstance: VNFaceLandmarkRegion2D) throws -> [Double]? {
        return pigeonInstance.precisionEstimatesPerPoint?.map() { Double($0) }
    }
    
    func pointsInImage(pigeonApi: PigeonApiVNFaceLandmarkRegion2DProxyApi, pigeonInstance: VNFaceLandmarkRegion2D, imageSize: Size) throws -> [PointF] {
        return pigeonInstance.pointsInImage(imageSize: imageSize.cgSize).map() { $0.cxPointF }
    }
}

class VNFaceLandmarksDelegate: PigeonApiDelegateVNFaceLandmarksProxyApi {
    func getConfidence(pigeonApi: PigeonApiVNFaceLandmarksProxyApi, pigeonInstance: VNFaceLandmarks) throws -> Double {
        return Double(pigeonInstance.confidence)
    }
}

class VNFaceLandmarks2DDelegate: PigeonApiDelegateVNFaceLandmarks2DProxyApi {
    func getAllPoints(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.allPoints
    }
    
    func getFaceContour(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.faceContour
    }
    
    func getLeftEye(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.leftEye
    }
    
    func getRightEye(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.rightEye
    }
    
    func getLeftEyebrow(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.leftEyebrow
    }
    
    func getRightEyebrow(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.rightEyebrow
    }
    
    func getNose(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.nose
    }
    
    func getNoseCrest(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.noseCrest
    }
    
    func getMedianLine(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.medianLine
    }
    
    func getOuterLips(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.outerLips
    }
    
    func getInnerLips(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.innerLips
    }
    
    func getLeftPupil(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.leftPupil
    }
    
    func getRightPupil(pigeonApi: PigeonApiVNFaceLandmarks2DProxyApi, pigeonInstance: VNFaceLandmarks2D) throws -> VNFaceLandmarkRegion2D? {
        return pigeonInstance.rightPupil
    }
}

class VNFaceObservationDelegate: PigeonApiDelegateVNFaceObservationProxyApi {
    func getLandmarks(pigeonApi: PigeonApiVNFaceObservationProxyApi, pigeonInstance: VNFaceObservation) throws -> VNFaceLandmarks2D? {
        return pigeonInstance.landmarks
    }
    
    func getRoll(pigeonApi: PigeonApiVNFaceObservationProxyApi, pigeonInstance: VNFaceObservation) throws -> Double? {
        return pigeonInstance.roll?.doubleValue
    }
    
    func getYaw(pigeonApi: PigeonApiVNFaceObservationProxyApi, pigeonInstance: VNFaceObservation) throws -> Double? {
        return pigeonInstance.yaw?.doubleValue
    }
    
    func getPitch(pigeonApi: PigeonApiVNFaceObservationProxyApi, pigeonInstance: VNFaceObservation) throws -> Double? {
        return if #available(iOS 15.0, *) { pigeonInstance.pitch?.doubleValue }
        else { throw CameraXError(code: "unsupported-error", message: "pitch is only available in iOS 15.0 or newer", details: nil) }
    }
}
