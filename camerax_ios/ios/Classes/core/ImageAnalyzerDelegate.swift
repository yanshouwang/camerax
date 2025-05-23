//
//  ImageAnalysisDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

class ImageAnalyzerDelegate: PigeonApiDelegateImageAnalyzerApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiImageAnalyzerApi) throws -> any ImageAnalysis.Analyzer {
        return ImageAnalyzer(api: pigeonApi)
    }
}

class ImageAnalyzer: NSObject, ImageAnalysis.Analyzer {
    private let api: PigeonApiImageAnalyzerApi
    
    init(api: PigeonApiImageAnalyzerApi) {
        self.api = api
    }
    
    public func analyze(_ image: ImageProxy) {
        api.analyze(pigeonInstance: self, image: image) { _ in }
    }
}
