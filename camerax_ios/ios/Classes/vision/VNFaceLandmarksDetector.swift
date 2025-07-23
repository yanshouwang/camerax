//
//  VNFaceLandmarksDetector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

class VNFaceLandmarksDetector: VNDetector {
    override func newRequest(completionHandler: @escaping VNRequestCompletionHandler) -> VNRequest {
        return VNDetectFaceLandmarksRequest(completionHandler: completionHandler)
    }
}
