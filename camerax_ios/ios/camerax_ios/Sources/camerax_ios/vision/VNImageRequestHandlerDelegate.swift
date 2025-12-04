//
//  VNImageRequestHandlerDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNImageRequestHandlerDelegate: PigeonApiDelegateVNImageRequestHandlerProxyApi {
    func url(pigeonApi: PigeonApiVNImageRequestHandlerProxyApi, url: String) throws -> VNImageRequestHandler {
        guard let imageUrl = url.urlDelegateOrNil else {
            throw CameraXError(code: "nil-error", message: "url is nil", details: nil)
        }
        return VNImageRequestHandler(url: imageUrl)
    }
    
    func perform(pigeonApi: PigeonApiVNImageRequestHandlerProxyApi, pigeonInstance: VNImageRequestHandler, requests: [VNRequest]) throws {
        try pigeonInstance.perform(requests)
    }
}
