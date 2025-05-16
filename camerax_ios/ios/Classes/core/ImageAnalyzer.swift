//
//  Analyzer.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/8/22.
//

import Foundation
import UIKit
import Vision

class ImageAnalyzer: NSObject, ImageAnalysis.Analyzer {
    private let api: PigeonApiImageAnalyzerApi
    
    init(api: PigeonApiImageAnalyzerApi) {
        self.api = api
    }
    
    public func analyze(_ image: ImageProxy) {
        api.analyze(pigeonInstance: self, image: image) { _ in }
    }
}
