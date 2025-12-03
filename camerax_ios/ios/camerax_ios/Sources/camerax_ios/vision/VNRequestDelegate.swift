//
//  VNRequestDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNRequestDelegate: PigeonApiDelegateVNRequestProxyApi {
    func getPreferBackgroundProcessing(pigeonApi: PigeonApiVNRequestProxyApi, pigeonInstance: VNRequest) throws -> Bool {
        return pigeonInstance.preferBackgroundProcessing
    }
    
    func setPreferBackgroundProcessing(pigeonApi: PigeonApiVNRequestProxyApi, pigeonInstance: VNRequest, value: Bool) throws {
        pigeonInstance.preferBackgroundProcessing = value
    }
    
    func getResults(pigeonApi: PigeonApiVNRequestProxyApi, pigeonInstance: VNRequest) throws -> [VNObservation]? {
        return pigeonInstance.results
    }
    
    func cancel(pigeonApi: PigeonApiVNRequestProxyApi, pigeonInstance: VNRequest) throws {
        pigeonInstance.cancel()
    }
}
