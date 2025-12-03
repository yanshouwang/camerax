//
//  VNDetectBarcodesRequestDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/12/2.
//

import Vision

class VNDetectBarcodesRequestDelegate: PigeonApiDelegateVNDetectBarcodesRequestProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiVNDetectBarcodesRequestProxyApi) throws -> VNDetectBarcodesRequest {
        return VNDetectBarcodesRequest() {
            let api = pigeonApi.pigeonApiVNImageBasedRequestProxyApi.pigeonApiVNRequestProxyApi
            let request = $0
            let error: [Any?]? = if let $1NotNull = $1 { wrap($1NotNull) } else { nil }
            api.completionHandler(pigeonInstance: request, arg1: error) { _ in }
        }
    }
    
    func getSupportedSymbologies(pigeonApi: PigeonApiVNDetectBarcodesRequestProxyApi, pigeonInstance: VNDetectBarcodesRequest) throws -> [VNBarcodeSymbologyApi] {
        return if #available(iOS 15.0, *) {
            try pigeonInstance.supportedSymbologies().compactMap() { $0.api }
        } else {
            VNDetectBarcodesRequest.supportedSymbologies.compactMap() { $0.api }
        }
    }
    
    func getSymbologies(pigeonApi: PigeonApiVNDetectBarcodesRequestProxyApi, pigeonInstance: VNDetectBarcodesRequest) throws -> [VNBarcodeSymbologyApi] {
        return pigeonInstance.symbologies.compactMap() { $0.api }
    }
    
    func setSymbologies(pigeonApi: PigeonApiVNDetectBarcodesRequestProxyApi, pigeonInstance: VNDetectBarcodesRequest, value: [VNBarcodeSymbologyApi]) throws {
        pigeonInstance.symbologies = value.compactMap() { $0.delegate }
    }
    
    func getResults(pigeonApi: PigeonApiVNDetectBarcodesRequestProxyApi, pigeonInstance: VNDetectBarcodesRequest) throws -> [VNBarcodeObservation]? {
        return pigeonInstance.results
    }
}
