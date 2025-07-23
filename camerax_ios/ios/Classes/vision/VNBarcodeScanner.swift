//
//  VNBarcodeScanner.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/22.
//

import Foundation
import Vision

public class VNBarcodeScanner: VNDetector {
    private var symbologies: [VNBarcodeSymbology]?
    
    init(symbologies: [VNBarcodeSymbology]?) {
        self.symbologies = symbologies
    }
    
    public override func newRequest(completionHandler: @escaping VNRequestCompletionHandler) -> VNRequest {
        let request = VNDetectBarcodesRequest(completionHandler: completionHandler)
        if let symbologies = self.symbologies { request.symbologies = symbologies }
        return request
    }
}
