//
//  VNDetectFaceRectanglesRequestDelegate.swift
//  Pods
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNDetectFaceRectanglesRequestDelegate: PigeonApiDelegateVNDetectFaceRectanglesRequestProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVNDetectFaceRectanglesRequestProxyApi) throws -> VNDetectFaceRectanglesRequest {
        return VNDetectFaceRectanglesRequest() {
            let api = pigeonApi.pigeonApiVNImageBasedRequestProxyApi.pigeonApiVNRequestProxyApi
            let request = $0
            let error: [Any?]? = if let $1NotNull = $1 { wrap($1NotNull) } else { nil }
            api.completionHandler(pigeonInstance: request, arg1: error) { _ in }
        }
    }
    
    func getResults(pigeonApi: PigeonApiVNDetectFaceRectanglesRequestProxyApi, pigeonInstance: VNDetectFaceRectanglesRequest) throws -> [VNFaceObservation]? {
        return pigeonInstance.results
    }
}
