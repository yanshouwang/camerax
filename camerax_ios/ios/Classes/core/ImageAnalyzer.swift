//
//  ImageAnalyzer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class ImageAnalyzer: ImageAnalysis.Analyzer {
    private let api: PigeonApiImageAnalyzerApi
    
    init(api: PigeonApiImageAnalyzerApi) {
        self.api = api
    }
    
    public override func analyze(_ image: ImageProxy) {
        api.analyze(pigeonInstance: self, image: image) { _ in }
    }
}
