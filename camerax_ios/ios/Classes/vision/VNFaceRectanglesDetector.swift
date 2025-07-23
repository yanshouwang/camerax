//
//  VNFaceRectanglesDetector.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation
import Vision

class VNFaceRectanglesDetector: VNDetector {
    override func newRequest(completionHandler: @escaping VNRequestCompletionHandler) -> VNRequest {
        return VNDetectFaceRectanglesRequest(completionHandler: completionHandler)
    }
}
